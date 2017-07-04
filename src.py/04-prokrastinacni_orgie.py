from midi_lib import *


mid = MidiFile()

bass = Track(mid)
chords = Track(mid)
violin = Track(mid)

bass.shift = -2
bass.bpm = 180

violin.instrument = 41


def bassline():
    for _ in range(4):
        bass.sequence([(0,), (4,)])
    for _ in range(4):
        bass.sequence([(-2,), (5,)])


def bassline_bridge():
    bass.sequence([
        (c_minor,),
        (4, 2), (7, 2),
        (4,), (7,), (4,), (7,),

        (g_minor,),
        (4, 2), (0, 2),
        (0,), (4,), (0,), (4,),

        (f_major,),
        (4, 2), (7, 2),
    ])


def bassline_outro():
    for _ in range(2):
        bassline()

    bass.shift_in_scale = -1
    bassline()

    bass.shift_in_scale = -2
    bassline()

    bass.shift_in_scale = 0  # cleaning


def chords_verse(variation):
    assert -1 <= variation <= 3

    if variation == -1:
        chords.sequence([
            ([0, 2, 4], 4),
            (-3, 'grace'),
            ([2, 4, 7], 4),
            (-2, 'grace'),
        ])
    elif variation in [0, 1, 2]:
        chords.sequence([
            ([0, 2, 4], 1),
            ([-3, -1, 1], 3),
            ([0, 2, 4], 4),
        ])
    elif variation == 3:
        chords.sequence([
            ([0, 2, 4], 1),
            ([-3, -1, 1], 2),
            ([-3, -1, 1], 1),
            (7, 'grace'),
            ([0, 2, 4], 4),
        ])

    if variation in [-1, 0]:
        chords.play([2, 5, 7], 4)
    elif variation == 1:
        chords.sequence([
            ([2, 5, 7], 1),
            ([0, 3, 5], 3),
        ])
    elif variation == 2:
        chords.sequence([
            ([2, 5, 7], 1),
            ([3, 5, 7], 3),
        ])
    elif variation == 3:
        chords.sequence([
            ([2, 5, 7], 1),
            ([0, 3, 5], 2),
            ([0, 3, 5], 1),
            (-2, 'grace'),
        ])

    chords.play([0, 2, 5], 4)


# not sure if that shift was purpose or just error :-)
def chords_chorus(variation, midi_extra_shift=+1):
    assert 0 <= variation <= 2

    chords.sequence([
        ([0, 2, 4], 1),
        (3, 'grace'),
        ([(-1, midi_extra_shift), 1, 4], 3),
    ])

    if variation == 2:
        chords.sequence([
            (0, 'grace'),
            (2, 'grace'),
            (4, 'grace'),
        ])
    chords.sequence([
        ([0, 2, 4], 4),
        ([2, 5, 7], 1),
    ])

    if variation in [0, 2]:
        chords.play([0, 3, 5], 3)
    elif variation == 1:
        chords.play([3, 5, 7], 3)

    if variation == 2:
        chords.sequence([
            (5, 'grace'),
            (2, 'grace'),
            (0, 'grace'),
        ])
    chords.play([0, 2, 5], 4)


def chords_bridge():
    chords.sequence([
        (c_minor,),
        ([6, 8, 11], 2),
        ([4, 7, 9], 2),
        ([6, 8, 11], 1),
        ([4, 7, 9], 3),

        (g_minor,),
        ([-1, 1, 4], 2),
        (3, 'grace'),
        ([0, 2, 4], 2),
        ([-1, 1, 4], 1),
        (3, 'grace'),
        ([0, 2, 4], 3),

        (f_major,),
        ([-1, 1, 4], 2),
        ([0, 2, 4],),
        ([0, 3, 5],),
    ])


def chords_outro():
    for v in [2, 1]:
        chords_chorus(v)

    chords.shift_in_scale = -1
    chords_chorus(1, 0)

    chords.shift_in_scale = -2
    chords_chorus(1, 0)

    chords.shift_in_scale = 0  # cleaning


def violin_verse():
    for _ in range(2):
        violin.sequence([
            (0,), (1,), (4,), (1,), (0,), (2,), (4,), (2,),
            (-2, 2), (3, 2),
            (0,), (-2,), (2, 2),
        ])

    violin.sequence([
        (-3, 2), (-1, 2), (0, 2),
        (4,), (4,), (5, 2),
        (3,), (3,), (0,), (1,), (4,), (1,),
    ])


def violin_chorus():
    violin.sequence([
        (4, 4), (None, 4),
        (2,), (5,), (7, 2), (None, 4),
        (4, 4), (0, 4), (2, 2),
        (3,), (0,), (5, 4),
    ])


def intro():
    bass.scale = f_major
    chords.scale = f_major
    violin.scale = f_major

    for _ in range(4):
        bassline()

    chords.rest(4 * 4)
    for v in [-1, 0, 1]:
        chords_verse(v)

    violin.rest(4 * 16)


def verse():
    bass.scale = f_major
    chords.scale = f_major
    violin.scale = f_major

    for _ in range(8):
        bassline()

    for v in [2, 1, 1, 2, 3, 1, 1, 2]:
        chords_verse(v)

    for _ in range(2):
        violin.rest(4 * 4)
        violin_verse()


def chorus():
    bass.sequence([(4, 2), (f_minor,), (-2, 2)])
    for _ in range(6):
        bassline()

    chords.sequence([([1, 4, 6], 2), (f_minor,), ([0, 2, 7], 2)])
    for v in [0, 1, 0, 0, 1, 0]:
        chords_chorus(v)

    violin.scale = f_minor
    violin.rest(4 * 5)
    for _ in range(2):
        violin_chorus()
    violin.rest(4 * 4)


def bridge():
    bassline_bridge()
    chords_bridge()
    violin.rest(4 * 5)


def outro():
    bassline_outro()
    chords_outro()
    violin.rest(4 * 16)


def song():
    intro()
    verse()
    chorus()
    bridge()
    verse()
    chorus()
    outro()


if __name__ == '__main__':
    song()
    mid.save('04-prokrastinacni_orgie.midi')
