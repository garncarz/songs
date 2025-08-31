#!/usr/bin/env python3

import importlib.util
import os
import sys

import colorama


SRC_DIR = 'src'
SRC_PY_DIR = 'src.py'
OUT_DIR = 'out'


def info(msg):
    try:
        print(colorama.Fore.BLUE + msg + colorama.Fore.RESET)
    except Exception:
        # TODO UnicodeEncodeError: 'utf-8' codec can't encode characters in position ...: surrogates not allowed
        pass


def info_file(filename):
    info('Processing %s...' % filename)


def run(cmd):
    return os.system(cmd)


def in_file(filename):
    return os.path.join(SRC_DIR, filename)


def out_file(filename, ext=None):
    new_file = filename if not ext \
               else '%s.%s' % (os.path.splitext(filename)[0], ext)
    return new_file if filename.startswith(OUT_DIR) \
           else os.path.join(OUT_DIR, new_file)


def is_newer(file1, file2):
    return not os.path.exists(file2) or \
           os.path.getmtime(file1) > os.path.getmtime(file2)


def lilypond():
    files = filter(lambda f: f.endswith('.ly'), os.listdir(SRC_DIR))
    for ly in files:
        info_file(ly)
        midi = out_file(ly, 'midi')
        mid = out_file(ly, 'mid')  # happens on Windows
        ly = in_file(ly)
        if is_newer(ly, midi) and is_newer(ly, mid):
            run('cd %s && lilypond %s' % (OUT_DIR, os.path.abspath(ly)))


def mscore():
    files = filter(lambda f: f.endswith('.mscz') or f.endswith('.mscx'),
                   os.listdir(SRC_DIR))
    for ms in files:
        info_file(ms)
        midi = out_file(ms, 'mid')  # MuseScore doesn't recognise .midi, cool
        ms = in_file(ms)
        if is_newer(ms, midi):
            run('mscore %s -o %s' % (ms, midi))
        pdf = out_file(ms, 'pdf')
        if is_newer(ms, pdf):
            run('mscore %s -o %s' % (ms, pdf))


def python(song_filter=None):
    files = filter(lambda f: f.endswith('.py'), os.listdir(SRC_PY_DIR))
    
    # If a song filter is provided, filter files that start with the pattern
    if song_filter:
        files = filter(lambda f: f.startswith(song_filter + '-'), files)
    
    for py in files:
        info_file(py)
        midi = out_file(py, 'midi')
        py = os.path.join(SRC_PY_DIR, py)

        spec = importlib.util.spec_from_file_location('song_module', py)
        song_module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(song_module)
        song_module.make()

        if hasattr(song_module, 'songs'):
            midi = os.path.splitext(midi)[0] + '-%s.midi'
            for name, song in song_module.songs.items():
                song.save(midi % name)
        else:
            song_module.song.save(midi)


def timidity():
    files = filter(lambda f: f.endswith('.midi') or f.endswith('.mid'),
                   os.listdir(OUT_DIR))
    for midi in files:
        info_file(midi)
        midi = out_file(midi)
        ogg = out_file(midi, 'ogg')
        flac = out_file(midi, 'flac')
        if is_newer(midi, flac):
            run('timidity %s -OF -o %s' % (midi, flac))


def imagemagick():
    files = filter(lambda f: f.endswith('.pdf'), os.listdir(OUT_DIR))
    for pdf in files:
        info_file(pdf)
        pdf = out_file(pdf)
        png = out_file(pdf, 'png')
        if is_newer(pdf, png):
            run('convert -density 400 -background white -alpha remove '
                '%s[0] %s' % (pdf, png))


def main(processor=None, song_filter=None):
    if processor == 'python':
        python(song_filter)
    elif processor == 'lilypond':
        lilypond()
    elif processor == 'mscore':
        mscore()
    elif processor == 'timidity':
        timidity()
    elif processor == 'imagemagick':
        imagemagick()
    elif processor is None:
        # Default behavior - run all processors
        lilypond()
        mscore()
        python()
        timidity()
        imagemagick()
    else:
        print(f"Unknown processor: {processor}")
        print("Available processors: python, lilypond, mscore, timidity, imagemagick")
        sys.exit(1)


def show_help():
    print("Usage: ./make.py [processor] [song_filter]")
    print("")
    print("Processors:")
    print("  python      Process Python songs (.py files)")
    print("  lilypond    Process LilyPond files (.ly files)")
    print("  mscore      Process MuseScore files (.mscz/.mscx files)")
    print("  timidity    Convert MIDI to audio files")
    print("  imagemagick Convert PDF to images")
    print("")
    print("Examples:")
    print("  ./make.py                 # Process all song types")
    print("  ./make.py python          # Process only Python songs")
    print("  ./make.py python 02       # Process only song 02-zpev_h-moll.py")
    print("  ./make.py lilypond        # Process only LilyPond files")


if __name__ == '__main__':
    os.makedirs(OUT_DIR, exist_ok=True)
    
    # Parse command line arguments
    processor = None
    song_filter = None
    
    if len(sys.argv) > 1:
        processor = sys.argv[1]
        
        # Check for help option
        if processor in ['-h', '--help', 'help']:
            show_help()
            sys.exit(0)
        
        # If additional argument provided for song filtering
        if len(sys.argv) > 2:
            song_filter = sys.argv[2]
    
    main(processor, song_filter)
