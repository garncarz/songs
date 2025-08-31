from midi_lib import *


def main_melody():
    """Main melody using tubular bells with octatonic scale"""
    bells.sequence([
        # Opening phrase - introducing the octatonic sound
        (0, 1.5), (1, 0.5), (3, 1), (4, 1),
        (6, 2), (7, 1), 'r',
        
        # Characteristic octatonic leap patterns
        (0, 0.5), (2, 0.5), (4, 1), (6, 0.5), (7, 0.5), (5, 1),
        (3, 1), (1, 1), (0, 2),
        
        # Upper register exploration with bells resonance
        (7, 0.5), (8, 0.5), (9, 1), (10, 0.5), (11, 0.5),
        (9, 1), (7, 1), (5, 1), (4, 1),
        
        # Closing with diminishing rhythm (like bells fading)
        (6, 1), (4, 0.75), (2, 0.5), (0, 0.25),
        (3, 0.5), (1, 1), (0, 4),
    ])


def harmony_bells():
    """Supporting harmony using glockenspiel"""
    glockenspiel.sequence([
        # Opening harmonies - delayed entrance for clarity
        'r', 'r', 'r', 'r',
        
        # Harmonic support emphasizing octatonic intervals
        ([0, 3], 2), ([1, 4], 2), ([2, 5], 2), ([3, 6], 2),
        
        # Chordal accompaniment using characteristic octatonic chords
        ([0, 1, 3], 1.5), ([2, 4, 6], 0.5), ([1, 3, 7], 1), ([4, 6, 0], 1),
        ([5, 7, 2], 1), ([6, 0, 4], 1), ([7, 1, 5], 1), ([0, 2, 6], 1),
        
        # Shimmering arpeggiated patterns (bells specialty)
        {'tones': [0, 3, 6, 1], 'beats': 2, 'arpeggio': True},
        {'tones': [2, 5, 0, 4], 'beats': 2, 'arpeggio': True},
        {'tones': [7, 3, 6, 2], 'beats': 2, 'arpeggio': True},
        {'tones': [1, 4, 7, 0], 'beats': 2, 'arpeggio': True},
        
        # Final sustaining chord
        ([0, 3, 6], 4),
    ])


def bass_line():
    """Deep bass line emphasizing octatonic structure"""
    bass.sequence([
        # Root movement through the octatonic scale
        (0, 2), (4, 2), (7, 2), (3, 2),
        (6, 2), (2, 2), (5, 2), (1, 2),
        
        # More rhythmic bass line
        (0, 1), (0, 0.5), (4, 0.5), (4, 1), (7, 1),
        (3, 1), (6, 0.5), (6, 0.5), (2, 1), (5, 1), (1, 1),
        
        # Walking bass through the scale
        (0, 0.5), (1, 0.5), (2, 0.5), (3, 0.5), (4, 0.5), (5, 0.5), (6, 0.5), (7, 0.5),
        (0, 2), (4, 2), (0, 4),
    ])


def celesta_counterpoint():
    """Delicate counterpoint melody using celesta"""
    celesta.sequence([
        # Interweaving melody 
        'r', (5, 0.5), (6, 0.5), (7, 1), (4, 0.5), (5, 0.5),
        (3, 1), (6, 0.5), (4, 0.5), (2, 1), (5, 1),
        
        # Echo of main melody in different octave
        (7, 0.5), (0, 0.5), (3, 1), (6, 0.5), (1, 0.5), (4, 1),
        (7, 1.5), (5, 0.5), (2, 2),
        
        # Staccato rhythmic pattern
        {'tones': [1], 'beats': 0.25, 'staccato': True},
        {'tones': [4], 'beats': 0.25, 'staccato': True}, 
        {'tones': [7], 'beats': 0.25, 'staccato': True},
        {'tones': [2], 'beats': 0.25, 'staccato': True},
        {'tones': [5], 'beats': 0.25, 'staccato': True},
        {'tones': [0], 'beats': 0.25, 'staccato': True},
        {'tones': [3], 'beats': 0.25, 'staccato': True},
        {'tones': [6], 'beats': 0.25, 'staccato': True},
        
        (0, 4),  # Final long note
    ])


def make():
    global song, bells, glockenspiel, bass, celesta
    
    song = Song()
    song.scale = c_octatonic_hw  # Using Half-Whole octatonic scale
    song.time_signature = 4, 4
    song.bpm = 120
    song.default_beats = 1
    
    # Main melody - Tubular Bells
    bells = song.new_track()
    bells.instrument = instruments['tubular bells']
    bells.octave_shift = 0
    
    # Harmony - Glockenspiel 
    glockenspiel = song.new_track()
    glockenspiel.instrument = instruments['glockenspiel']
    glockenspiel.octave_shift = 1
    
    # Bass - Cello for warmth
    bass = song.new_track()
    bass.instrument = instruments['cello']
    bass.octave_shift = -2
    
    # Counterpoint - Celesta for sparkle
    celesta = song.new_track()
    celesta.instrument = instruments['celesta']
    celesta.octave_shift = 1
    
    # Compose the sections
    main_melody()
    harmony_bells()
    bass_line()
    celesta_counterpoint()