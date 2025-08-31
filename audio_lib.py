"""
Audio generation library with support for microtonal tuning transitions.

This module provides functionality to generate raw audio with different tuning systems
and smooth transitions between them, enabling effects like Equal Temperament to 
Pythagorean tuning morphs during playback.
"""

import numpy as np
from scipy.io.wavfile import write
import math


class TuningSystem:
    """Base class for different tuning systems."""
    
    def frequency(self, note, root_freq=440.0):
        """
        Calculate frequency for a given note.
        
        Args:
            note: MIDI note number (69 = A4 = 440 Hz by default)
            root_freq: Reference frequency for A4
            
        Returns:
            Frequency in Hz
        """
        raise NotImplementedError


class EqualTemperament(TuningSystem):
    """12-tone equal temperament tuning system."""
    
    def frequency(self, note, root_freq=440.0):
        """Calculate ET frequency: f = root_freq * 2^((note-69)/12)"""
        return root_freq * (2 ** ((note - 69) / 12))


class PythagoreanTuning(TuningSystem):
    """Pythagorean tuning system based on perfect fifths (3:2 ratio)."""
    
    # Pythagorean intervals in cents from root (C = 0)
    # Based on stacking perfect fifths (701.955 cents) and reducing by octaves
    INTERVALS_CENTS = {
        0: 0,      # C (unison)
        1: 113.685, # C# (apotome)
        2: 203.910, # D (whole tone)
        3: 317.596, # D# (minor third)
        4: 407.820, # E (major third) 
        5: 498.045, # F (perfect fourth)
        6: 611.731, # F# (tritone)
        7: 701.955, # G (perfect fifth)
        8: 815.641, # G# (minor sixth)
        9: 905.865, # A (major sixth)
        10: 1019.551, # A# (minor seventh)
        11: 1109.775  # B (major seventh)
    }
    
    def frequency(self, note, root_freq=440.0):
        """Calculate Pythagorean frequency using cent intervals."""
        # Convert MIDI note to semitones from C4 (note 60)
        semitones_from_c4 = note - 60
        octave_offset = semitones_from_c4 // 12
        note_in_octave = semitones_from_c4 % 12
        
        # Get cents offset for this note
        cents = self.INTERVALS_CENTS[note_in_octave]
        
        # Convert cents to frequency ratio: 2^(cents/1200)
        frequency_ratio = 2 ** (cents / 1200)
        
        # Apply octave offset
        octave_multiplier = 2 ** octave_offset
        
        # Calculate final frequency (C4 = 261.626 Hz in equal temperament)
        c4_freq = root_freq * (2 ** ((60 - 69) / 12))  # C4 frequency in ET
        return c4_freq * frequency_ratio * octave_multiplier


class AudioGenerator:
    """Generate audio with microtonal tuning capabilities."""
    
    def __init__(self, sample_rate=44100):
        self.sample_rate = sample_rate
        self.et = EqualTemperament()
        self.pt = PythagoreanTuning()
    
    def generate_tone(self, frequency, duration, amplitude=0.5):
        """
        Generate a pure sine tone.
        
        Args:
            frequency: Frequency in Hz
            duration: Duration in seconds
            amplitude: Amplitude (0-1)
            
        Returns:
            numpy array of audio samples
        """
        t = np.linspace(0, duration, int(self.sample_rate * duration), False)
        # Apply gentle attack/decay envelope to avoid clicks
        envelope = np.ones_like(t)
        fade_samples = int(0.01 * self.sample_rate)  # 10ms fade
        if len(t) > 2 * fade_samples:
            envelope[:fade_samples] = np.linspace(0, 1, fade_samples)
            envelope[-fade_samples:] = np.linspace(1, 0, fade_samples)
        
        return amplitude * envelope * np.sin(2 * np.pi * frequency * t)
    
    def interpolate_frequency(self, note, tuning_progress, root_freq=440.0):
        """
        Interpolate frequency between ET and Pythagorean tuning.
        
        Args:
            note: MIDI note number
            tuning_progress: 0.0 = pure ET, 1.0 = pure Pythagorean
            root_freq: Reference frequency
            
        Returns:
            Interpolated frequency in Hz
        """
        et_freq = self.et.frequency(note, root_freq)
        pt_freq = self.pt.frequency(note, root_freq)
        
        # Linear interpolation
        return et_freq * (1 - tuning_progress) + pt_freq * tuning_progress
    
    def generate_morphing_tone(self, note, duration, start_tuning=0.0, end_tuning=1.0, 
                              amplitude=0.5, root_freq=440.0):
        """
        Generate a tone that morphs between tuning systems during playback.
        
        Args:
            note: MIDI note number
            duration: Duration in seconds
            start_tuning: Starting tuning (0.0=ET, 1.0=Pythagorean)
            end_tuning: Ending tuning (0.0=ET, 1.0=Pythagorean)
            amplitude: Amplitude (0-1)
            root_freq: Reference frequency
            
        Returns:
            numpy array of audio samples
        """
        samples = int(self.sample_rate * duration)
        t = np.linspace(0, duration, samples, False)
        
        # Calculate tuning progress over time
        tuning_progress = np.linspace(start_tuning, end_tuning, samples)
        
        # Calculate instantaneous frequency for each sample
        frequencies = np.array([
            self.interpolate_frequency(note, progress, root_freq)
            for progress in tuning_progress
        ])
        
        # Generate phase-accurate sine wave with changing frequency
        # We need to integrate frequency to get phase
        phase = 2 * np.pi * np.cumsum(frequencies) / self.sample_rate
        
        # Apply envelope
        envelope = np.ones_like(t)
        fade_samples = int(0.01 * self.sample_rate)  # 10ms fade
        if samples > 2 * fade_samples:
            envelope[:fade_samples] = np.linspace(0, 1, fade_samples)
            envelope[-fade_samples:] = np.linspace(1, 0, fade_samples)
        
        return amplitude * envelope * np.sin(phase)
    
    def save_wav(self, audio_data, filename, normalize=True):
        """
        Save audio data to WAV file.
        
        Args:
            audio_data: numpy array of audio samples
            filename: Output filename
            normalize: Whether to normalize audio levels
        """
        if normalize:
            # Normalize to prevent clipping
            max_val = np.max(np.abs(audio_data))
            if max_val > 0:
                audio_data = audio_data / max_val * 0.95
        
        # Convert to 16-bit integer
        audio_16bit = (audio_data * 32767).astype(np.int16)
        write(filename, self.sample_rate, audio_16bit)


