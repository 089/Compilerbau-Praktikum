

%%

Kreis       return 1; // warnung return 0 bei EOF
;           return 2;
Linie       return 3;
\n          ;   // Zeilenumbruch ignorieren
[:space:]   ;   // Leerzeichen ignorieren
#.*         ;   // Kommentare
.*          return 4; // Fehlermeldung
%%
