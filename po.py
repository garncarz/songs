import collections

from music21 import *


GRACE_LEN = 0.125


#######################################################################
# helpers

dur_stolen = 0  # global for grace notes

def rel(rn, o=None, dur=1, scale=None):
    """note relative to a scale"""
    global dur_stolen
    if not scale:
        global gl_scale
        scale = gl_scale
    pitch = scale.romanNumeral(rn).root()
    if o:
        pitch.octave = o
    n = note.Note(pitch, quarterLength=dur-dur_stolen)
    dur_stolen = 0
    return n

def rel_c(rn, inv=None, dur=1, scale=None):
    """chord relative to a scale"""
    global dur_stolen
    if not scale:
        global gl_scale
        scale = gl_scale
    c = chord.Chord(scale.romanNumeral(rn), quarterLength=dur-dur_stolen)
    if inv:
        c.inversion(inv)
    dur_stolen = 0
    return c

def n(name, dur=1, **kwargs):
    """note"""
    global dur_stolen
    if isinstance(name, base.Music21Object):  # e.g. key
        return name
    if name == 'r':
        return r(dur)
    n = note.Note(name, quarterLength=dur-dur_stolen, **kwargs)
    dur_stolen = 0
    return n

def gn(name, dur=GRACE_LEN):
    """grace note"""
    global dur_stolen
    dur_stolen += dur
    return note.Note(name, quarterLength=dur)

def r(dur=1):
    """rest"""
    return note.Rest(quarterLength=dur)

def c(notes, dur=1, **kwargs):
    """chord"""
    global dur_stolen
    c = chord.Chord(notes, quarterLength=dur-dur_stolen, **kwargs)
    dur_stolen = 0
    return c

def mel(notes):
    """melody"""
    melody = []
    for note in notes:
        melody.append(
            n(note[0], note[1]) if isinstance(note, tuple)
            else n(note)
        )
    return melody


def chain(iterables, *args):
    res = []
    for it in list(iterables) + list(args):
        if isinstance(it, collections.Iterable) \
                and not isinstance(it, base.Music21Object):
            for element in it:
                res.append(element)
        else:
            res.append(it)
    return res


def repeat(what, count=1):
    return chain(what() if callable(what) else what
                 for _ in range(count))


#######################################################################
# keys

f_major = lambda: key.Key('F')
f_minor = lambda: key.Key('f')
c_minor = lambda: key.Key('c')
g_minor = lambda: key.Key('g')


#######################################################################
# parts' structures

def bassline():
    for _ in range(4):
        yield rel(1, o=2)
        yield rel(5, o=3)
    for _ in range(4):
        yield rel(6, o=2)
        yield rel(6, o=3)


def bassline_chorus():
    for _ in range(4):
        yield rel(1, o=2)
        yield rel(5, o=3)
    for _ in range(4):
        yield n('des2')
        yield n('des3')


def bassline_outro():
    for _ in range(2):
        yield from bassline_chorus()

    for _ in range(4):
        yield n('ees2')
        yield n('bes2')
    for _ in range(4):
        yield n('c2')
        yield n('c3')

    for _ in range(4):
        yield n('des2')
        yield n('aes2')
    for _ in range(4):
        yield n('bes1')
        yield n('bes2')


def chords_verse(fbesd=False, besdf=False):
    yield rel_c(1, dur=1)
    yield c(['c4', 'e4', 'g4'], dur=3)
    yield rel_c(1, dur=4)

    if fbesd:
        yield c(['a4', 'd5', 'f5'], dur=1)
        yield c(['f4', 'bes4', 'd5'], dur=3)
    elif besdf:
        yield c(['a4', 'd5', 'f5'], dur=1)
        yield c(['bes4', 'd5', 'f5'], dur=3)
    else:
        yield c(['a4', 'd5', 'f5'], dur=4)
    yield c(['f4', 'a4', 'd5'], dur=4)


def chords_chorus(fbesdes=False, besdesf=False, graces=False):
    yield c(['f4', 'aes4', 'c5'], dur=1)
    yield gn('bes4')
    yield c(['e4', 'g4', 'c5'], dur=3)
    if graces:
        yield from [gn('f4'), gn('aes4'), gn('c5')]
    yield c(['f4', 'aes4', 'c5'], dur=4)
    yield c(['aes4', 'des5', 'f5'], dur=1)
    if fbesdes:
        yield c(['f4', 'bes4', 'des5'], dur=3)
    else:
        assert besdesf
        yield c(['bes4', 'des5', 'f5'], dur=3)
    if graces:
        yield from [gn('des5'), gn('aes4'), gn('f4')]
    yield c(['f4', 'aes4', 'des5'], dur=4)


def chords_bridge():
    yield c_minor()
    yield c(['bes4', 'd5', 'g5'], dur=2)
    yield c(['g4', 'c5', 'ees5'], dur=2)
    yield c(['bes4', 'd5', 'g5'], dur=1)
    yield c(['g4', 'c5', 'ees5'], dur=3)

    yield g_minor()
    yield c(['f4', 'a4', 'd5'], dur=2)
    yield gn('c5')
    yield c(['g4', 'bes4', 'd5'], dur=2)
    yield c(['f4', 'a4', 'd5'], dur=1)
    yield gn('c5')
    yield c(['g4', 'bes4', 'd5'], dur=3)

    yield f_major()
    yield c(['e4', 'g4', 'c5'], dur=2)
    yield rel_c(1, dur=1)
    yield c(['f4', 'bes4', 'd5'], dur=1)