def create_tuning_demo():
    """Create a demonstration of tuning system transitions."""
    generator = AudioGenerator()
    
    # Musical sequence: perfect fifth (C4 + G4) showing the tuning difference
    c4 = 60  # MIDI note number for C4
    g4 = 67  # MIDI note number for G4 (perfect fifth above C4)
    
    duration = 3.0  # seconds per note
    audio_parts = []
    
    # Part 1: Pure Equal Temperament fifth
    print("Generating Equal Temperament fifth...")
    c4_et = generator.generate_tone(generator.et.frequency(c4), duration, 0.4)
    g4_et = generator.generate_tone(generator.et.frequency(g4), duration, 0.4)
    et_fifth = c4_et + g4_et
    audio_parts.append(et_fifth)
    
    # Part 2: Transition from ET to Pythagorean
    print("Generating ET → Pythagorean transition...")
    c4_morph = generator.generate_morphing_tone(c4, duration, 0.0, 1.0, 0.4)
    g4_morph = generator.generate_morphing_tone(g4, duration, 0.0, 1.0, 0.4)
    morph_fifth = c4_morph + g4_morph
    audio_parts.append(morph_fifth)
    
    # Part 3: Pure Pythagorean fifth
    print("Generating Pythagorean fifth...")
    c4_pt = generator.generate_tone(generator.pt.frequency(c4), duration, 0.4)
    g4_pt = generator.generate_tone(generator.pt.frequency(g4), duration, 0.4)
    pt_fifth = c4_pt + g4_pt
    audio_parts.append(pt_fifth)
    
    # Part 4: Transition back from Pythagorean to ET
    print("Generating Pythagorean → ET transition...")
    c4_morph_back = generator.generate_morphing_tone(c4, duration, 1.0, 0.0, 0.4)
    g4_morph_back = generator.generate_morphing_tone(g4, duration, 1.0, 0.0, 0.4)
    morph_back_fifth = c4_morph_back + g4_morph_back
    audio_parts.append(morph_back_fifth)
    
    # Add brief silence between parts
    silence = np.zeros(int(generator.sample_rate * 0.5))
    
    # Combine all parts with silence
    full_audio = np.concatenate([
        audio_parts[0], silence,
        audio_parts[1], silence, 
        audio_parts[2], silence,
        audio_parts[3]
    ])
    
    # Save the result
    output_file = "tuning_transition_demo.wav"
    generator.save_wav(full_audio, output_file)
    print(f"Demo saved as {output_file}")
    
    # Print frequency information for analysis
    print("\nFrequency Analysis:")
    print(f"C4 - Equal Temperament: {generator.et.frequency(c4):.2f} Hz")
    print(f"C4 - Pythagorean: {generator.pt.frequency(c4):.2f} Hz")
    print(f"G4 - Equal Temperament: {generator.et.frequency(g4):.2f} Hz") 
    print(f"G4 - Pythagorean: {generator.pt.frequency(g4):.2f} Hz")
    
    et_ratio = generator.et.frequency(g4) / generator.et.frequency(c4)
    pt_ratio = generator.pt.frequency(g4) / generator.pt.frequency(c4)
    perfect_fifth_ratio = 3.0 / 2.0
    
    print(f"\nFifth Ratios:")
    print(f"Equal Temperament: {et_ratio:.6f} (vs perfect 3:2 = {perfect_fifth_ratio:.6f})")
    print(f"Pythagorean: {pt_ratio:.6f} (vs perfect 3:2 = {perfect_fifth_ratio:.6f})")
    print(f"ET deviation from perfect: {abs(et_ratio - perfect_fifth_ratio):.6f}")
    print(f"Pythagorean deviation from perfect: {abs(pt_ratio - perfect_fifth_ratio):.6f}")


if __name__ == "__main__":
    create_tuning_demo()