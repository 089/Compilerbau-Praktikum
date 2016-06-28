#!/usr/bin/env bash
# 
# - zeigt klecks (1. Parameter ohne .klx) mit evince an.
# - gibt ps-code des klecks aus

clear

echo $1 ...

if [ -e $1.klx ]
then
    # .klx to .ps
    ./klx < $1.klx > $1.ps

    # PS anzeigen
    evince $1.ps &
        
    # ps Datei ausgeben
    cat $1.ps 
    
    echo 
fi