def chords_outro():
    yield c(['ees4', 'g4', 'bes4'], dur=1)
    yield gn('aes4')
    yield c(['des4', 'f4', 'bes4'], dur=3)
    yield c(['ees4', 'g4', 'bes4'], dur=4)
    yield c(['g4', 'c5', 'ees5'], dur=1)
    yield c(['aes4', 'c5', 'ees5'], dur=3)
    yield c(['ees4', 'g4', 'c5'], dur=4)

    yield c(['des4', 'f4', 'aes4'], dur=1)
    yield gn('g4')
    yield c(['c4', 'ees4', 'aes4'], dur=3)
    yield c(['des4', 'f4', 'aes4'], dur=4)
    yield c(['f4', 'bes4', 'des5'], dur=1)
    yield c(['g4', 'bes4', 'des5'], dur=3)
    yield c(['des4', 'f4', 'bes4'], dur=4)


def violin_verse():
    for _ in range(2):
        yield from mel([
            'f4', 'g4', 'c5', 'g4',
            'f4', 'a4', 'c5', 'a4',
            ('d4', 2), ('bes4', 2),
            'f4', 'd4', ('a4', 2),
        ])

    yield from mel([
        ('c4', 2), ('e4', 2),
        ('f4', 2), 'c5', 'c5',
        ('d5', 2), 'bes4', 'bes4',
        'f4', 'g4', 'c5', 'g4',
    ])


def violin_chorus():
    yield from mel([
       ('c5', 4), ('r', 4), 'aes4', 'des5', ('f5', 2), ('r', 4),
       ('c5', 4), ('f4', 4), ('aes4', 2), 'bes4', 'f4', ('des5', 4),
    ])


#######################################################################
# parts

def intro():
    global gl_scale
    gl_scale = f_major()

    bass.append(f_major())
    chords.append(f_major())
    violin.append(f_major())

    bass.append(repeat(bassline, 4))

    chords.append(repeat(lambda: r(4), 4))

    chords.append([
        rel_c(1, dur=4),
        gn('c4'),
        rel_c(1, inv=1, dur=4),
        gn('d4'),
        c(['a4', 'd5', 'f5'], dur=4),
        c(['f4', 'a4', 'd5'], dur=4),
    ])

    chords.append(chain(
        chords_verse(),
        chords_verse(fbesd=True),
    ))

    violin.append(repeat(lambda: r(4), 16))


def verse():
    bass.append(repeat(bassline, 8))

    chords.append(chain(
        chords_verse(besdf=True),
        chords_verse(fbesd=True),
        chords_verse(fbesd=True),
        chords_verse(besdf=True),
    ))

    chords.append([
        rel_c(1, dur=1),
        c(['c4', 'e4', 'g4'], dur=2),
        c(['c4', 'e4', 'g4'], dur=1),
        gn('f5'),
        rel_c(1, dur=4),
        c(['a4', 'd5', 'f5'], dur=1),
        c(['f4', 'bes4', 'd5'], dur=2),
        c(['f4', 'bes4', 'd5'], dur=1),
        gn('d4'),
        c(['f4', 'a4', 'd5'], dur=4),
    ])

    chords.append(chain(
        chords_verse(fbesd=True),
        chords_verse(fbesd=True),
        chords_verse(besdf=True),
    ))

    for _ in range(2):
        violin.append(repeat(lambda: r(4), 4))
        violin.append(f_major())  # 2nd repetition
        violin.append(list(violin_verse()))


def chorus():
    bass.append([
        f_minor(),  # should be changed in the middle of a bar
        n('c3', 2),
        n('des2', 2),
    ])

    bass.append(repeat(bassline_chorus, 6))

    chords.append([
        f_minor(),  # should be changed in the middle of a bar
        c(['g4', 'c5', 'e5'], 2),
        c(['f4', 'aes4', 'f5'], 2),
    ])

    chords.append(chain(
        chords_chorus(fbesdes=True),
        chords_chorus(besdesf=True),
        chords_chorus(fbesdes=True),
        chords_chorus(fbesdes=True),
        chords_chorus(besdesf=True),
        chords_chorus(fbesdes=True),
    ))

    violin.append(repeat(lambda: r(4), 5))

    violin.append(f_minor())
    violin.append(repeat(violin_chorus, 2))

    violin.append(repeat(lambda: r(4), 4))


def bridge():
    bass.append(mel([
        c_minor(),
        ('g2', 2), ('c3', 2),
        'g2', 'c3', 'g2', 'c3',
        g_minor(),
        ('d3', 2), ('g2', 2),
        'g2', 'd3', 'g2', 'd3',
        f_major(),
        ('c3', 2), ('f3', 2),
    ]))

    chords.append(list(chords_bridge()))

    violin.append([r(4) for _ in range(5)])


def outro():
    bass.append(list(bassline_outro()))

    chords.append(chain(
        chords_chorus(fbesdes=True, graces=True),
        chords_chorus(besdesf=True),
    ))

    chords.append(list(chords_outro()))

    violin.append([r(4) for _ in range(16)])


#######################################################################
# song

s = stream.Stream()

bass = stream.Part(id='bass')
s.insert(bass)
bass.insert(tempo.MetronomeMark(number=180))

chords = stream.Part(id='chords')
s.insert(chords)

violin = stream.Part(id='violin')
s.insert(violin)
violin.insert(instrument.Violin())


intro()

verse()
chorus()

bridge()

verse()
chorus()

outro()
