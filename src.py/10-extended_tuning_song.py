#!/usr/bin/env python3
"""
Extended Tuning Transitions Song

A longer musical composition with frequent tuning transitions between Equal Temperament 
and Pythagorean tuning. Features slower BPM and longer chords to make the transitions 
more audible and musical.
"""

import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from audio_lib import AudioGenerator
import numpy as np


def create_extended_tuning_song():
    """Create a longer, more complex song with frequent tuning transitions."""
    generator = AudioGenerator()
    
    # Musical parameters - slower BPM as requested
    bpm = 70  # Slower tempo to hear transitions better
    beat_duration = 60.0 / bpm  # duration of one quarter note in seconds
    
    # Extended chord progression in C major (I-vi-IV-V-I-vi-ii-V-I)
    # Each chord will be held for 4 beats (whole note) for longer listening
    chord_progression = [
        # Chord 1: C major (I) - Pure ET
        ([60, 64, 67, 72], 4, 0.0, 0.0),  # C-E-G-C (ET to ET)
        
        # Chord 2: A minor (vi) - ET to Pythagorean transition
        ([57, 60, 64, 69], 4, 0.0, 1.0),  # A-C-E-A (ET to PT)
        
        # Chord 3: F major (IV) - Pure Pythagorean
        ([53, 57, 60, 65], 4, 1.0, 1.0),  # F-A-C-F (PT to PT)
        
        # Chord 4: G major (V) - Pythagorean to ET transition  
        ([55, 59, 62, 67], 4, 1.0, 0.0),  # G-B-D-G (PT to ET)
        
        # Chord 5: C major (I) - Pure ET
        ([60, 64, 67, 72], 4, 0.0, 0.0),  # C-E-G-C (ET to ET)
        
        # Chord 6: A minor (vi) - ET to Pythagorean (again)
        ([57, 60, 64, 69], 4, 0.0, 1.0),  # A-C-E-A (ET to PT)
        
        # Chord 7: D minor (ii) - Pythagorean with internal transition
        ([58, 62, 65, 70], 4, 1.0, 0.0),  # D-F#-A-D (PT to ET)
        
        # Chord 8: G major (V) - ET to Pythagorean
        ([55, 59, 62, 67], 4, 0.0, 1.0),  # G-B-D-G (ET to PT)
        
        # Chord 9: C major (I) - Final chord, Pythagorean to ET
        ([60, 64, 67, 72], 6, 1.0, 0.0),  # C-E-G-C (PT to ET) - longer final chord
    ]
    
    print("Creating extended tuning transition song...")
    print(f"Tempo: {bpm} BPM (slower for better transition audibility)")
    print(f"Total chords: {len(chord_progression)}")
    
    all_chord_audio = []
    
    for i, (notes, beats, start_tuning, end_tuning) in enumerate(chord_progression):
        chord_duration = beat_duration * beats
        
        tuning_desc = ""
        if start_tuning == end_tuning == 0.0:
            tuning_desc = "Pure Equal Temperament"
        elif start_tuning == end_tuning == 1.0:
            tuning_desc = "Pure Pythagorean"
        elif start_tuning == 0.0 and end_tuning == 1.0:
            tuning_desc = "ET → Pythagorean transition"
        elif start_tuning == 1.0 and end_tuning == 0.0:
            tuning_desc = "Pythagorean → ET transition"
        else:
            tuning_desc = f"Custom transition ({start_tuning:.1f} → {end_tuning:.1f})"
            
        print(f"  Chord {i+1}: {tuning_desc} ({beats} beats)")
        
        # Generate each note in the chord
        chord_voices = []
        for j, note in enumerate(notes):
            # Vary amplitude by voice for better balance
            amplitude = 0.3 if j < 2 else 0.25  # Lower voices slightly louder
            
            if start_tuning == end_tuning:
                # Static tuning
                if start_tuning == 0.0:
                    freq = generator.et.frequency(note)
                else:
                    freq = generator.pt.frequency(note)
                voice_audio = generator.generate_tone(freq, chord_duration, amplitude)
            else:
                # Morphing tuning
                voice_audio = generator.generate_morphing_tone(
                    note, chord_duration, start_tuning, end_tuning, amplitude
                )
            
            chord_voices.append(voice_audio)
        
        # Combine all voices in the chord
        chord_audio = sum(chord_voices)
        all_chord_audio.append(chord_audio)
    
    # Add subtle silence between chords (not too much to maintain flow)
    short_silence = np.zeros(int(generator.sample_rate * 0.2))  # 200ms
    
    # Combine all chords with short silences
    full_song_parts = []
    for i, chord in enumerate(all_chord_audio):
        full_song_parts.append(chord)
        if i < len(all_chord_audio) - 1:  # Don't add silence after last chord
            full_song_parts.append(short_silence)
    
    full_song = np.concatenate(full_song_parts)
    
    # Save the extended song
    output_file = "extended_tuning_song.wav"
    generator.save_wav(full_song, output_file)
    
    # Calculate total duration
    total_duration = len(full_song) / generator.sample_rate
    
    print(f"\nExtended song saved as {output_file}")
    print(f"Total duration: {total_duration:.1f} seconds ({total_duration/60:.1f} minutes)")
    print(f"Features {len(chord_progression)} chords with frequent tuning transitions")
    
    return output_file


