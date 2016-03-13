from music21 import *

GRACE_LEN = 0.125


#######################################################################
# helpers

dur_stolen = 0  # global for grace notes

def n(name, dur=1, **kwargs):
    """note"""
    global dur_stolen
    if not isinstance(name, str):  # e.g. key
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


#######################################################################
# keys

f_major = lambda: key.Key('F')
f_minor = lambda: key.Key('f')
c_minor = lambda: key.Key('c')
g_minor = lambda: key.Key('g')


#######################################################################
# basic melody/chord structures

def bass_fc():
    bass.append(n('f2'))
    bass.append(n('c3'))
def bass_dd():
    bass.append(n('d2'))
    bass.append(n('d3'))

def bass_desdes():
    bass.append(n('des2'))
    bass.append(n('des3'))

def bass_esbes():
    bass.append(n('ees2'))
    bass.append(n('bes2'))
def bass_cc():
    bass.append(n('c2'))
    bass.append(n('c3'))
def bass_desas():
    bass.append(n('des2'))
    bass.append(n('aes2'))
def bass_besbes():
    bass.append(n('bes1'))
    bass.append(n('bes2'))


def chords_fac(dur=1):
    chords.append(c(['f4', 'a4', 'c5'], dur))
def chords_acf(dur=1):
    chords.append(c(['a4', 'c5', 'f5'], dur))
def chords_adf(dur=1):
    chords.append(c(['a4', 'd5', 'f5'], dur))
def chords_fad(dur=1):
    chords.append(c(['f4', 'a4', 'd5'], dur))
def chords_ceg(dur=1):
    chords.append(c(['c4', 'e4', 'g4'], dur))
def chords_fbesd(dur=1):
    chords.append(c(['f4', 'bes4', 'd5'], dur))
def chords_besdf(dur=1):
    chords.append(c(['bes4', 'd5', 'f5'], dur))

def chords_fasc(dur=1):
    chords.append(c(['f4', 'aes4', 'c5'], dur))
def chords_egc(dur=1):
    chords.append(c(['e4', 'g4', 'c5'], dur))
def chords_asdesf(dur=1):
    chords.append(c(['aes4', 'des5', 'f5'], dur))
def chords_fbesdes(dur=1):
    chords.append(c(['f4', 'bes4', 'des5'], dur))
def chords_fasdes(dur=1):
    chords.append(c(['f4', 'aes4', 'des5'], dur))
def chords_besdesf(dur=1):
    chords.append(c(['bes4', 'des5', 'f5'], dur))

def chords_besdg(dur=1):
    chords.append(c(['bes4', 'd5', 'g5'], dur))
def chords_gces(dur=1):
    chords.append(c(['g4', 'c5', 'ees5'], dur))
def chords_gbesd(dur=1):
    chords.append(c(['g4', 'bes4', 'd5'], dur))

def chords_esgbes(dur=1):
    chords.append(c(['ees4', 'g4', 'bes4'], dur))
def chords_desfbes(dur=1):
    chords.append(c(['des4', 'f4', 'bes4'], dur))
def chords_asces(dur=1):
    chords.append(c(['aes4', 'c5', 'ees5'], dur))
def chords_esgc(dur=1):
    chords.append(c(['ees4', 'g4', 'c5'], dur))
def chords_desfas(dur=1):
    chords.append(c(['des4', 'f4', 'aes4'], dur))
def chords_cesas(dur=1):
    chords.append(c(['c4', 'ees4', 'aes4'], dur))
def chords_gbesdes(dur=1):
    chords.append(c(['g4', 'bes4', 'des5'], dur))


#######################################################################
# parts' structures

def chords_verse(fbesd=False, besdf=False):
    chords_fac()
    chords_ceg(3)
    chords_fac(4)
    if fbesd:
        chords_adf()
        chords_fbesd(3)
    elif besdf:
        chords_adf()
        chords_besdf(3)
    else:
        chords_adf(4)
    chords_fad(4)

def chords_chorus(fbesdes=False, besdesf=False, graces=False):
    chords_fasc()
    chords.append(gn('bes4'))
    chords_egc(3)
    if graces:
        chords.append([gn('f4'), gn('aes4'), gn('c5')])
    chords_fasc(4)
    chords_asdesf()
    if fbesdes:
        chords_fbesdes(3)
    else:
        assert besdesf
        chords_besdesf(3)
    if graces:
        chords.append([gn('des5'), gn('aes4'), gn('f4')])
    chords_fasdes(4)


