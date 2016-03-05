#!/usr/bin/env python3

import os
import colorama

OUT = 'out'

def info(msg):
    print(colorama.Fore.BLUE + msg + colorama.Fore.RESET)

def info_file(filename):
    info('Processing %s...' % filename)

def run(cmd):
    return os.system(cmd)


def out_file(filename, ext=None):
    new_file = filename if not ext \
               else '%s.%s' % (os.path.splitext(filename)[0], ext)
    return new_file if filename.startswith(OUT) \
           else os.path.join(OUT, new_file)

def is_newer(file1, file2):
    return not os.path.exists(file2) or \
           os.path.getmtime(file1) > os.path.getmtime(file2)


def lilypond():
    files = filter(lambda f: f.endswith('.ly'), os.listdir('.'))
    for ly in files:
        info_file(ly)
        midi = out_file(ly, 'midi')
        if is_newer(ly, midi):
            run('cd %s && lilypond %s' % (OUT, os.path.abspath(ly)))

def mscore():
    files = filter(lambda f: f.endswith('.mscz'), os.listdir('.'))
    for ms in files:
        info_file(ms)
        midi = out_file(ms, 'mid')  # MuseScore doesn't recognise .midi, cool
        if is_newer(ms, midi):
            run('mscore %s -o %s' % (ms, midi))
        pdf = out_file(ms, 'pdf')
        if is_newer(ms, pdf):
            run('mscore %s -o %s' % (ms, pdf))

def timidity():
    files = filter(lambda f: f.endswith('.midi') or f.endswith('.mid'),
                   os.listdir(OUT))
    for midi in files:
        info_file(midi)
        midi = out_file(midi)
        ogg = out_file(midi, 'ogg')
        if is_newer(midi, ogg):
            run('timidity %s -Ov -o %s' % (midi, ogg))

def imagemagick():
    files = filter(lambda f: f.endswith('.pdf'), os.listdir(OUT))
    for pdf in files:
        info_file(pdf)
        pdf = out_file(pdf)
        png = out_file(pdf, 'png')
        if is_newer(pdf, png):
            run('convert -thumbnail x300 -background white -alpha remove '
                '%s[0] %s' % (pdf, png))


def main():
    lilypond()
    mscore()
    timidity()
    imagemagick()

if __name__ == '__main__':
    os.makedirs(OUT, exist_ok=True)
    main()
