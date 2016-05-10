%{
#include "klx.tab.h"
extern int yylval;
%}

%option yylineno

%%
Kreis                                       return KREIS;       // Geometrie; Warnung return 0 bei EOF
Linie                                       return LINIE;
Dreieck                                     return DREIECK; 
Quadrat                                     return QUADRAT;

Drehen                                      return DREHEN;      // Transformationen
Skalieren                                   return SKALIEREN;
Koord                                       return KOORD;


Farbe                                       return FARBE;       // Farben
Rot                                         return ROT;
Blau                                        return BLAU;
Gruen                                       return GRUEN;
Orange                                      return ORANGE;
Lila                                        return LILA;
Pink                                        return PINK;
Schwarz                                     return SCHWARZ;
Braun                                       return BRAUN;
Grau                                        return GRAU;


;                                           return SEMIKOLON;   // Gruppierungszeichen
\[                                          return EKO;
\]                                          return EKS;
@                                           return TRENNZEICHEN;
\(                                          return RKO;
\)                                          return RKS;


\+                                          return ADD;        // Mathezeugs
\*                                          return MUL;
\-                                          return SUB;
\/                                          return DIV;
\^                                          return EXP;
\%                                          return MOD;



0|[1-9][0-9]* yylval=atoi(yytext);          return NUMBER;


\n                                          ;                  // Zeilenumbruch ignorieren[
[[:space:]]                                 ;                  // Leerzeichen ignorieren
#.*                                         ;                  // Kommentare
\/\/.*                                      ;                  // Kommentare
.                                           fprintf(stderr, "WARNING: '(%d) %s' ignored\n", yylineno, yytext);


%%