def create_ambient_tuning_piece():
    """Create an even longer, more ambient piece with continuous tuning shifts."""
    generator = AudioGenerator()
    
    # Even slower for ambient/meditative feel
    bpm = 50
    beat_duration = 60.0 / bpm
    
    print("\nCreating ambient tuning meditation piece...")
    
    # Long-held notes that continuously shift between tuning systems
    # Using perfect intervals that show the most difference between systems
    ambient_sequence = [
        # Perfect fifths - most noticeable difference
        ([48, 55], 8, 0.0, 1.0),   # C2-G2, ET to PT
        ([50, 57], 8, 1.0, 0.0),   # D2-A2, PT to ET
        ([52, 59], 8, 0.0, 1.0),   # E2-B2, ET to PT
        ([53, 60], 8, 1.0, 0.0),   # F2-C3, PT to ET
        
        # Add octaves for fuller sound
        ([48, 55, 60, 67], 8, 0.0, 1.0),  # C2-G2-C3-G3
        ([50, 57, 62, 69], 8, 1.0, 0.0),  # D2-A2-D3-A3
        
        # Major thirds - also show tuning differences
        ([48, 52, 60, 64], 8, 0.0, 1.0),  # C2-E2-C3-E3
        ([53, 57, 65, 69], 8, 1.0, 0.0),  # F2-A2-F3-A3
        
        # Final long chord that continuously cycles through tuning
        ([48, 52, 55, 60, 64, 67], 12, 0.0, 1.0),  # Full C major chord, very long
    ]
    
    all_parts = []
    
    for i, (notes, beats, start_tuning, end_tuning) in enumerate(ambient_sequence):
        duration = beat_duration * beats
        
        print(f"  Part {i+1}: {len(notes)} notes, {beats} beats, tuning {start_tuning:.1f}→{end_tuning:.1f}")
        
        # Generate voices with very soft attack/decay for ambient feel
        voices = []
        for j, note in enumerate(notes):
            # Amplitude varies by voice register
            amplitude = 0.15 if note < 60 else 0.12  # Softer overall for ambient feel
            
            voice_audio = generator.generate_morphing_tone(
                note, duration, start_tuning, end_tuning, amplitude
            )
            voices.append(voice_audio)
        
        part_audio = sum(voices)
        all_parts.append(part_audio)
    
    # Add longer silences between parts for meditative effect
    med_silence = np.zeros(int(generator.sample_rate * 1.0))  # 1 second
    
    # Combine with silences
    full_ambient = []
    for i, part in enumerate(all_parts):
        full_ambient.append(part)
        if i < len(all_parts) - 1:
            full_ambient.append(med_silence)
    
    ambient_song = np.concatenate(full_ambient)
    
    # Save the ambient piece
    output_file = "ambient_tuning_meditation.wav"
    generator.save_wav(ambient_song, output_file)
    
    total_duration = len(ambient_song) / generator.sample_rate
    print(f"Ambient piece saved as {output_file}")
    print(f"Duration: {total_duration:.1f} seconds ({total_duration/60:.1f} minutes)")
    
    return output_file


def make():
    """Main entry point for extended song creation."""
    print("=" * 60)
    print("EXTENDED TUNING TRANSITION SONGS")
    print("=" * 60)
    
    # Create the extended chord progression song
    extended_file = create_extended_tuning_song()
    
    # Create the ambient meditation piece
    ambient_file = create_ambient_tuning_piece()
    
    print("\n" + "=" * 60)
    print("GENERATION COMPLETE")
    print("=" * 60)
    print(f"Extended song: {extended_file}")
    print(f"Ambient piece: {ambient_file}")
    print("\nBoth pieces demonstrate continuous tuning transitions")
    print("between Equal Temperament and Pythagorean tuning systems.")
    print("The slower tempo and longer chords make the tuning")
    print("differences much more audible and musically expressive.")
    
    return extended_file, ambient_file


if __name__ == "__main__":
    make()