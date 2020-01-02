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


## Needed

- Python 3 (scripting, song scripting)
- [LilyPond](http://lilypond.org) (`.ly` → `.midi`/`.pdf`)
- [MuseScore](https://musescore.org) (`.mscz`/`.mscx` → `.midi`/`.pdf`; also capable of importing `.midi`)
- [TiMidity++](http://timidity.sourceforge.net) (`.midi` → `.ogg`/`.flac`/direct play)
- some SoundFont for TiMidity++, e.g. [Fluid R3 GM](http://www.musescore.org/download/fluid-soundfont.tar.gz)
- [ImageMagick](https://www.imagemagick.org) (`.pdf` → `.png`)


## Usage

`pip install -r requirements.txt`

`./make.py`


<!-- ❄️ Hello to the GitHub Archive! ❄️ -->
