#!/usr/bin/env bash
# usage .start.sh filename 

SCRIPTNAME=$0
FILENAME=${1%.*}
# FILEEXT=${1%.}

# Umwandeln
flex $FILENAME.l

# kompilieren
gcc lex.yy.c -lfl -o $FILENAME

# Ausführen
./$FILENAME


