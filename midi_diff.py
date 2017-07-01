#!/usr/bin/env python3

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


orig = extract_notes('midi/04-prokrastinacni_orgie.midi')
generated = extract_notes('po.midi')

ddiff = deepdiff.DeepDiff(orig, generated, ignore_order=True, significant_digits=0)
assert not ddiff