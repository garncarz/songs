#!/usr/bin/env python3

import sys
import os
sys.path.append('src.py')
import importlib.util

def test_pop_g_dur_dynamics():
    """Test that Pop G-dur has correct dynamics: soft initially, normal from beat 32."""
    spec = importlib.util.spec_from_file_location('pop_g_dur', 'src.py/03-pop_g-dur.py')
    pop_g_dur = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(pop_g_dur)
    
    pop_g_dur.make()
    piano = pop_g_dur.piano
    
    # Track velocities by beat
    beat_count = 0
    initial_velocity = None
    beat32_velocity = None
    velocities_found = set()
    
    for msg in piano:
        if hasattr(msg, 'time'):
            beat_count += msg.time / 480  # ticks per beat
            if msg.type == 'note_on':
                velocities_found.add(msg.velocity)
                
                # Check initial velocity (first few beats)
                if initial_velocity is None and beat_count < 5:
                    initial_velocity = msg.velocity
                    
                # Check velocity at beat 32
                if beat32_velocity is None and beat_count >= 32:
                    beat32_velocity = msg.velocity
                    
                if beat_count > 35:  # Don't need to check the whole piece
                    break
    
    print(f"Initial velocity: {initial_velocity}")
    print(f"Beat 32 velocity: {beat32_velocity}")
    print(f"All velocities used: {sorted(velocities_found)}")
    
    # Assertions
    assert initial_velocity == 65, f"Expected initial velocity 65 (piano), got {initial_velocity}"
    assert beat32_velocity == 100, f"Expected beat 32 velocity 100 (forte), got {beat32_velocity}"
    assert 65 in velocities_found, "Expected soft velocity 65 to be used"
    assert 100 in velocities_found, "Expected normal velocity 100 to be used"
    
    print("✓ Pop G-dur dynamics test passed!")

def test_other_songs_unchanged():
    """Test that other songs still use default velocity 100."""
    test_files = ['01-prochazka_c-dur.py', '02-zpev_h-moll.py', '04-prokrastinacni_orgie.py']
    
    for filename in test_files:
        if not os.path.exists(f'src.py/{filename}'):
            continue
            
        print(f"Testing {filename}...")
        spec = importlib.util.spec_from_file_location('song', f'src.py/{filename}')
        song_module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(song_module)
        
        song_module.make()
        
        # Check all tracks for unexpected velocity changes
        velocities_found = set()
        
        # Handle different song structures
        if hasattr(song_module, 'songs'):  # Multiple songs
            for song_name, song in song_module.songs.items():
                for track in song.tracks:
                    for msg in track:
                        if hasattr(msg, 'velocity') and msg.type == 'note_on':
                            velocities_found.add(msg.velocity)
        elif hasattr(song_module, 'song'):  # Single song
            for track in song_module.song.tracks:
                for msg in track:
                    if hasattr(msg, 'velocity') and msg.type == 'note_on':
                        velocities_found.add(msg.velocity)
        
        # Should only use default velocity 100
        assert velocities_found == {100}, f"{filename} uses unexpected velocities: {velocities_found}"
        print(f"✓ {filename} correctly uses only velocity 100")

if __name__ == '__main__':
    test_pop_g_dur_dynamics()
    test_other_songs_unchanged()
    print("\nAll dynamics tests passed! ✓")