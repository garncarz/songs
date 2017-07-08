from midi_lib import *


def line(*tones, beats):
    return list(map(lambda t: (t, beats), tones))


def staccato(*tones, beats=None):
    return {'tones': list(tones), 'beats': beats, 'staccato': True}


def arpeggio(*tones, beats=None):
    return {'tones': list(tones), 'beats': beats, 'arpeggio': True}


def bassline():
    bass.default_beats = 2
    bass.sequence([
        0, -4, -3,
        0, 1, -3, -2,
        0, -4, 3, -3,
        0, -5, -4, 1, -5,
        0, 1, -3,
        0, -4, 3, -3,
        0, 0, 3, -3,
        0, 2, -2, 1,
        0, 3, 1, (4, 1), (-1, 1),
        0, *line(0, 2, 3, 5, 4, -3, beats=1),
        0, *line(1, 3, 4, 1, 5, -2, beats=1),
        -2, -4, 3, (-3, 1), (4, 1),
        0, 0, -3,
        0, 2, 3,
        0, 1, 1, -3,
        (0, 2*3),
    ])


def chords():
    up.sequence([
        [0, 2, 4], [2, 4, 7],
        [3, 6, 8], [3, 5, 7],
        [1, 4, 6], [4, 6, 8],
        ([2, 4, 7], 2),

        [1, 4, 6], [1, 3, 5],
        [-1, 1, 4], [1, 4, 6],
        [0, 2, 7], [0, 2, 5],
        ([0, 2, 4], 2),

        arpeggio(3, 5, 7, beats=2),
        arpeggio(0, 3, 5, beats=2-.5), ([5, 7], .5),
        ([1, 4, 6], 2-.5), ([3, 5], .5),
        ([2, 4, 7], 2),

        [4, 7, 11], [0, 4, 7],
        [-2, 0, 3], [3, 5, 7],
        [1, 3, 6], [3, 6, 8],
        [4, 6, 9], [2, 4, 6],

        [0, 2, 4], [4, 7, 9],
        [3, 6, 8], ([3, 6, 10], 1-.5), ([7, 9], .5),
        [6, 8, 11], [4, 6, 8],
        ([4, 7, 9], 2),

        staccato(5, 7, 10), [5, 7, 10],
        staccato(3, 5, 7), [3, 5, 7],
        [4, 6, 8], [1, 4, 6],
        arpeggio(2, 4, 7, beats=2),

        *line(2, 4, 0, [0, 2, 4], beats=.5),
        *line(3, 5, 0, [0, 3, 5], beats=.5),
        *line(4, 6, 1, beats=.5), ([1, 4, 6], .5/2), ([3, 5], .5/2),
        ([2, 4, 7], 1-.5), ([3, 5], .5), [2, 4, 7],

        staccato(2, 4, 6), [2, 4, 6],
        staccato(2, 5, 7), [2, 5, 7],
        staccato(1, 3, 6), [1, 3, 6],
        ([0, 4, 7], 2-.5), ([1, 6], .5),

        ([0, 3, 5], 2-.5), ([3, 5], .5),
        ([3, 5, 8], 2),
        [1, 4, 6], [1, 4, 4],
        ([2, 4, 7], 2),

        [0, 2, 4], [0, 4, 7],
        [0, 3, 5], [0, 3, 3],
        [1, 4, 6], ([4, 6, 8], 1-.5), ([3, 5], .5),
        ([2, 4, 7], 2),

        [1, 3, 5], [1, 5, 8],
        [1, 4, 6], [3, 6, 8],
        ([2, 5, 7], 1-.5), ([8, 10], .5), [5, 7, 9],
        ([5, 7, 9], 2),

        arpeggio(5, 7, 10), staccato(5, 7, 10),
        arpeggio(3, 5, 7), staccato(3, 5, 7, beats=1-.5), ([7, 9], .5),
        ([4, 6, 8], 2),
        ([7, 9, 11], 2),

        *line(9, 7, 4, [4, 7, 9], beats=.5),
        *line(8, 6, 4, [8, 6, 4], beats=.5),
        *line(7, 4, 2, beats=.5), ([7, 4, 2], .5/2), ([5, 7], .5/2),
        ([2, 4, 6], 1-.5), ([5, 7], .5), ([2, 4, 6], 1-.5), ([1, 6], .5),

        ([0, 3, 5], 1-.5), ([1, 6], .5), ([0, 3, 5], 1-.5), ([3, 5], .5),
        ([0, 2, 4], 1-.5), ([3, 5], .5), [2, 4, 7],
        arpeggio(1, 3, 5, beats=2),
        [1, 3, 6], [3, 6, 8],
        [1, 4, 6], [4, 6, 8],
    ])

    with up.shadow_play(7):
        up.sequence([
            [2, 4], [3, 5],
            ([2, 4], 4),
        ])


def song():
    bassline()
    chords()


def make():
    global mid, bass, up

    mid = MidiFile()

    up = Track(mid)
    up.instrument = 7
    up.time_signature = 2, 4
    up.grace_portion = 8

    bass = Track(mid)
    bass.shift = -1
    bass.instrument = 7
    bass.time_signature = 2, 4

    song()


if __name__ == '__main__':
    make()
    mid.save('../out/01-prochazka_c-dur.midi')

    from pprint import pprint
    from midi_diff import diff
    d = diff('../midi/01-prochazka_c-dur.midi', '../out/01-prochazka_c-dur.midi')
    pprint(d)
