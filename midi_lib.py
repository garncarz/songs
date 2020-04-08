from contextlib import contextmanager
import itertools

from mido import Message, MetaMessage, MidiTrack, MidiFile, bpm2tempo


class Scale:

    midi_root_tones = ['c', 'cis', 'd', 'dis', 'e', 'f', 'fis', 'g', 'gis', 'a', 'ais', 'b']

    intervals = {
        'major': [0, 2, 4, 5, 7, 9, 11],
        'minor': [0, 2, 3, 5, 7, 8, 10],
    }

    def __init__(self, midi_root_tone, intervals, signature=None):
        if isinstance(midi_root_tone, str):
            midi_root_tone = self.midi_root_tones.index(midi_root_tone.lower()) + 60

        if isinstance(intervals, str):
            intervals = self.intervals[intervals]

        self.midi_tones = list(map(lambda i: midi_root_tone + i, intervals))

        if signature is None:
            signature = self.midi_root_tones[midi_root_tone - 60].capitalize()
            if intervals == self.intervals['minor']:
                signature += 'm'

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

    def __init__(self, midi_file=None, channel=0):
        self.parent = midi_file
        self.channel = channel

        self.octave_shift = 0
        self.shift_in_scale = 0
        self._beats_to_rest = 0
        self._beats_stolen = 0
        self._scale = None
        self._time_signature = None
        self._instrument = None
        self._bpm = None
        self.grace_portion = 8  # TODO change to grace_beats
        self.default_beats = 1
        self.arpeggio_delay_beats = 1/8
        self.volume = 100

    def _note(self, tone):
        if self.channel == 9:  # percussion
            return tone

        if isinstance(tone, tuple):
            tone, midi_shift = tone
        else:
            midi_shift = 0
        return self.scale[tone + self.shift_in_scale] + 12 * self.octave_shift + midi_shift

    def _time(self, beats):
        return int(beats * self.parent.ticks_per_beat)

    def _apply_volume(self, volume):
        if not volume:
            return self.volume
        if isinstance(volume, int) or isinstance(volume, float):
            return self.volume + volume
        raise ValueError(f'Unknown volume/velocity: {volume}')

    def _note_on(self, tone, beats=0, volume=None):
        self.append(Message(
            'note_on',
            note=self._note(tone),
            velocity=int(self._apply_volume(volume)),
            time=self._time(beats),
            channel=self.channel,
        ))

    def _note_off(self, tone, beats=0):
        self.append(Message('note_off', note=self._note(tone), time=self._time(beats),
                            channel=self.channel))

    def play(self, tones, beats=None, grace=False, staccato=False, arpeggio=False,
             volume=None):
        if isinstance(tones, Scale):
            self.scale = tones
            return

        if tones == 'volume':  # TODO make nicer
            self.volume = volume
            return

        if beats == 'grace':
            return self.grace(tones)
        elif not beats:
            beats = self.default_beats

        if tones in [None, 'r', 'R']:
            return self.rest(beats)

        if not isinstance(tones, list):
            tones = [tones]

        self._note_on(tones[0], self._beats_to_rest, volume=volume)
        self._beats_to_rest = 0
        for tone in tones[1:]:
            if arpeggio:
                self._note_on(tone, self.arpeggio_delay_beats, volume=volume)
                beats -= self.arpeggio_delay_beats
            else:
                self._note_on(tone, volume=volume)

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
        if isinstance(instrument, dict):
            self.octave_shift = instrument.get('octave_shift', 0)
            instrument = instrument['midi_number']
        self._instrument = instrument
        self.append(Message('program_change',
                            program=instrument - 1,  # is it just Mido that counts from 0?
                            channel=self.channel))


class Song(MidiFile):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.scale = None
        self.time_signature = None
        self.bpm = None
        self.default_beats = None
        self.volume = 100
        self._new_channel = 0

    def new_track(self, channel=None):
        if not channel:
            channel = self._new_channel
            self._new_channel += 1

        track = Track(self, channel)

        if self.scale and channel != 9:
            track.scale = self.scale
        if self.time_signature:
            track.time_signature = self.time_signature
        if self.bpm:
            track.bpm = self.bpm
        if self.default_beats:
            track.default_beats = self.default_beats
        if self.volume:
            track.volume = self.volume

        return track

    def new_drumming_track(self):
        return self.new_track(9)


instruments = {
    'bright acoustic piano': 2,
    'harpsichord': 7,
    'celesta': 9,
    'church organ': 20,
    'electric guitar (clean)': 28,
    'acoustic bass': {
        'midi_number': 33,
        'octave_shift': -2,
    },
    'violin': 41,
    'cello': 43,
    'contrabass': {
        'midi_number': 44,
        'octave_shift': -2,
    },
    'trumpet': 57,
    'baritone sax': {
        'midi_number': 68,
        'octave_shift': -1,
    },
    'piccolo': 73,
    'sitar': 105,
    'banjo': 106,
    'shamisen': 107,
    'koto': 108,
}


# drumming:
bda = 35
ssl = 37
mar = 70
hh = 42
ridecymbal = 51


# helpers:

def line(*tones, beats):
    if isinstance(beats, list):
        return list(zip(tones, itertools.cycle(beats)))
    return list(map(lambda t: (t, beats), tones))
