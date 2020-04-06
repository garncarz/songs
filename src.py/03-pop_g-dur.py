from copy import deepcopy
from itertools import cycle, chain

from midi_lib import *


g_major = Scale('g', 'major')


def line(*tones, beats):
    if isinstance(beats, list):
        return list(zip(tones, cycle(beats)))
    return list(map(lambda t: (t, beats), tones))


def chopped_line(*chords, times, beats=2):
    for chord in chords:
        for _ in range(times):
            yield (chord, beats/times)


def repeat(pattern, times):
    return chain(pattern * times)


def piano_line():
    ending = [([-1, 1, 4], .5), ([-1, 1, 4], 1.5), ([-3, -1, 1], 2)]
    verse_1 = line(
        0, 2, 0, -3, [0, 2], 3, [2, 4], 3, [1, 4], 0,
        [-1, 1], 0, [-3, -1], 0, [-1, 1], 0,
        [0, 2], -1, [-2, 0], -1, [0, 2], 4, [2, 5], 4,
        beats=[3/4, 1/4],
    ) + ending
    verse_2 = line(
        [0, 2], -2, [-3, 0], -2, [0, 2], 3, [2, 4], 3,
        [1, 4], 0, [-1, 1], 0, [-3, -1], 0, [-1, 1], 0,
        [0, 2], -1, [-2, 0], -1, [0, 2], 4, [2, 5], 4,
        beats=[3/4, 1/4],
    ) + ending

    # TODO make nicer, a lot nicer... abstract as much as possible
    verse_2_vol_up = deepcopy(verse_2)
    vol_going_up = [0, 5, 7, 13, 15, 21, 23]
    for i in range(16, 23):
        tones, beats = verse_2_vol_up[i]
        verse_2_vol_up[i] = {
            'tones': tones,
            'beats': beats,
            'volume': vol_going_up[i - 16],
        }
    verse_2_vol_up.insert(23, {'tones': 'volume', 'volume': 118})

    piano.sequence([
        *line([-3, 0, 2], [0, 2, 4], [-1, 1, 4], [-3, -1, 1], [-2, 0, 2],
              [0, 2, 5], [-1, 1, 4], [-3, -1, 1], 'r', beats=2),

        *verse_1,
        *verse_2,
        *verse_2_vol_up,
        *verse_1,
        *verse_2,

        ('r', 33*2),

        *verse_1,
        *verse_2,
        ([-3, 0, 2], 2),
    ])


def sax_line():
    sax.shift_in_scale = +2
    assert sax._note(0) == 59  # but actually it sounds like 56... wow

    verse_1 = [
        *line(0, 0, -1, -1, -3, -3, beats=[.5, 1.5]),
        *line(-2, 0, -1, beats=2), -1, 2, (5, 2),
    ]
    verse_2 = [
        *line(1, 0, -2, -1, -2, -3, beats=[3 / 4, 1 + 1 / 4]),
        *line(-2, 'r', 0, -2, 'r', -4, beats=[.5, .5, 1]),
        *line(-5, 2, beats=2),
    ]
    verse_2_1 = verse_2 + [(5, 2)]
    verse_2_2 = verse_2 + [(5, 2*2)]
    verse_2_3 = verse_2 + [(-2, 2)]

    sax.sequence([
        ('r', 10*2),

        *verse_1,
        *verse_2_1,
        ('r', 8*2),
        *verse_1,
        *verse_2_2,

        ('r', 8*2),

        *verse_1,
        *verse_2_1,
        ('r', 8*2),
        *verse_1,
        *verse_2_3,
    ])


def bass_line():
    bass.default_beats = 2

    verse = [0, -3, -3, -2, -2, -3, -3, 0]

    bass.sequence([
        ('r', 10*2),

        *verse,

        *verse,
        *verse[:-1], ('r', 2),
        *verse,
        *verse[:-1],

        ('r', 10*2),

        *verse,
        *verse,
        *verse[:-1], ('r', 2),
        *verse,
        *verse,
    ])


def guitar_line():
    mezzopiano = {'tones': 'volume', 'volume': 77}  # TODO nicer
    forte = {'tones': 'volume', 'volume': 95}  # TODO nicer

    chords = [[-3, 0, 2,], [0, 2, 4], [-1, 1, 4],
              [-3, -1, 1], [-2, 0, 2], [0, 2, 5]]

    verse = [
        mezzopiano,
        *chopped_line(*chords, times=4),
        forte,
        ([-1, 1, 4], .5), ([-1, 1, 4], 1.5),
        ([-3, -1, 1], 2),
    ]

    def intermezzo(*chords, beats=.5):
        for chord in chords:
            yield from [(chord, beats), (chord[0], beats), (chord, beats), (chord[0], beats)]

    def vol_up_and_down(*chords):
        # TODO more abstract
        vol_diffs = [0, 4, 8, 12, 16, 20, 24, 29]
        for chord, vol in zip(chords, vol_diffs + list(reversed(vol_diffs))):
            tones, beats = chord
            yield {'tones': tones, 'beats': beats, 'volume': vol}

    guitar.sequence([
        ('r', 50*2),

        mezzopiano,
        *chopped_line(*chords, [-1, 1, 4], [-3, -1, 1], times=2),

        *verse,
        *verse,

        mezzopiano,
        *intermezzo(
            [-3, 0, 2], [0, 2, 4], [-1, 1, 4], [-3, -1, 1]),
        *vol_up_and_down(*intermezzo(
            [2, 0, -2], [5, 2, 0], [4, 1, -1], [1, -1, -3])),

        *verse,
        *verse,
        mezzopiano,
        [-3, 0, 2], [-3, 0, 2],
    ])


def drumset_line():
    drumset.default_beats = .5

    pat1 = [[bda, hh], hh, hh, hh]
    pat2 = [[bda, ssl, hh], hh, [ssl, hh], [ssl, hh]]
    pat3 = [[bda, hh], hh, [ssl, hh], [ssl, hh]]
    pat4 = [[bda, hh], hh, [mar, hh], [mar, hh]]
    pat5 = [[bda, ridecymbal], ridecymbal, ('r', 1)]
    pat6 = [[bda, ridecymbal], ridecymbal, ssl, ssl]
    pat7 = [[bda, ridecymbal], ridecymbal, mar, mar]

    drumset.sequence([
        *repeat(pat1, 4),
        *repeat(pat2, 4),
        ('r', 2*2),

        *repeat(pat3, 15),
        *repeat(pat4, 7),
        *pat3,
        ('r', 2),

        *repeat(pat3, 15),
        ('r', 2),
        *repeat(pat5, 7),
        *pat6,
        ('r', 2),

        *repeat(pat6, 15),
        *repeat(pat7, 7),
        *pat6,
        ('r', 2),

        *repeat(pat2, 15),
    ])


def make():
    global song, piano, sax, guitar, bass, drumset

    song = Song()
    song.scale = g_major
    song.time_signature = 2, 4
    song.bpm = 160
    song.volume = 90

    piano = song.new_track()
    sax = song.new_track()
    guitar = song.new_track()
    bass = song.new_track()
    drumset = song.new_drumming_track()

    piano.instrument = instruments['bright acoustic piano']
    sax.instrument = instruments['baritone sax']
    guitar.instrument = instruments['electric guitar (clean)']
    bass.instrument = instruments['acoustic bass']

    piano_line()
    sax_line()
    bass_line()
    guitar_line()
    drumset_line()
