from contextlib import contextmanager

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
c_major = Scale(60, 'major', 'C')
c_minor = Scale(60, 'minor', 'Cm')
g_minor = Scale(67, 'minor', 'Gm')
b_minor = Scale(71, 'minor', 'Bm')


class Track(MidiTrack):

    def __init__(self, midi_file=None):
        self.parent = midi_file
        self.shift = 0
        self.shift_in_scale = 0
        self._beats_to_rest = 0
        self._beats_stolen = 0
        self._scale = None
        self._time_signature = None
        self.grace_portion = 8  # TODO change to grace_beats
        self.default_beats = 1
        self.arpeggio_delay_beats = 1/8

    def _note(self, tone):
        if isinstance(tone, tuple):
            tone, midi_shift = tone
        else:
            midi_shift = 0
        return self.scale[tone + self.shift_in_scale] + 12 * self.shift + midi_shift

    def _time(self, beats):
        return int(beats * self.parent.ticks_per_beat)

    def _note_on(self, tone, beats=0):
        self.append(Message('note_on', note=self._note(tone), velocity=100, time=self._time(beats)))

    def _note_off(self, tone, beats=0):
        self.append(Message('note_off', note=self._note(tone), time=self._time(beats)))

    def play(self, tones, beats=None, grace=False, staccato=False, arpeggio=False):
        if isinstance(tones, Scale):
            self.scale = tones
            return

        if tones in [None, 'r', 'R']:
            return self.rest(beats)

        if beats == 'grace':
            return self.grace(tones)
        elif not beats:
            beats = self.default_beats

        if not isinstance(tones, list):
            tones = [tones]

        self._note_on(tones[0], self._beats_to_rest)
        self._beats_to_rest = 0
        for tone in tones[1:]:
            if arpeggio:
                self._note_on(tone, self.arpeggio_delay_beats)
                beats -= self.arpeggio_delay_beats
            else:
                self._note_on(tone)

        if grace:
            self._note_off(tones[0], beats)
            self._beats_stolen += beats
        else:
            beats -= self._beats_stolen
            self._beats_stolen = 0
            if staccato:
                beats /= 2
            self._note_off(tones[0], beats)
        for tone in tones[1:]:
            self._note_off(tone)

        if staccato:
            self.rest(beats)

    @contextmanager
    def shadow_play(self, tones):
        if not isinstance(tones, list):
            tones = [tones]

        self._note_on(tones[0], self._beats_to_rest)
        self._beats_to_rest = 0
        for tone in tones[1:]:
            self._note_on(tone)

        yield

        for tone in tones:
            self._note_off(tone)

    def sequence(self, sequence):
        for play_args in sequence:
            # it should be a tuple/dict to fully use `play`
            if isinstance(play_args, int):  # single tone
                play_args = [play_args]
            elif isinstance(play_args, list):  # chord
                play_args = [play_args]

            if isinstance(play_args, dict):
                self.play(**play_args)
            else:
                self.play(*play_args)

    def grace(self, tones, portion=None):
        portion = portion or self.grace_portion
        self.play(tones, beats=1.0/portion, grace=True)

    def rest(self, beats):
        self._beats_to_rest += beats

    @property
    def scale(self):
        if not self._scale:
            self._scale = c_major
        return self._scale

    @scale.setter
    def scale(self, scale):
        if scale != self._scale:
            self._scale = scale
            self.append(MetaMessage('key_signature', key=scale.signature))

    @property
    def time_signature(self):
        return self._time_signature

    @time_signature.setter
    def time_signature(self, time_signature):
        if time_signature != self._time_signature:
            self._time_signature = time_signature
            up, down = time_signature
            self.append(MetaMessage('time_signature', numerator=up, denominator=down))

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