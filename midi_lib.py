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
        if isinstance(tones, Scale):
            self.scale = tones
            return

        if tones in [None, 'r', 'R']:
            return self.rest(beats)

        if beats == 'grace':
            return self.grace(tones)

        if not isinstance(tones, list):
            tones = [tones]

        def note(tone):
            if isinstance(tone, tuple):
                tone, midi_shift = tone
            else:
                midi_shift = 0
            return self.scale[tone + self.shift_in_scale] + 12 * self.shift + midi_shift
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