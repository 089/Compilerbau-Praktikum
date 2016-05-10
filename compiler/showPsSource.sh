#!/usr/bin/env bash

while true
do

    # nur bei Änderungen ausführen:
    inotifywait -q -e modify ./;

    # clean screen
    clear
    
    # ps Datei ausgeben
    cat test.ps
done
