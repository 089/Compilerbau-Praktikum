%{
extern int yylval;
%}

%option yylineno

%%
Kreis                                       return 1; // warnung return 0 bei EOF
;                                           return 2;
Linie                                       return 3;
\[                                          return 4;
\]                                          return 5;
@                                           return 6;
0|[1-9][0-9]* yylval=atoi(yytext);          return 7;
Farbe                                       return 8;
Skalieren                                   return 9; 
Koord                                       return 10;

\n          ;           // Zeilenumbruch ignorieren[
[[:space:]] ;         // Leerzeichen ignorieren
#.*         ;           // Kommentare
\/\/.*      ;        // Kommentare
.           fprintf(stderr, "WARNING: '(%d) %s' ignored\n", yylineno, yytext);


%%
