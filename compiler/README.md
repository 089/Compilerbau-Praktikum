# mKLX - Befehlsübersicht

In mKLX gibt es oft mehrere Wege zum Ziel. So gibt es für mehrere Ausdrücke eine symbolische und eine geschwätzige Variante. Man kann diese auch mischen, was aber zulasten der Übersichtlichkeit geht. Alle **Schlüsselwörter** in mKLX beginnen mit einem Großbuchstaben. 

## KLXe

Bezeichnung | symbolisch | geschwätzig | ggf. Beschreibung
----- | ----- | ----- | ----- 
Kreis | ● oder · | Kreis | 
Dreie | ▲ oder <| | Dreie | Standard-Dreieck, gleichseitig
Linie | ▂ oder _ | Linie | 
Quadrat | ▇ oder # | Quadr | 

### Optionen für KLXe

Für KLXe gibt es verschiedene Optionen, die Transformationen und Farben ermöglichen. 

#### Transformationen

Bezeichnung | Befehl | ggf. Beschreibung
----- | ----- | ----- 
Drehen | `Drehe x` | [0; 360]
Skalieren | `Skali x`, oder `Skali x, y` | [0.0; unendlich], 1 entspricht der "normalen" Größe, also 100%
Koordinaten | `Koord x, y` | x, y beliebig; grundsätzlich abhängig von Seitengröße
Liniendicke | `Ldick x` | x, beliebig
Ausfüllen | `Voll` | Füllt KLXe aus
Nur Rand | `Sanft` | KLX nur mit Rand ohne Füllung

#### Farben
Bezeichnung | Befehl | ggf. Beschreibung
----- | ----- | ----- 
Beliebige Farben | `Farbe x, y, z` oder `Farbe Farbname` | x, y, z aus [0; 255], Farbnamen: `Rot, Blau, Gruen, Gelb, Minion, Orang, Lila, Pink, Schwa, Braun, Grau, Weiß`


## Bedingungen 

Wir unterscheiden zwischen dem `Wenn ... Dann`- und dem `Wenn ... Danndann ... Sonst`-Ausdruck.

### Wenn ... Dann

1. `` 

### Wenn ... Danndann ... Sonst

