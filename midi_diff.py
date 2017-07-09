#!/usr/bin/env python3

import os
from pprint import pprint

import mido


TIME_EPSILON = 5


def extract_notes(filename):
    mid = mido.MidiFile(filename)
    notes = []
    time = 0
    for track in mid.tracks:
        for msg in track:
            try:
                time += msg.time / mid.ticks_per_beat
                if msg.is_meta:
                    continue
                if msg.channel == 9:  # percussion
                    continue
                if msg.type == 'note_on' and msg.velocity:
                    notes.append({'time': time, 'note': msg.note, 'channel': msg.channel})
            except Exception as e:
                print(e)
    return notes


def _normalize_times(notes1, notes2):
    def find(cmp_func, notes):
        return cmp_func(map(lambda n: n['time'], notes))

    ratio2to1 = (find(max, notes1) - find(min, notes1)) / \
                (find(max, notes2) - find(min, notes2))
    for note in notes1:
        note['time'] *= ratio2to1

    shift2to1 = find(min, notes2) - find(min, notes1)
    for note in notes1:
        note['time'] += shift2to1


def notes_diff(notes1, notes2):
    notes1_extra = []
    for n1 in notes1:
        for n2 in notes2:
            if n1['note'] == n2['note'] and \
                    abs(n1['time'] - n2['time']) < TIME_EPSILON:
                break
        else:
            notes1_extra.append(n1)
    return notes1_extra


def diff(filename1, filename2, normalize_times=True):
    notes1 = extract_notes(filename1)
    notes2 = extract_notes(filename2)

    if normalize_times:
        _normalize_times(notes1, notes2)

    notes1_extra = notes_diff(notes1, notes2)
    notes2_extra = notes_diff(notes2, notes1)

    return {'notes1_extra': notes1_extra, 'notes2_extra': notes2_extra}


def main():
    error = False

    for filename in filter(lambda f: f.endswith('.midi'), os.listdir('midi')):
        filename_orig = os.path.join('midi', filename)
        if not os.path.exists(filename):
            filename = os.path.join('out', filename)
            if not os.path.exists(filename):
                continue

        print('Comparing %s to %s...' % (filename, filename_orig))
        d = diff(filename_orig, filename)
        pprint(d)

        if any(d.values()):
            error = True

    if error:
        raise Exception('MIDI mismatch!')


if __name__ == '__main__':
    main()