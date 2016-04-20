

%%
Kreis           return 1; // warnung return 0 bei EOF
;               return 2;
Linie           return 3;
\[              return 4;
\]              return 5;
@               return 6;
0|[1-9][0-9]*     return 7;


\n          ;   // Zeilenumbruch ignorieren[
[[:space:]]   ;   // Leerzeichen ignorieren
#.*         ;   // Kommentare
\/\/.*         ;   // Kommentare
.           fprintf(stderr, "WARNING: '%s' ignored\n", yytext);


%%
