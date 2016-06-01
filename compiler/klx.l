%{
#include "symtab.h"
#include "klx.tab.h"
%}

%option yylineno

%%
Deklariere                                  return DEKLARIERE;   // Deklariert eine Variable

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
Gelb                                        return GELB;
Orange                                      return ORANGE;
Lila                                        return LILA;
Pink                                        return PINK;
Schwarz                                     return SCHWARZ;
Braun                                       return BRAUN;
Grau                                        return GRAU;

Wenn                                        return WENN;        // Kontrollstrukturen
Dann                                        return DANN;
Kleiner                                     return KLEINER; 

;                                           return SEMIKOLON;   // Gruppierungszeichen
\[                                          return EKO;
\]                                          return EKS;
@                                           return TRENNZEICHEN;
,                                           return TRENNZEICHEN;
\(                                          return RKO;
\)                                          return RKS;


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
0|[1-9][0-9]*\.[0-9]+ yylval.d=atof(yytext);return FLOAT;


\n                                          ;                  // Zeilenumbruch ignorieren[
[[:space:]]                                 ;                  // Leerzeichen ignorieren
#.*                                         ;                   // HEX FARBE[a-fA-F0-9]{6}                             return HEXFARBE;
\/\/.*                                      ;                  // Kommentare
.                                           fprintf(stderr, "WARNING: '(%d) %s' ignored\n", yylineno, yytext);


%%
