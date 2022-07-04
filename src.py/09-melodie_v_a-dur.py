from midi_lib import *

# TODO all those ornaments

a_major = Scale('a', 'major')


# staccato
def st(tones, beats):
    return {'tones': tones, 'beats': beats, 'staccato': True}

# staccatissimo
def sti(tones, beats):
    return {'tones': tones, 'beats': beats, 'staccato': 2}

def grace(tones):
    return (tones, 'grace')

def trill(tones, beats=1, trill_length=1/8):
    tones_up = list(map(lambda t: t + 1, tones))
    for _ in range(int(beats / trill_length / 2)):
        yield (tones_up, trill_length)
        yield (tones, trill_length)


def vol_up(tones, beats, vol):
    return {'tones': tones, 'beats': beats, 'volume': vol}


mel = [
    0, st(3, .5), (2, .5),
    'r', 1, sti(4, .5), 5, (4, .5),
    *line(2, -1, 0, -2, beats=1/4), (-1, 'grace'), 0, 'r', (-1, 'grace'), 0,
    *line(2, -1, 0, -2, 3, 0, 1, -1, beats=1 / 4), 0, -1, vol_up(-1, 1, 4), vol_up(0, 2, 8), ('r', 3),
]

mel_bass = [
    0, (3, .5), (2, .5),
    'r', 1, (4, .5), 5, (4, .5),
    *line(2, -1, 0, -2, beats=1 / 4), (-1, 'grace'), 0, 'r', (-1, 'grace'), 0,
    *line(2, -1, 0, -2, 3, 0, 1, -1, beats=1 / 4), 0, (-1, 2), (0, 2), ('r', 3),
]


def melody_line():
    melody.sequence([
        *mel,
        *mel,
        *mel,

        *mel,
    ])
    melody.octave_shift = +1
    melody.volume = 85
    melody.sequence([
        *mel[:-4],
        (-1, 1 - 1/4), vol_up(0, 1/4, 3), vol_up(-1, 1, 5), vol_up(0, 3, 9),
    ])


def bass_line():
    bass.sequence([
        ('r', 4*4),

        *mel_bass,
        *mel_bass,
        ('r', 2),
    ])
    bass.octave_shift = -3
    bass_low = [
        0, 7, (10, 'grace'), 7, 0,
        0, (1, .5), (3, .5), 7, (4, .5), (1, .5),
        0, 7, (5, 'grace'), 7, 0,
        (0, 1 - 1 / 4), (7, 1 / 4), (8, .5), (3, .5), 7, (4, .5), (1, .5),
    ]
    bass.sequence([
        *bass_low,
        (4, .5), (1, .5), (0, 2), *line(2, 4, 7, beats=1/3),
        *bass_low,
        (4, .5), (1, .5), (0, 3),
    ])


def harmony_line():
    hrm1 = [
        ([-3, 0, 2], 2), ([-2, 0, 3], 'grace'), ([-3, 0, 2], 2),
        [0, 2, 4], [-2, 1, 3], ([-2, 0, 2], 'grace'), [-3, 0, 2], [-3, -1, 1],
    ]
    hrm2 = [[-1, 1, 4], ([0, 2, 4], 2), ('r', 1)]

    harmony.sequence([
        ('r', 2 + 4),

        *hrm1,
        *hrm2,

        *hrm1,
        *hrm1,
        *hrm2,

        *hrm1,
        *hrm1,
        *hrm2,

        *hrm1,
        *hrm1,
        *hrm2[:-1],
        *line([2, 4], [0, 4], [-3, 4], beats=1/3),

        *hrm1,
        *hrm1,
        [-1, 1, 4], ([0, 2, 4], 3),
    ])


def trumpets_line():
    trump1 = [
        ('r', 2),
        *line([0, 2], [0, 2], [0, 2], [0, 3], [1, 4], [1, 4], [1, 4], [1, 3],
              beats=.25),
    ]
    trump1_trill = [
        *trill([0, 2]), *trill([-2, 3]), *trump1[1:],
    ]
    trump2 = [
        *line([0, 2], [0, 2], [0, 3], [2, 4], [2, 4], [1, 4],
              beats=[.5, .25, .25]),
        sti([0, 3], .5), ([0, 2], .25), ([0, 2], .25), ([0, 3], .5),
        ([0, 2], .5),
    ]
    trump3 = [
        *line([1, 2], [-1, 1], [-1, 1], [-1, 1], beats=1 / 4), ([0, 2], 3),
    ]
    trump3_with_pause = [
        *trump3[:-1], 'r', ([0, 2], 2),
    ]

    trumpets.sequence([
        ('r', 2 + 9*4),

        0, (3, .5), (2, .5), ('r', 2),
        *line(4, 4, 3, beats=.5), ('r', 2.5),
        ([0, 2], 1-1/8), ([2, 4], 1/8), ([0, 2], 1-1/8), ([0, 3], 1/8), [0, 2], [0, 2],
        *trump1,
        *trump3_with_pause,

        *trump2,
        *trump1,
        *trump2,
        *trump1,
        *trump3,
        *trump2,
        *trump1_trill,
        *trump2,
        *trump1_trill,
        *trump3,
    ])


def make():
    global song, melody, harmony, bass, trumpets

    song = Song()
    song.scale = a_major
    song.bpm = 60
    song.volume = 91
    song.shorten_tones = True

    melody = song.new_track()
    harmony = song.new_track()
    bass = song.new_track()
    trumpets = song.new_track()

    melody.instrument = instruments['celesta']
    harmony.instrument = instruments['bright acoustic piano']
    bass.instrument = instruments['contrabass']
    trumpets.instrument = instruments['trumpet']

    melody.volume = 80
    trumpets.volume = 104

    melody_line()
    harmony_line()
    bass_line()
    trumpets_line()


if __name__ == '__main__':
    make()
    song.save('../out/09-melodie_v_a-dur.midi')

    from pprint import pprint
    from midi_diff import diff
    d = diff('../midi/09-melodie_v_a-dur.midi', '../out/09-melodie_v_a-dur.midi', normalize_times=False)
    pprint(d)
    pprint({'len1': len(d['notes1_extra']), 'len2': len(d['notes2_extra'])})
