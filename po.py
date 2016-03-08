from music21 import *

# TODO grace notes


def n(name, dur=1, **kwargs):
    if name == 'r':
        return r(dur)
    return note.Note(name, quarterLength=dur, **kwargs)

def r(dur=1):
    return note.Rest(quarterLength=dur)

def c(notes, dur=1, **kwargs):
    return chord.Chord(notes, quarterLength=dur, **kwargs)

def mel(notes):
    melody = []
    for note in notes:
        melody.append(
            n(note[0], note[1]) if isinstance(note, tuple)
            else n(note)
        )
    return melody


s = stream.Stream()

bass = stream.Part(id='bass')
s.insert(bass)
bass.insert(tempo.MetronomeMark(number=180))

chords = stream.Part(id='chords')
s.insert(chords)

violin = stream.Part(id='violin')
s.insert(violin)
violin.insert(instrument.Violin())


def bass_fc():
    bass.append(n('f2'))
    bass.append(n('c3'))

def bass_dd():
    bass.append(n('d2'))
    bass.append(n('d3'))

for _ in range(12):
    for _ in range(4):
        bass_fc()
    for _ in range(4):
        bass_dd()


chords.append(r(4*4))

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

chords_fac(4)
chords_acf(4)
chords_adf(4)
chords_fad(4)

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

chords_verse()
chords_verse(fbesd=True)
chords_verse(besdf=True)
chords_verse(fbesd=True)
chords_verse(fbesd=True)
chords_verse(besdf=True)

chords_fac()
chords_ceg(2)
chords_ceg()
chords_fac(4)
chords_adf()
chords_fbesd(2)
chords_fbesd()
chords_fad(4)

chords_verse(fbesd=True)
chords_verse(fbesd=True)
chords_verse(besdf=True)


violin.append(r(20*4))

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

violin_verse()
violin.append(r(4*4))
violin_verse()


# chorus:

bass.append(n('c3', 2))
bass.append(n('des2', 2))

def bass_desdes():
    bass.append(n('des2'))
    bass.append(n('des3'))

for _ in range(6):
    for _ in range(4):
        bass_fc()
    for _ in range(4):
        bass_desdes()


chords.append(c(['g4', 'c5', 'e5'], 2))
chords.append(c(['f4', 'aes4', 'f5'], 2))

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

def chords_chorus(fbesdes=False, besdesf=False):
    chords_fasc()
    chords_egc(3)
    chords_fasc(4)
    chords_asdesf()
    if fbesdes:
        chords_fbesdes(3)
    else:
        assert besdesf
        chords_besdesf(3)
    chords_fasdes(4)

chords_chorus(fbesdes=True)
chords_chorus(besdesf=True)
chords_chorus(fbesdes=True)
chords_chorus(fbesdes=True)
chords_chorus(besdesf=True)
chords_chorus(fbesdes=True)


violin.append(r(5*4))

for _ in range(2):
    violin.append(mel([
       ('c5', 4), ('r', 4), 'aes4', 'des5', ('f5', 2), ('r', 4),
       ('c5', 4), ('f4', 4), ('aes4', 2), 'bes4', 'f4', ('des5', 4),
    ]))

violin.append(r(4*4))


# bridge:

bass.append(mel([
    ('g2', 2), ('c3', 2),
    'g2', 'c3', 'g2', 'c3',
    ('d3', 2), ('g2', 2),
    'g2', 'd3', 'g2', 'd3',
    ('c3', 2), ('f3', 2),
]))


def chords_besdg(dur=1):
    chords.append(c(['bes4', 'd5', 'g5'], dur))
def chords_gces(dur=1):
    chords.append(c(['g4', 'c5', 'ees5'], dur))
def chords_gbesd(dur=1):
    chords.append(c(['g4', 'bes4', 'd5'], dur))

chords_besdg(2)
chords_gces(2)
chords_besdg()
chords_gces(3)

chords_fad(2)
chords_gbesd(2)
chords_fad()
chords_gbesd(3)

chords_egc(2)
chords_fac()
chords_fbesd()


violin.append(r(5*4))
