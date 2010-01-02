#!/bin/bash

if [[ ! -e out ]]; then
    mkdir out
fi

if [[ ""$1 != "" ]]; then
    nazev=$1
    for file in *$nazev*ly
    do
        cp $file out/
    done
    
    cd out
    lilypond *.ly
    rm -f *.ly
    timidity *.mid* -Ow
fi
