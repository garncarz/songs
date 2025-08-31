from midi_lib import *


def test_c_minor():
    assert c_minor[0] == 60
    assert c_minor[1] == 62
    assert c_minor[3] == 65
    assert c_minor[7] == 72
    assert c_minor[-1] == 58
    assert c_minor[-8] == 46


def test_instrument_name_to_midi_number():
    """Test converting instrument names to MIDI numbers."""
    # Test simple instrument mapping
    assert instrument_name_to_midi_number('harpsichord') == 7
    assert instrument_name_to_midi_number('church organ') == 20
    assert instrument_name_to_midi_number('violin') == 41
    
    # Test complex instrument mapping (with dict)
    assert instrument_name_to_midi_number('acoustic bass') == 33
    assert instrument_name_to_midi_number('baritone sax') == 68
    
    # Test error for unknown instrument
    try:
        instrument_name_to_midi_number('unknown instrument')
        assert False, "Should have raised KeyError"
    except KeyError as e:
        assert 'unknown instrument' in str(e)


def test_midi_number_to_instrument_name():
    """Test converting MIDI numbers to instrument names."""
    # Test simple instrument mapping
    assert midi_number_to_instrument_name(7) == 'harpsichord'
    assert midi_number_to_instrument_name(20) == 'church organ'
    assert midi_number_to_instrument_name(41) == 'violin'
    
    # Test complex instrument mapping (with dict)
    assert midi_number_to_instrument_name(33) == 'acoustic bass'
    assert midi_number_to_instrument_name(68) == 'baritone sax'
    
    # Test unknown MIDI number
    assert midi_number_to_instrument_name(999) is None
    assert midi_number_to_instrument_name(0) is None


def test_track_instrument_string_assignment():
    """Test assigning instruments to tracks by string name."""
    song = Song()
    track = song.new_track()
    
    # Test setting instrument by string name
    track.instrument = 'harpsichord'
    assert track._instrument == 7
    
    # Test setting complex instrument by string name
    track2 = song.new_track()
    track2.instrument = 'acoustic bass'
    assert track2._instrument == 33
    assert track2.octave_shift == -2
    
    # Test error for unknown instrument name
    track3 = song.new_track()
    try:
        track3.instrument = 'unknown instrument'
        assert False, "Should have raised KeyError"
    except KeyError as e:
        assert 'unknown instrument' in str(e)


def test_track_instrument_backward_compatibility():
    """Test that existing ways of setting instruments still work."""
    song = Song()
    track = song.new_track()
    
    # Test setting by MIDI number directly
    track.instrument = 7
    assert track._instrument == 7
    
    # Test setting by dictionary
    track2 = song.new_track()
    track2.instrument = {'midi_number': 33, 'octave_shift': -2}
    assert track2._instrument == 33
    assert track2.octave_shift == -2
    
    # Test setting by instruments dict lookup (existing pattern)
    track3 = song.new_track()
    track3.instrument = instruments['violin']
    assert track3._instrument == 41


if __name__ == '__main__':
    test_c_minor()
    test_instrument_name_to_midi_number()
    test_midi_number_to_instrument_name()
    test_track_instrument_string_assignment()
    test_track_instrument_backward_compatibility()
    print("All tests passed!")