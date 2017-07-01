from mido import Message, MetaMessage, MidiTrack, MidiFile, bpm2tempo


class Scale:

    def __init__(self, midi_root_tone, intervals, signature):
        if intervals == 'major':
            intervals = [0, 2, 4, 5, 7, 9, 11]
        elif intervals == 'minor':
            intervals = [0, 2, 3, 5, 7, 8, 10]
        self.midi_tones = list(map(lambda i: midi_root_tone + i, intervals))

        self.signature = signature

    def __getitem__(self, item):
        return self.midi_tones[item % len(self.midi_tones)] + 12 * (item // len(self.midi_tones))


f_major = Scale(65, 'major', 'F')
f_minor = Scale(65, 'minor', 'Fm')
c_minor = Scale(60, 'minor', 'Cm')
g_minor = Scale(67, 'minor', 'Gm')

assert c_minor[0] == 60
assert c_minor[1] == 62
assert c_minor[3] == 65
assert c_minor[7] == 72
assert c_minor[-1] == 58
assert c_minor[-8] == 46


class Track(MidiTrack):

    def __init__(self, midi_file=None):
        self.parent = midi_file
        self.shift = 0
        self.shift_in_scale = 0
        self._beats_to_rest = 0
        self._beats_stolen = 0
        self._scale = None

    def play(self, tones, beats=1, grace=False):
        if tones in [None, 'r', 'R']:
            return self.rest(beats)

        if beats == 'grace':
            return self.grace(tones)

        if not isinstance(tones, list):
            tones = [tones]

        note = lambda tone: self.scale[tone + self.shift_in_scale] + 12 * self.shift
        time = lambda beats: int(beats * self.parent.ticks_per_beat)

        note_on = lambda tone, beats: self.append(
            Message('note_on', note=note(tone), velocity=100, time=time(beats))
        )
        note_off = lambda tone, beats: self.append(
            Message('note_off', note=note(tone), time=time(beats))
        )

        note_on(tones[0], self._beats_to_rest)
        self._beats_to_rest = 0
        for tone in tones[1:]:
            note_on(tone, 0)

        if grace:
            note_off(tones[0], beats)
            self._beats_stolen += beats
        else:
            note_off(tones[0], beats - self._beats_stolen)
            self._beats_stolen = 0
        for tone in tones[1:]:
            note_off(tone, 0)

    def sequence(self, sequence):
        for play_args in sequence:
            self.play(*play_args)

    def grace(self, tones, portion=8):
        self.play(tones, beats=1.0/portion, grace=True)

    def rest(self, beats):
        self._beats_to_rest += beats

    @property
    def scale(self):
        return self._scale

    @scale.setter
    def scale(self, scale):
        if scale != self._scale:
            self._scale = scale
            self.append(MetaMessage('key_signature', key=scale.signature))

    @property
    def bpm(self):
        return self._bpm

    @bpm.setter
    def bpm(self, bpm):
        self._bpm = bpm
        self.append(MetaMessage('set_tempo', tempo=bpm2tempo(bpm)))

    @property
    def parent(self):
        return self._parent

    @parent.setter
    def parent(self, midi_file):
        self._parent = midi_file
        midi_file.tracks.append(self)

    @property
    def instrument(self):
        return self._instrument

    @instrument.setter
    def instrument(self, instrument):
        self._instrument = instrument
        self.append(Message('program_change', program=instrument))


def bassline():
    for _ in range(4):
        bass.play(0)
        bass.play(4)
    for _ in range(4):
        bass.play(-2)
        bass.play(5)


def bassline_bridge():
    bass.scale = c_minor
    bass.sequence([(4, 2), (7, 2),
                   (4,), (7,), (4,), (7,)])

    bass.scale = g_minor
    bass.sequence([(4, 2), (0, 2),
                   (0,), (4,), (0,), (4,)])

    bass.scale = f_major
    bass.sequence([(4, 2), (7, 2)])


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
        chords.play([0, 2, 4], 4)
        chords.grace(-3)
        chords.play([2, 4, 7], 4)
        chords.grace(-2)
    elif variation in [0, 1, 2]:
        chords.play([0, 2, 4], 1)
        chords.play([-3, -1, 1], 3)
        chords.play([0, 2, 4], 4)
    elif variation == 3:
        chords.play([0, 2, 4], 1)
        chords.play([-3, -1, 1], 2)
        chords.play([-3, -1, 1], 1)
        chords.grace(7)
        chords.play([0, 2, 4], 4)

    if variation in [-1, 0]:
        chords.play([2, 5, 7], 4)
    elif variation == 1:
        chords.play([2, 5, 7], 1)
        chords.play([0, 3, 5], 3)
    elif variation == 2:
        chords.play([2, 5, 7], 1)
        chords.play([3, 5, 7], 3)
    elif variation == 3:
        chords.play([2, 5, 7], 1)
        chords.play([0, 3, 5], 2)
        chords.play([0, 3, 5], 1)
        chords.grace(-2)

    chords.play([0, 2, 5], 4)


def chords_chorus(variation):
    assert 0 <= variation <= 2

    chords.play([0, 2, 4], 1)
    chords.grace(3)
    chords.play([-1, 1, 4], 3)

    if variation == 2:
        chords.sequence([
            (0, 'grace'),
            (2, 'grace'),
            (4, 'grace'),
        ])
    chords.play([0, 2, 4], 4)

    chords.play([2, 5, 7], 1)
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
    chords.scale = c_minor
    chords.sequence([
        ([4, 6, 8], 2),
        ([4, 7, 9], 2),
        ([4, 6, 8], 1),
        ([4, 7, 9], 3),
    ])

    chords.scale = g_minor
    chords.sequence([
        ([-1, 1, 4], 2),
        (3, 'grace'),
        ([0, 2, 4], 2),
        ([-1, 1, 4], 1),
        (3, 'grace'),
        ([0, 2, 4], 3),
    ])

    chords.scale = f_major
    chords.sequence([
        ([-1, 1, 4], 2),
        ([0, 2, 4],),
        ([1, 4, 6],),
    ])


def chords_outro():
    for v in [2, 1]:
        chords_chorus(v)

    chords.shift_in_scale = -1
    chords_chorus(1)

    chords.shift_in_scale = -2
    chords_chorus(1)

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
    bass.play(4, 2)
    bass.scale = f_minor
    bass.play(-2, 2)
    for _ in range(6):
        bassline()

    chords.play([1, 4, 6], 2)
    chords.scale = f_minor
    chords.play([0, 2, 7], 2)
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


mid = MidiFile()

bass = Track(mid)
chords = Track(mid)
violin = Track(mid)

bass.shift = -2
bass.bpm = 180

violin.instrument = 41

intro()
verse()
chorus()
bridge()
verse()
chorus()
outro()

mid.save('po_midi.mid')