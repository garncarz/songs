#!/usr/bin/env bash

cd out

# wget https://upload.wikimedia.org/wikipedia/commons/5/5b/Woodpecker.ogg \
#      -O woodpecker.ogg

ln -s 07-дятел.flac 07-dyatel.flac

sox -v 0.3 ../woodpecker.ogg -c 2 -p pad 129.22077 | \
    sox - -m 07-dyatel.flac 07-dyatel-final.flac
