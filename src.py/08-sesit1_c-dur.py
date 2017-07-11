from midi_lib import *


def line():
    piano.grace_portion = 16

    piano.sequence([
        ([0, 2, 4, 7],),
        (5, .5),
        ([4, 7], .5),
        ([1, 4, 6, 8],),
        (7, .5),
        ([6, 8], .5),

        ([0, 5, 7, 9],),
        (5, .5),
        ([7, 9], .5),
        ([0, 2, 4, 7], 2),
    ])

    for _ in range(2):
        with piano.shadow_play([5, 8, 10]):
            piano.sequence([(1, .5), (3, .5), (1, .5), (3, .5)])
        with piano.shadow_play([6, 8, 11]):
            piano.sequence([(1, .5), (3, .5), (1, .5), (3, .5)])

        with piano.shadow_play([4, 7, 9]):
            piano.sequence([(0, .5), (2, .5)])
        piano.play([0, 4, 7, 9])
        with piano.shadow_play([7, 9]):
            piano.sequence([
                ([0, 2], .5),
                ([0, 3], .5),
                ([2, 4], .5),
                ([2, 5], .5),
            ])

    def repeat():
        piano.sequence([
            ([2, 4, 6, 11],),
            (7, .5),
            ([6, 11], .5),
            ([0, 5, 7, 9],),
            (5, .5),
            ([7, 9], .5),

            ([3, 5, 7, 10],)
        ])

    repeat()
    piano.sequence([
        (8, .5),
        ([7, 10], .5),
        (9, 'grace'),
        (10, 'grace'),
        ([7, 9, 11],),
        (2, 'grace'),
        (3, 'grace'),
        ([0, 2, 4],),
    ])

    repeat()
    piano.sequence([
        ([4, 8], .5),
        ([3, 5, 7, 10], .5),
        ([0, 2, 4, 7], 2),
    ])


def make():
    global song, piano

    song = Song()
    song.scale = c_major
    song.bpm = 60

    piano = song.new_track()

    line()
