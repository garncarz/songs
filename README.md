# My songs

[![Build Status](https://travis-ci.org/garncarz/songs.svg?branch=master)](https://travis-ci.org/garncarz/songs)


## History

In around 2009, I've bought a great Textbook of Harmony (Czech: Učebnice harmonie) by Jaroslav Kofroň
and started to compose my own songs. You can find their sources here.

My diploma thesis was about [random compositions by a computer](https://garncarz.github.io/musgen-haskell/),
then I went on to try writing [a musical Prolog library](https://garncarz.github.io/muspl/).

As of now, I'd like to rewrite my songs to Python,
which I find as the best and the most playful/effective/easy/fast-to-deliver language,
and then move on to composing more in a framework which will emerge in the meantime.


## This project

Directory | Content
---|---
`src` | Original sources
`src.py` | Pythonized songs
`midi` | Sources rendered into MIDI format


Procession of songs is automated by the script `make.py` which is capable of producing:
- MIDI files
- PDF files with sheet music
- FLAC/OGG files with rendered MIDI files
- PNG previews of PDFs

## Microtonal Audio Generation

This project now includes support for microtonal audio generation with smooth tuning transitions:

- **Equal Temperament**: Standard 12-tone equal temperament tuning
- **Pythagorean Tuning**: Perfect fifth-based tuning with pure 3:2 ratios
- **Smooth Transitions**: Real-time morphing between tuning systems during playback
- **Direct Audio Output**: Generates WAV files without MIDI limitations

Example usage:
```python
from audio_lib import AudioGenerator

generator = AudioGenerator()
# Generate a perfect fifth that morphs from ET to Pythagorean tuning
audio = generator.generate_morphing_tone(67, duration=3.0, start_tuning=0.0, end_tuning=1.0)
generator.save_wav(audio, "morphing_fifth.wav")
```

See `src.py/09-tuning_transitions.py` for a complete musical demonstration.


## Needed

- Python 3 (scripting, song scripting)
- [LilyPond](http://lilypond.org) (`.ly` → `.midi`/`.pdf`)
- [MuseScore](https://musescore.org) (`.mscz`/`.mscx` → `.midi`/`.pdf`; also capable of importing `.midi`)
- [TiMidity++](http://timidity.sourceforge.net) (`.midi` → `.ogg`/`.flac`/direct play)
- some SoundFont for TiMidity++, e.g. [Fluid R3 GM](http://www.musescore.org/download/fluid-soundfont.tar.gz)
- [ImageMagick](https://www.imagemagick.org) (`.pdf` → `.png`)

For microtonal audio generation:
- NumPy (audio array processing)
- SciPy (WAV file output)


## Usage

`pip install -r requirements.txt`

`./make.py`


<!-- ❄️ Hello to the GitHub Archive! ❄️ -->
