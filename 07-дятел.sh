#!/usr/bin/env bash

cd out

wget https://upload.wikimedia.org/wikipedia/commons/5/5b/Woodpecker.ogg \
    -O woodpecker.ogg

ln -s 07-дятел.flac 07-dyatel.flac

# FIXME volume & padding
sox -v 0.8 woodpecker.ogg -c 2 -p pad 130 | \
    sox - -m 07-dyatel.flac 07-dyatel-final.flac
