#!/usr/bin/env bash

while true
do

    # nur bei Änderungen ausführen:
    inotifywait -q -e modify ./;

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
   
    flex klx.l

    bison klx.y

    gcc lex.yy.c klx.tab.c -lfl -o klx

    ./klx < test.klx > test.ps
    
    echo
    echo "**********************************************"
    cat test.ps
    echo    
    echo "**********************************************"
    echo

    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    
done
