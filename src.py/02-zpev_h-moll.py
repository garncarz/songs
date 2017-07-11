from midi_lib import *


DEFAULT_BEATS = 2
TIME_SIGNATURE = (2, 4)

rhythm_divine = [1, .5, .5, 1, .5, .5]


def line(*tones, beats=None):
    beats = DEFAULT_BEATS if beats is None else beats
    return list(map(lambda t: (t, beats), tones))


def wedge(tone, beats=DEFAULT_BEATS):
    return line(tone, tone + 1, tone, beats=beats/3)


def vel(tone, beats=DEFAULT_BEATS):
    return line(tone, tone - 1, tone, beats=beats/3)


def step_up_to(to, from_=None):
    from_ = to - 1 if from_ is None else from_
    return [(from_, 0.5), (to, 1.5)]


def step_down_to(to, from_=None):
    from_ = to + 1 if from_ is None else from_
    return [(from_, 0.5), (to, 1.5)]


def step_up_from(from_, to=None):
    to = from_ + 1 if to is None else to
    return [(from_, 1.5), (to, 0.5)]


def step_down_from(from_, to=None):
    to = from_ - 1 if to is None else to
    return [(from_, 1.5), (to, 0.5)]


def bass_line():
    for _ in range(2):
        bass.sequence([
            *line(0, 3, 4, 0),
            *line(0, 3, 4, 0),
            *line(0, 2, 4), *line(0, 2, 4, beats=2/3),
            (7,), (2,), *line(4, 1, 4, beats=2/3), (0,),
            (0,), (3, 1), (5,), (4, 1), (0,),
            (0,), (3, 1), (-2,), (4, 1), (0,),
        ])

    bass.sequence([
        *line(0, 2, 4, 0, beats=.5), *line(3, -4, -3, 4, beats=1), (0,),
        *line(7, 4, 2, 0, beats=.5), *line(3, -4, -3, 4, beats=1), (0,),
        *line(7, 0, 4, 0, beats=.5), (2,), (4, 1), (-3, 1), *line(0, 2, 4, beats=2/3),
        *line(7, 0, 4, 0, beats=.5), *line(2, 4, 0),
        (0,), (3, 1), (5,), (4, 1), (0,),
        (0,), *line(3, -2, 5, 4, 7, 0, beats=1),
    ])


def tenor_line():
    tenor.sequence([
        (-3,), (-2,), (-3, 4),
        (-3,), (-2,), (-3, 4),
        (0,), (-3, 4), (-3,),
        (-3,), (-1,), (-3,), (-3,),
        (0,), *line(-2, -2, 0, -1, beats=1), (2,),
        (0,), (-2,), (0, 1), (-3, 3),

        *vel(-3), *vel(-2), (-3, 4),
        *vel(-3), *vel(-2), *step_up_to(-3), (-3,),
        (0,), (-3, 4), (-3,),
        *line(-3, -1, -3, -3),
        *step_down_from(0, to=-2), *line(-2, -2, 0, -1, beats=1), (2,),
        (0,), (-2,), (0, 1), (-3, 3),

        (-3,), (-2,), (-3, 4),
        *step_up_to(-3, from_=-5), *step_up_to(-2, from_=-4), (-3, 4),
        *step_down_from(0), *line(-3, -2, -3, -4, beats=1), (-3,),
        *zip([-3, -2, -1, -1, -2, -3], rhythm_divine), (-3, 1), (-4, 1), (-3,),
        (0,), *line(-2, -2, 0, -1, beats=1), (2,),
        (0,), (-2,), (0, 1), (-3, 1), (-5,),
    ])


def alto_line():
    alto.sequence([
        *line(0, 0, -1, 0),
        *line(0, 0, -1, 0),
        *line(2, -1, -1, 0),
        *line(0, 2, -1, 0),
        (2,), (0, 1), (0,), (1, 1), (4,),
        (2,), (0, 1), (0,), (-1, 1), (0,),

        *line(0, 0, -1, 0),
        *line(0, 0, -1, 0),
        *vel(2), *wedge(-1), (-1,), (0,),
        *wedge(0), *vel(2), *step_down_to(-1, from_=1), (0,),
        *step_down_from(2, to=0), (0, 1), (0,), (1, 1), (4,),
        (2,), (0,1), (0,), (-1, 1), (0,),

        *step_down_to(0, from_=2), *step_down_to(0, from_=3), (-1,), (0,),
        *step_up_to(0, from_=-3), *step_up_to(0, from_=-2), (-1,), (0,),
        *step_down_from(2), (-1, 1), (-2, 1), (-1,), (0,),
        *zip([0, 1, 2, 2, 1, -1], rhythm_divine), (-1,), (0,),
        (2,), (0, .5), (1, .5), (0, 1), (0, 1), (1, 1), (4,),
        (2,), (0, 1), (0,), (-1, 1), (-3,),
    ])


def soprano_line():
    soprano.sequence([
        *line(2, 3, 1, 2),
        *line(2, 3, 1, 2),
        *line(4, 2, 1, 2),
        *line(2, 4, 1, 2),
        (4,), *line(3, 0, 2, 4, beats=1), (7,),
        (4,), *line(3, 0, 2, 1, beats=1), (2,),

        *wedge(2), *wedge(3), (1,), (2,),
        *wedge(2), *wedge(3), *step_down_to(1), (2,),
        *line(4, 2, 1, 2),
        *line(2, 4, 1, 2),
        *step_down_from(4), *line(3, 0, 2, 4, beats=1), (7,),
        (4,), *line(3, 0, 2, 1, beats=1), (2,),

        *step_down_to(2, from_=4), *step_down_to(3, from_=5), (1,), (2,),
        *line(2, 3, 1, 2),
        (3, .5), (4, 1), (3, .5), (2,), (1, 1), (2, 1), (2,),
        *zip([2, 3, 4, 4, 3, 1], rhythm_divine), (1, 1), (2, 1), (2,),
        (4,), (3, 1), (0, .5), (2, .5), (2, 1), (4, 1), (7,),
        (4,), *line(3, 0, 2, 1, beats=1), (0,),
    ])


def _make(version='European'):
    global song, bass, tenor, alto, soprano

    song = Song()
    song.scale = b_minor
    song.time_signature = TIME_SIGNATURE
    song.bpm = 60
    song.default_beats = DEFAULT_BEATS

    bass = song.new_track()
    tenor = song.new_track()
    alto = song.new_track()
    soprano = song.new_track()

    if version == 'European':
        bass.instrument = instruments['church organ']
        tenor.instrument = instruments['cello']
        alto.instrument = instruments['violin']
        soprano.instrument = instruments['piccolo']
    elif version == 'Asian':
        bass.instrument = instruments['koto']
        tenor.instrument = instruments['shamisen']
        alto.instrument = instruments['banjo']
        soprano.instrument = instruments['sitar']
    else:
        raise Exception('Unknown version!')

    bass.octave_shift = -2

    bass_line()
    tenor_line()
    alto_line()
    soprano_line()


def make():
    global songs, song

    songs = {}

    _make('European')
    songs['evropska_verze'] = song

    _make('Asian')
    songs['asijska_verze'] = song

    del song
