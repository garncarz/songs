from music21 import *

# TODO grace notes


def n(name, dur=1, **kwargs):
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
