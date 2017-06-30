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
c_minor = Scale(60, 'minor', 'Cm')

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
        self._rest = 0
        self.beats_stolen = 0

    def play(self, tones, beats=1, grace=False):
        if not isinstance(tones, list):
            tones = [tones]

        note = lambda tone: self.scale[tone] + 12 * self.shift
        time = lambda beats: int(beats * self.parent.ticks_per_beat)

        note_on = lambda tone, time: self.append(Message('note_on', note=note(tone), velocity=100, time=time))
        note_off = lambda tone, time: self.append(Message('note_off', note=note(tone), time=time))

        note_on(tones[0], time(self._rest))
        self._rest = 0
        for tone in tones[1:]:
            note_on(tone, 0)

        if grace:
            note_off(tones[0], time(beats))
            self.beats_stolen += beats
        else:
            note_off(tones[0], time(beats - self.beats_stolen))
            self.beats_stolen = 0
        for tone in tones[1:]:
            note_off(tone, 0)

    def grace(self, tones, portion=16):
        self.play(tones, beats=1.0/portion, grace=True)

    def rest(self, rest):
        self._rest = rest

    @property
    def scale(self):
        return self._scale

    @scale.setter
    def scale(self, scale):
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


mid = MidiFile()

bass = Track(mid)
chords = Track(mid)
violin = Track(mid)


bass.scale = f_major
bass.shift = -2
bass.bpm = 180

for _ in range(8):
    for _ in range(4):
        bass.play(0)
        bass.play(4)
    for _ in range(4):
        bass.play(-2)
        bass.play(5)


chords.scale = f_major

chords.rest(4 * 4)

for _ in range(2):  # TODO variations are not exactly correct
    chords.play([0, 2, 4], 4)
    chords.grace(-3)
    chords.play([2, 4, 7], 4)
    chords.grace(-2)
    chords.play([2, 5, 7], 4)
    chords.play([0, 2, 5], 4)

    chords.play([0, 2, 4], 1)
    chords.play([-3, -1, 1], 3)
    chords.play([0, 2, 4], 4)
    chords.play([2, 5, 7], 4)
    chords.play([0, 2, 5], 4)

    chords.play([0, 2, 4], 1)
    chords.play([-3, -1, 1], 3)
    chords.play([0, 2, 4], 4)
    chords.play([2, 5, 7], 1)
    chords.play([0, 3, 5], 3)
    chords.play([0, 2, 5], 4)

    chords.play([0, 2, 4], 1)
    chords.play([-3, -1, 1], 3)
    chords.play([0, 2, 4], 4)
    chords.play([2, 5, 7], 1)
    chords.play([3, 5, 7], 3)
    chords.play([0, 2, 5], 4)


violin.scale = f_major
violin.instrument = 41

violin.rest(4 * 20)

for _ in range(2):
    for tone in [0, 1, 4, 1, 0, 2, 4, 2]:
        violin.play(tone)

    violin.play(-2, 2)
    violin.play(3, 2)

    violin.play(0)
    violin.play(-2)
    violin.play(2, 2)

violin.play(-3, 2)
violin.play(-1, 2)
violin.play(0, 2)

violin.play(4)
violin.play(4)
violin.play(5, 2)

for tone in [3, 3, 0, 1, 4, 1]:
    violin.play(tone)


mid.save('po_midi.mid')