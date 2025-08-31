#!/usr/bin/env python3
"""
Tone Changing Tuning Demo Song

A musical demonstration of smooth transitions between Equal Temperament 
and Pythagorean tuning systems while notes are sounding.

This creates a short melody where intervals morph between tuning systems,
highlighting the difference in harmonic purity.
"""

import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from audio_lib import AudioGenerator
import numpy as np


def create_tuning_song():
    """Create a more complex musical example with tuning transitions."""
    generator = AudioGenerator()
    
    # Musical parameters
    bpm = 120
    beat_duration = 60.0 / bpm  # duration of one quarter note in seconds
    
    # Simple melody with harmony - focusing on intervals that show tuning differences
    # Using C major scale: C, D, E, F, G, A, B
    melody_notes = [
        (60, 2),  # C4, half note
        (64, 2),  # E4, half note (major third)
        (67, 2),  # G4, half note (perfect fifth)
        (72, 4),  # C5, whole note (octave)
    ]
    
    harmony_notes = [
        (48, 2),  # C3, half note (octave below)
        (52, 2),  # E3, half note
        (55, 2),  # G3, half note  
        (60, 4),  # C4, whole note
    ]
    
    audio_sections = []
    
    print("Creating tuning transition song...")
    
    # Section 1: Pure Equal Temperament
    print("  Section 1: Equal Temperament")
    melody_audio = []
    harmony_audio = []
    
    for note, beats in melody_notes:
        duration = beat_duration * beats
        melody_audio.append(generator.generate_tone(
            generator.et.frequency(note), duration, 0.4))
    
    for note, beats in harmony_notes:
        duration = beat_duration * beats
        harmony_audio.append(generator.generate_tone(
            generator.et.frequency(note), duration, 0.3))
    
    section1 = np.concatenate(melody_audio) + np.concatenate(harmony_audio)
    audio_sections.append(section1)
    
    # Section 2: Transition ET → Pythagorean
    print("  Section 2: ET → Pythagorean transition")
    melody_audio = []
    harmony_audio = []
    
    for note, beats in melody_notes:
        duration = beat_duration * beats
        melody_audio.append(generator.generate_morphing_tone(
            note, duration, 0.0, 1.0, 0.4))
    
    for note, beats in harmony_notes:
        duration = beat_duration * beats
        harmony_audio.append(generator.generate_morphing_tone(
            note, duration, 0.0, 1.0, 0.3))
    
    section2 = np.concatenate(melody_audio) + np.concatenate(harmony_audio)
    audio_sections.append(section2)
    
    # Section 3: Pure Pythagorean
    print("  Section 3: Pythagorean tuning")
    melody_audio = []
    harmony_audio = []
    
    for note, beats in melody_notes:
        duration = beat_duration * beats
        melody_audio.append(generator.generate_tone(
            generator.pt.frequency(note), duration, 0.4))
    
    for note, beats in harmony_notes:
        duration = beat_duration * beats
        harmony_audio.append(generator.generate_tone(
            generator.pt.frequency(note), duration, 0.3))
    
    section3 = np.concatenate(melody_audio) + np.concatenate(harmony_audio)
    audio_sections.append(section3)
    
    # Section 4: Transition Pythagorean → ET
    print("  Section 4: Pythagorean → ET transition")
    melody_audio = []
    harmony_audio = []
    
    for note, beats in melody_notes:
        duration = beat_duration * beats
        melody_audio.append(generator.generate_morphing_tone(
            note, duration, 1.0, 0.0, 0.4))
    
    for note, beats in harmony_notes:
        duration = beat_duration * beats
        harmony_audio.append(generator.generate_morphing_tone(
            note, duration, 1.0, 0.0, 0.3))
    
    section4 = np.concatenate(melody_audio) + np.concatenate(harmony_audio)
    audio_sections.append(section4)
    
    # Add silence between sections
    silence = np.zeros(int(generator.sample_rate * 1.0))  # 1 second
    
    # Combine all sections
    full_song = np.concatenate([
        audio_sections[0], silence,
        audio_sections[1], silence,
        audio_sections[2], silence, 
        audio_sections[3]
    ])
    
    # Save the song
    output_file = "tuning_song_demo.wav"
    generator.save_wav(full_song, output_file)
    print(f"Song saved as {output_file}")
    
    return output_file


def analyze_intervals():
    """Analyze the frequency ratios for different intervals in both tuning systems."""
    generator = AudioGenerator()
    
    print("\nInterval Analysis:")
    print("=" * 50)
    
    intervals = [
        ("Perfect Fifth (C-G)", 60, 67),
        ("Major Third (C-E)", 60, 64), 
        ("Perfect Fourth (C-F)", 60, 65),
        ("Octave (C-C)", 60, 72),
        ("Major Sixth (C-A)", 60, 69),
    ]
    
    for name, note1, note2 in intervals:
        et_f1 = generator.et.frequency(note1)
        et_f2 = generator.et.frequency(note2)
        pt_f1 = generator.pt.frequency(note1)
        pt_f2 = generator.pt.frequency(note2)
        
        et_ratio = et_f2 / et_f1
        pt_ratio = pt_f2 / pt_f1
        
        print(f"\n{name}:")
        print(f"  ET ratio: {et_ratio:.6f}")
        print(f"  PT ratio: {pt_ratio:.6f}")
        print(f"  Difference: {abs(et_ratio - pt_ratio):.6f}")
        
        # Show just intonation reference where applicable
        just_ratios = {
            "Perfect Fifth (C-G)": 3/2,
            "Major Third (C-E)": 5/4,
            "Perfect Fourth (C-F)": 4/3, 
            "Octave (C-C)": 2/1,
            "Major Sixth (C-A)": 5/3,
        }
        
        if name in just_ratios:
            just_ratio = just_ratios[name]
            print(f"  Just intonation: {just_ratio:.6f}")
            print(f"  ET vs Just: {abs(et_ratio - just_ratio):.6f}")
            print(f"  PT vs Just: {abs(pt_ratio - just_ratio):.6f}")


def make():
    """Main entry point for the song creation."""
    # Create the tuning demonstration song
    output_file = create_tuning_song()
    
    # Analyze the intervals 
    analyze_intervals()
    
    print(f"\nTuning transition demo complete!")
    print(f"Generated audio file: {output_file}")
    print("\nThe song demonstrates:")
    print("1. Pure Equal Temperament harmonies")
    print("2. Smooth transition ET → Pythagorean") 
    print("3. Pure Pythagorean harmonies (more consonant fifths)")
    print("4. Smooth transition Pythagorean → ET")
    
    return output_file


if __name__ == "__main__":
    make()