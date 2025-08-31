from midi_lib import *


def test_c_minor():
    assert c_minor[0] == 60
    assert c_minor[1] == 62
    assert c_minor[3] == 65
    assert c_minor[7] == 72
    assert c_minor[-1] == 58
    assert c_minor[-8] == 46


def test_midi_to_note_name():
    # Test middle C and surrounding notes
    assert midi_to_note_name(60) == 'C4'
    assert midi_to_note_name(61) == 'Cis4' 
    assert midi_to_note_name(62) == 'D4'
    assert midi_to_note_name(63) == 'Dis4'
    assert midi_to_note_name(64) == 'E4'
    
    # Test different octaves
    assert midi_to_note_name(72) == 'C5'  # C one octave higher
    assert midi_to_note_name(48) == 'C3'  # C one octave lower
    assert midi_to_note_name(36) == 'C2'
    assert midi_to_note_name(24) == 'C1' 
    assert midi_to_note_name(12) == 'C0'
    
    # Test boundary values
    assert midi_to_note_name(0) == 'C-1'
    assert midi_to_note_name(127) == 'G9'
    
    # Test all notes in one octave
    expected_notes_4 = ['C4', 'Cis4', 'D4', 'Dis4', 'E4', 'F4', 'Fis4', 'G4', 'Gis4', 'A4', 'Ais4', 'B4']
    for i, expected in enumerate(expected_notes_4):
        assert midi_to_note_name(60 + i) == expected


def test_note_name_to_midi():
    # Test middle C and surrounding notes
    assert note_name_to_midi('C4') == 60
    assert note_name_to_midi('c4') == 60  # case insensitive
    assert note_name_to_midi('cis4') == 61
    assert note_name_to_midi('Cis4') == 61
    assert note_name_to_midi('D4') == 62
    assert note_name_to_midi('dis4') == 63
    assert note_name_to_midi('E4') == 64
    
    # Test different octaves  
    assert note_name_to_midi('C5') == 72
    assert note_name_to_midi('C3') == 48
    assert note_name_to_midi('C2') == 36
    assert note_name_to_midi('C1') == 24
    assert note_name_to_midi('C0') == 12
    
    # Test boundary values
    assert note_name_to_midi('C-1') == 0
    assert note_name_to_midi('G9') == 127
    
    # Test all notes in one octave
    note_names_4 = ['C4', 'Cis4', 'D4', 'Dis4', 'E4', 'F4', 'Fis4', 'G4', 'Gis4', 'A4', 'Ais4', 'B4']
    for i, note_name in enumerate(note_names_4):
        assert note_name_to_midi(note_name) == 60 + i
        assert note_name_to_midi(note_name.lower()) == 60 + i


def test_midi_conversion_roundtrip():
    # Test that conversion is bidirectional
    for midi_num in [0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 127]:
        note_name = midi_to_note_name(midi_num)
        back_to_midi = note_name_to_midi(note_name)
        assert back_to_midi == midi_num
        
    # Test a range of notes
    for midi_num in range(0, 128, 7):  # Test every 7th note
        note_name = midi_to_note_name(midi_num)
        back_to_midi = note_name_to_midi(note_name)
        assert back_to_midi == midi_num


def test_midi_to_note_name_edge_cases():
    # Test invalid input
    try:
        midi_to_note_name(-1)
        assert False, "Should raise ValueError for negative input"
    except ValueError:
        pass
        
    try:
        midi_to_note_name(128)
        assert False, "Should raise ValueError for input > 127"
    except ValueError:
        pass


def test_note_name_to_midi_edge_cases():
    # Test invalid inputs
    try:
        note_name_to_midi("C")  # No octave
        assert False, "Should raise ValueError for missing octave"
    except ValueError:
        pass
        
    try:
        note_name_to_midi("X4")  # Invalid note name
        assert False, "Should raise ValueError for invalid note name"
    except ValueError:
        pass
        
    try:
        note_name_to_midi("Cis")  # No octave
        assert False, "Should raise ValueError for missing octave"
    except ValueError:
        pass
        
    try:
        note_name_to_midi("")  # Empty string
        assert False, "Should raise ValueError for empty string" 
    except ValueError:
        pass