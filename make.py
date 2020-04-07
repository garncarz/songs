#!/usr/bin/env python3

import importlib.util
import os

import click
import colorama


SRC_DIR = 'src'
SRC_PY_DIR = 'src.py'
OUT_DIR = 'out'


@click.group()
def cli():
    pass


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


@cli.command(help='Compiles LilyPond sources to MIDI & PDF.')
def lilypond():
    files = filter(lambda f: f.endswith('.ly'), os.listdir(SRC_DIR))
    for ly in files:
        info_file(ly)
        midi = out_file(ly, 'midi')
        mid = out_file(ly, 'mid')  # happens on Windows
        ly = in_file(ly)
        if is_newer(ly, midi) and is_newer(ly, mid):
            run('cd %s && lilypond %s' % (OUT_DIR, os.path.abspath(ly)))


@cli.command(help='Compiles MuseScore sources to MIDI & PDF.')
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


@cli.command(help='Compiles Python sources to MIDI.')
@click.argument('filename', required=False)
def python(filename=None):
    if filename:
        files = [filename]
    else:
        files = filter(lambda f: f.endswith('.py'), os.listdir(SRC_PY_DIR))

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


@cli.command(help='Renders MIDI files to OGG/FLAC.')
# TODO option for OGG/FLAC
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


@cli.command(help='Creates PNG thumbnails for PDFs.')
def imagemagick():
    files = filter(lambda f: f.endswith('.pdf'), os.listdir(OUT_DIR))
    for pdf in files:
        info_file(pdf)
        pdf = out_file(pdf)
        png = out_file(pdf, 'png')
        if is_newer(pdf, png):
            run('convert -density 400 -background white -alpha remove '
                '%s[0] %s' % (pdf, png))


if __name__ == '__main__':
    os.makedirs(OUT_DIR, exist_ok=True)
    cli()