def violin_verse():
    for _ in range(2):
        violin.append(mel([
            'f4', 'g4', 'c5', 'g4',
            'f4', 'a4', 'c5', 'a4',
            ('d4', 2), ('bes4', 2),
            'f4', 'd4', ('a4', 2),
        ]))

    violin.append(mel([
        ('c4', 2), ('e4', 2),
        ('f4', 2), 'c5', 'c5',
        ('d5', 2), 'bes4', 'bes4',
        'f4', 'g4', 'c5', 'g4',
    ]))


#######################################################################
# parts

def intro():
    bass.append(f_major())
    chords.append(f_major())
    violin.append(f_major())

    for _ in range(4):
        for _ in range(4):
            bass_fc()
        for _ in range(4):
            bass_dd()

    chords.append(r(4*4))

    chords_fac(4)
    chords.append(gn('c4'))
    chords_acf(4)
    chords.append(gn('d4'))
    chords_adf(4)
    chords_fad(4)

    chords_verse()
    chords_verse(fbesd=True)

    violin.append(r(16*4))


def verse():
    for _ in range(8):
        for _ in range(4):
            bass_fc()
        for _ in range(4):
            bass_dd()

    chords_verse(besdf=True)
    chords_verse(fbesd=True)
    chords_verse(fbesd=True)
    chords_verse(besdf=True)

    chords_fac()
    chords_ceg(2)
    chords_ceg()
    chords.append(gn('f5'))
    chords_fac(4)
    chords_adf()
    chords_fbesd(2)
    chords_fbesd()
    chords.append(gn('d4'))
    chords_fad(4)

    chords_verse(fbesd=True)
    chords_verse(fbesd=True)
    chords_verse(besdf=True)

    for _ in range(2):
        violin.append(r(4*4))
        violin.append(f_major())  # 2nd repetition
        violin_verse()


def chorus():
    bass.append(f_minor())  # should be changed in the middle of a bar
    bass.append(n('c3', 2))
    bass.append(n('des2', 2))

    for _ in range(6):
        for _ in range(4):
            bass_fc()
        for _ in range(4):
            bass_desdes()

    chords.append(f_minor())  # should be changed in the middle of a bar
    chords.append(c(['g4', 'c5', 'e5'], 2))
    chords.append(c(['f4', 'aes4', 'f5'], 2))

    chords_chorus(fbesdes=True)
    chords_chorus(besdesf=True)
    chords_chorus(fbesdes=True)
    chords_chorus(fbesdes=True)
    chords_chorus(besdesf=True)
    chords_chorus(fbesdes=True)

    violin.append(r(5*4))

    violin.append(f_minor())
    for _ in range(2):
        violin.append(mel([
           ('c5', 4), ('r', 4), 'aes4', 'des5', ('f5', 2), ('r', 4),
           ('c5', 4), ('f4', 4), ('aes4', 2), 'bes4', 'f4', ('des5', 4),
        ]))

    violin.append(r(4*4))


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

    chords.append(c_minor())
    chords_besdg(2)
    chords_gces(2)
    chords_besdg()
    chords_gces(3)

    chords.append(g_minor())
    chords_fad(2)
    chords.append(gn('c5'))
    chords_gbesd(2)
    chords_fad()
    chords.append(gn('c5'))
    chords_gbesd(3)

    chords.append(f_major())
    chords_egc(2)
    chords_fac()
    chords_fbesd()

    violin.append(r(5*4))


def outro():
    for _ in range(2):
        for _ in range(4):
            bass_fc()
        for _ in range(4):
            bass_desdes()

    for _ in range(4):
        bass_esbes()
    for _ in range(4):
        bass_cc()

    for _ in range(4):
        bass_desas()
    for _ in range(4):
        bass_besbes()

    chords_chorus(fbesdes=True, graces=True)
    chords_chorus(besdesf=True)

    chords_esgbes()
    chords.append(gn('aes4'))
    chords_desfbes(3)
    chords_esgbes(4)
    chords_gces()
    chords_asces(3)
    chords_esgc(4)

    chords_desfas()
    chords.append(gn('g4'))
    chords_cesas(3)
    chords_desfas(4)
    chords_fbesdes()
    chords_gbesdes(3)
    chords_desfbes(4)

    violin.append(r(16*4))


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
