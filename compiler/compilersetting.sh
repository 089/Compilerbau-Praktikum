#!/usr/bin/env bash 
# Setting für das Arbeiten am Compiler herstellen

DIR=/home/martin/ss16/co/p/compiler/

cd $DIR

geany --new-instance test.klx klx.l aufgaben.md &

geany --new-instance klx.y &

chromium-browser http://w3-o.cs.hm.edu/~ruckert/compiler/index.html & 

thunar $DIR & 

evince test.ps &

clear 

echo "Hier wird nun nach jedem Speichern der Sourcecode der .ps-Datei angezeigt..."

bash showPsSource.sh &
