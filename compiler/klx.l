%{
#include "symtab.h"
#include "klx.tab.h"
%}

%option yylineno

%%
Dekla                                       return DEKLARIERE;   // Deklariert eine Variable

Kreis                                       return KREIS;       // Geometrie; Warnung return 0 bei EOF
●                                           return KREIS;       // Geometrie; Warnung return 0 bei EOF
·                                           return KREIS;       // Geometrie; Warnung return 0 bei EOF

Linie                                       return LINIE;
▂                                           return LINIE;
_                                           return LINIE;

Dreie                                       return DREIECK; 
▲                                           return DREIECK; 
\<\|                                        return DREIECK; 

Quadr                                       return QUADRAT;
▇                                           return QUADRAT;
#                                           return QUADRAT;


Drehe                                       return DREHEN;      // Optionen
Skali                                       return SKALIEREN;
Koord                                       return KOORD;
Ldick                                       return LINIENDICKE;
Voll                                        return GEFUELLT;
Sanft                                       return NICHTGEFUELLT;

Farbe                                       return FARBE;       // Farben
Rot                                         return ROT;
Blau                                        return BLAU;
Gruen                                       return GRUEN;
Gelb                                        return GELB;
Minion                                      return MINION;
Orang                                       return ORANGE;
Lila                                        return LILA;
Pink                                        return PINK;
Schwa                                       return SCHWARZ;
Braun                                       return BRAUN;
Grau                                        return GRAU;
Weiß                                        return WEISS;

Wenn                                        return WENN;        // Kontrollstrukturen
\?\?                                        return WENN;
Dann                                        return DANN;    
\>\>                                        return DANN;
Danndann                                    return DANNDANN;
\>\>\>\>                                    return DANNDANN;
    
Wdh                                         return WIEDERHOLEN;
»                                           return WIEDERHOLEN;

\?                                          return FRAGEZEICHEN;
\<                                          return KLEINER;     // Boolsche Ausdrücke
\<=                                         return KLEINERGLEICH;
\>                                          return GROESSER;
\>=                                         return GROESSERGLEICH;
==                                          return ISTGLEICH;
!=                                          return UNGLEICH;
\<\>                                        return UNGLEICH;
&&                                          return UND;
\|\|                                        return ODER;
!                                           return NICHT;
Wahr                                        return WAHR;
Falsch                                      return FALSCH;

;                                           return SEMIKOLON;   // Gruppierungszeichen
:                                           return DOPPELPUNKT;
,                                           return TRENNZEICHEN;
@                                           return TRENNZEICHEN;
\(                                          return RKO;
\)                                          return RKS;
\[                                          return EKO;
\]                                          return EKS;
\[\[                                        return DEKO;
\]\]                                        return DEKS;
\{                                          return GKO;
\}                                          return GKS;
Proz                                        return PROZEDUR;
::                                          return PROZEDUR;                              


\+                                          return ADD;        // Mathezeugs
\*                                          return MUL;
\-                                          return SUB;
\/                                          return DIV;
\^                                          return EXP;
\%                                          return MOD;

=                                           return ASSIGN;

[a-zA-Z]+ {     yylval.n = lookup(yytext);                       // Variablen
                if(yylval.n == NULL) yylval.n = insert(yytext);
                
                return ID;        
            }


0|[1-9][0-9]* yylval.i=atoi(yytext);        return NUMBER;
(0|[1-9][0-9]*)\.[0-9]+ yylval.d=atof(yytext);return FLOAT;


\n                                          ;                  // Zeilenumbruch ignorieren[
[[:space:]]                                 ;                  // Leerzeichen ignorieren
'.*                                         ;                   //
\/\/.*                                      ;                  // Kommentare
.                                           fprintf(stderr, "WARNING: '(%d) %s' ignored\n", yylineno, yytext);


%%
