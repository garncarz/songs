#!/usr/bin/env python3
"""
Tests for the audio generation library with microtonal capabilities.
"""

import numpy as np
import os
import tempfile
from audio_lib import EqualTemperament, PythagoreanTuning, AudioGenerator


def test_equal_temperament():
    """Test Equal Temperament frequency calculations."""
    et = EqualTemperament()
    
    # Test A4 (MIDI 69) = 440 Hz
    assert abs(et.frequency(69) - 440.0) < 0.01
    
    # Test C4 (MIDI 60)
    c4_expected = 440.0 * (2 ** ((60 - 69) / 12))
    assert abs(et.frequency(60) - c4_expected) < 0.01
    
    # Test octave relationship (MIDI 60 vs 72)
    assert abs(et.frequency(72) / et.frequency(60) - 2.0) < 0.0001


def test_pythagorean_tuning():
    """Test Pythagorean tuning frequency calculations."""
    pt = PythagoreanTuning()
    
    # Test that perfect fifth (C to G) is exactly 3:2
    c4_freq = pt.frequency(60)  # C4
    g4_freq = pt.frequency(67)  # G4
    fifth_ratio = g4_freq / c4_freq
    assert abs(fifth_ratio - 1.5) < 0.0001
    
    # Test that perfect fourth (C to F) is exactly 4:3
    f4_freq = pt.frequency(65)  # F4
    fourth_ratio = f4_freq / c4_freq
    assert abs(fourth_ratio - 4/3) < 0.0001
    
    # Test octave relationship
    c5_freq = pt.frequency(72)  # C5
    assert abs(c5_freq / c4_freq - 2.0) < 0.0001


def test_audio_generation():
    """Test basic audio generation functionality."""
    generator = AudioGenerator(sample_rate=44100)
    
    # Test pure tone generation
    audio = generator.generate_tone(440.0, 1.0, 0.5)
    assert len(audio) == 44100  # 1 second at 44100 Hz
    assert np.max(audio) <= 0.5  # Amplitude check
    assert np.min(audio) >= -0.5
    
    # Test morphing tone generation
    morphing_audio = generator.generate_morphing_tone(60, 1.0, 0.0, 1.0, 0.5)
    assert len(morphing_audio) == 44100
    assert np.max(morphing_audio) <= 0.5
    assert np.min(morphing_audio) >= -0.5


def test_frequency_interpolation():
    """Test frequency interpolation between tuning systems."""
    generator = AudioGenerator()
    
    note = 67  # G4
    
    # Test endpoints
    et_freq = generator.interpolate_frequency(note, 0.0)
    pt_freq = generator.interpolate_frequency(note, 1.0)
    
    et_expected = generator.et.frequency(note)
    pt_expected = generator.pt.frequency(note)
    
    assert abs(et_freq - et_expected) < 0.01
    assert abs(pt_freq - pt_expected) < 0.01
    
    # Test midpoint
    mid_freq = generator.interpolate_frequency(note, 0.5)
    expected_mid = (et_expected + pt_expected) / 2
    assert abs(mid_freq - expected_mid) < 0.01


def test_tuning_differences():
    """Test that tuning systems produce different frequencies for same notes."""
    generator = AudioGenerator()
    
    # Test perfect fifth - should show clear difference
    note = 67  # G4
    et_freq = generator.et.frequency(note)
    pt_freq = generator.pt.frequency(note)
    
    # They should be different (Pythagorean fifth is slightly higher)
    assert pt_freq > et_freq
    assert abs(pt_freq - et_freq) > 0.1  # Should be measurable difference


def test_wav_file_creation():
    """Test WAV file creation and basic properties."""
    generator = AudioGenerator(sample_rate=44100)
    
    # Generate test audio
    test_audio = generator.generate_tone(440.0, 0.1, 0.5)  # Short 0.1s tone
    
    # Create temporary file
    with tempfile.NamedTemporaryFile(suffix='.wav', delete=False) as tmp_file:
        temp_filename = tmp_file.name
    
    try:
        # Save audio
        generator.save_wav(test_audio, temp_filename)
        
        # Check file exists and has reasonable size
        assert os.path.exists(temp_filename)
        file_size = os.path.getsize(temp_filename)
        assert file_size > 1000  # Should be at least 1KB for a 0.1s file
        
    finally:
        # Clean up
        if os.path.exists(temp_filename):
            os.remove(temp_filename)


def run_all_tests():
    """Run all tests."""
    tests = [
        test_equal_temperament,
        test_pythagorean_tuning, 
        test_audio_generation,
        test_frequency_interpolation,
        test_tuning_differences,
        test_wav_file_creation
    ]
    
    print("Running audio library tests...")
    
    for test in tests:
        try:
            test()
            print(f"✓ {test.__name__}")
        except Exception as e:
            print(f"✗ {test.__name__}: {e}")
            raise e
    
    print("All tests passed!")


if __name__ == "__main__":
    run_all_tests()