from contextlib import contextmanager

from mido import Message, MetaMessage, MidiTrack, MidiFile, bpm2tempo


# Note names for MIDI conversion - using same convention as Scale.midi_root_tones
_NOTE_NAMES = ['c', 'cis', 'd', 'dis', 'e', 'f', 'fis', 'g', 'gis', 'a', 'ais', 'b']


def midi_to_note_name(midi_number):
    """
    Convert MIDI note number to note name with octave.
    
    Args:
        midi_number (int): MIDI note number (0-127)
        
    Returns:
        str: Note name with octave (e.g., 'C4', 'Cis4')
        
    Examples:
        midi_to_note_name(60) -> 'C4'  # Middle C
        midi_to_note_name(61) -> 'Cis4'
        midi_to_note_name(72) -> 'C5'
    """
    if not 0 <= midi_number <= 127:
        raise ValueError(f"MIDI number must be between 0 and 127, got {midi_number}")
    
    octave = (midi_number // 12) - 1  # MIDI octave numbering: C4 = 60
    note_index = midi_number % 12
    note_name = _NOTE_NAMES[note_index]
    
    return f"{note_name.capitalize()}{octave}"


def note_name_to_midi(note_name):
    """
    Convert note name with octave to MIDI note number.
    
    Args:
        note_name (str): Note name with octave (e.g., 'C4', 'cis4', 'Dis5')
        
    Returns:
        int: MIDI note number (0-127)
        
    Examples:
        note_name_to_midi('C4') -> 60  # Middle C
        note_name_to_midi('cis4') -> 61
        note_name_to_midi('C5') -> 72
    """
    if not isinstance(note_name, str) or len(note_name) < 2:
        raise ValueError(f"Invalid note name format: {note_name}")
    
    # Extract octave number (last digit(s))
    octave_str = ''
    note_part = ''
    for i in range(len(note_name) - 1, -1, -1):
        if note_name[i].isdigit() or note_name[i] == '-':
            octave_str = note_name[i] + octave_str
        else:
            note_part = note_name[:i+1]
            break
    
    if not octave_str:
        raise ValueError(f"No octave number found in note name: {note_name}")
    
    try:
        octave = int(octave_str)
    except ValueError:
        raise ValueError(f"Invalid octave number: {octave_str}")
    
    note_part = note_part.lower()
    
    try:
        note_index = _NOTE_NAMES.index(note_part)
    except ValueError:
        raise ValueError(f"Unknown note name: {note_part}")
    
    midi_number = (octave + 1) * 12 + note_index
    
    if not 0 <= midi_number <= 127:
        raise ValueError(f"Resulting MIDI number {midi_number} is out of range (0-127)")
    
    return midi_number


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

    def _note_on(self, tone, beats=0):
        self.append(Message('note_on', note=self._note(tone), velocity=100, time=self._time(beats),
                            channel=self.channel))

    def _note_off(self, tone, beats=0):
        self.append(Message('note_off', note=self._note(tone), time=self._time(beats),
                            channel=self.channel))

    def play(self, tones, beats=None, grace=False, staccato=False, arpeggio=False):
        if isinstance(tones, Scale):
            self.scale = tones
            return

        if beats == 'grace':
            return self.grace(tones)
        elif not beats:
            beats = self.default_beats

        if tones in [None, 'r', 'R']:
            return self.rest(beats)

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

        return track

    def new_drumming_track(self):
        return self.new_track(9)


instruments = {
    'bright acoustic piano': 2,
    'harpsichord': 7,
    'church organ': 20,
    'electric guitar (clean)': 28,
    'acoustic bass': {
        'midi_number': 33,
        'octave_shift': -2,
    },
    'violin': 41,
    'cello': 43,
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
