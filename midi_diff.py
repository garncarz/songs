#!/usr/bin/env python3

import os

import deepdiff
import mido


def extract_notes(filename):
    mid = mido.MidiFile(filename)
    notes = []
    time = 0
    for msg in mid:
        time += msg.time
        if msg.type == 'note_on' and msg.velocity:
            notes.append({'time': time, 'note': msg.note})
    return notes


def diff(filename1, filename2):
    notes1 = extract_notes(filename1)
    notes2 = extract_notes(filename2)
    return deepdiff.DeepDiff(notes1, notes2, ignore_order=True, significant_digits=0)


def main():
    error = False

    for filename in filter(lambda f: f.endswith('.midi'), os.listdir('midi')):
        if os.path.exists(filename):
            filename_orig = os.path.join('midi', filename)
            print('Comparing %s to %s...' % (filename, filename_orig))
            d = diff(filename_orig, filename)
            print(d)
            if d:
                error = True
    if error:
        raise Exception('MIDI mismatch!')


if __name__ == '__main__':
    main()