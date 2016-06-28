%{
#include <stdio.h>
#include "symtab.h"
extern int yylineno;

int object_fill; // entscheidet, ob ein Objekt gefüllt ist oder nicht
%}

%define parse.error verbose

%union { int i; node *n; double d; }

%token KREIS LINIE DREIECK QUADRAT LINIENDICKE GEFUELLT NICHTGEFUELLT
%token KOORD SKALIEREN DREHEN
%token SEMIKOLON EKO EKS DEKO DEKS TRENNZEICHEN RKO RKS ASSIGN
%token DEKLARIERE
%token FARBE ROT BLAU GELB MINION GRUEN ORANGE LILA PINK SCHWARZ BRAUN GRAU WEISS
%token ADD SUB MUL DIV EXP MOD
%token WENN DANN DANNDANN GKO GKS FRAGEZEICHEN DOPPELPUNKT PROZEDUR
%token WIEDERHOLEN
%token KLEINER KLEINERGLEICH GROESSER GROESSERGLEICH ISTGLEICH UNGLEICH UND ODER NICHT WAHR FALSCH
%token <i> NUMBER
%token <n> ID
%token <d> FLOAT


%%
program: header stmtlist trailer;

header: { printf("%%!PS-Adobe\n"); };
trailer: { printf("\nshowpage\nquit"); };

stmtlist: ;
stmtlist: stmtlist stmt;

stmt:   PROZEDUR ID 
            { scope_open(); printf("/klxproz_%s { 4 dict begin\n", $2->symbol); }
        RKO paramlist RKS 
        DANN 
        GKO stmtlist GKS { scope_close(); printf("end } def\n"); };
    
stmt:   ID RKO arglist RKS SEMIKOLON { printf("klxproz_%s\n", $1->symbol); };

arglist: ;
arglist: args;
args: expr;
args: args TRENNZEICHEN expr;

paramlist: ;
paramlist: params;
params: ID { $1->defined=1; printf("/klxvar_%s exch def\n", $1->symbol); };
params: ID TRENNZEICHEN params {$1->defined=1; printf("/klxvar_%s exch def\n", $1->symbol); };

stmt: GKO { scope_open(); printf("4 dict begin\n");} stmtlist GKS { scope_close(); printf("end\n"); }; 

stmt: WENN boolatomicclamp DANN { printf("{"); } stmt { printf("}"); } { printf("if\n "); };
stmt: WENN boolatomicclamp DANNDANN { printf("{"); } stmt { printf("}"); } DOPPELPUNKT { printf("{"); } stmt { printf("}"); } { printf("ifelse\n "); };

stmt: DANN { printf("{"); } stmt DEKO boolor DEKS { printf("{} { exit } ifelse\n } loop\n"); }; // While-Schleife

stmt: WIEDERHOLEN expr DANN { printf("{"); } stmt { printf("}"); } { printf("repeat\n "); }; // Repeat

stmt: DEKO { printf("{"); } boolor { printf("{}{exit} ifelse\n"); } DEKS DANN stmt { printf("} loop\n");}; // While-Schleife

stmt: DEKLARIERE ID SEMIKOLON {
        // Deklaration von Variablen
        if($2->defined == 0 || $2->level < level) {
            if($2->defined == 1) 
                $2 = insert($2->symbol);
                
            $2->defined = 1;
            printf("0 /klxvar_%s exch def\n", $2->symbol);        
        } else {
            char meldung[500];
            snprintf(meldung, 500, "Variable '%s' ist bereits deklariert.", $2->symbol);
            yyerror(meldung);
        }
    }; 
    
stmt: ID ASSIGN error SEMIKOLON { yyerror("Error in assignment"); };

stmt: ID ASSIGN expr SEMIKOLON { 
        if($1->defined == 1) {
            printf("/klxvar_%s exch store\n", $1->symbol); 
        } else {
            char meldung[500];
            snprintf(meldung, 500, "Variable '%s' muss deklariert werden, bevor sie verwendet werden kann.", $1->symbol);
            yyerror(meldung);
        }
    }; 

stmt: { printf("gsave\n"); } options klecks { printf("grestore\n"); };

options: ;
options: EKO optionlist EKS;

optionlist: option; 
optionlist: optionlist option;

option: KOORD expr TRENNZEICHEN expr             { printf("translate\n"); };

option: SKALIEREN expr TRENNZEICHEN expr         { printf("scale\n"); };
option: SKALIEREN expr                           { printf("dup scale\n"); };

option: DREHEN expr                              { printf("rotate\n"); };

option: LINIENDICKE expr                         { printf("setlinewidth\n"); };

option: GEFUELLT                                 { object_fill = 1; };
option: NICHTGEFUELLT                            { object_fill = 0; };

option: FARBE expr TRENNZEICHEN expr TRENNZEICHEN expr { printf("setrgbcolor\n"); };

option: FARBE ROT                   { printf("%f %f %f setrgbcolor\n", 255/255.0, 0/255.0, 0/255.0); };
option: FARBE BLAU                  { printf("%f %f %f setrgbcolor\n", 0/255.0, 0/255.0, 255/255.0); };
option: FARBE GRUEN                 { printf("%f %f %f setrgbcolor\n", 0/255.0, 127/255.0, 50/255.0); };
option: FARBE GELB                  { printf("%f %f %f setrgbcolor\n", 255/255.0, 255/255.0, 0/255.0); };
option: FARBE MINION                { printf("%f %f %f setrgbcolor\n", 252/255.0, 224/255.0, 40/255.0); };
option: FARBE ORANGE                { printf("%f %f %f setrgbcolor\n", 255/255.0, 127/255.0, 0/255.0); };
option: FARBE LILA                  { printf("%f %f %f setrgbcolor\n", 85/255.0, 26/255.0, 139/255.0); };
option: FARBE PINK                  { printf("%f %f %f setrgbcolor\n", 255/255.0, 0/255.0, 180/255.0); };
option: FARBE SCHWARZ               { printf("%f %f %f setrgbcolor\n", 0/255.0, 0/255.0, 0/255.0); };
option: FARBE BRAUN                 { printf("%f %f %f setrgbcolor\n", 139/255.0, 69/255.0, 19/255.0); };
option: FARBE GRAU                  { printf("%f %f %f setrgbcolor\n", 128/255.0, 128/255.0, 128/255.0); };
option: FARBE WEISS                 { printf("%f %f %f setrgbcolor\n", 1.0, 1.0, 1.0); };

klecks:   KREIS SEMIKOLON           { if(object_fill == 1) { printf("newpath 0 0 50 0 360 arc fill\n"); object_fill = 0; }else printf("newpath 0 0 50 0 360 arc stroke\n"); }; 
        | LINIE SEMIKOLON           { if(object_fill == 1) { printf("newpath -50 0 moveto 100 0 rlineto fill\n"); object_fill = 0; } else printf("newpath -50 0 moveto 100 0 rlineto stroke\n"); }; 
        | DREIECK SEMIKOLON         { if(object_fill == 1) { printf("newpath -25 -21.65 moveto 25 43.30 rlineto 25 -43.30 rlineto -50 0 rlineto fill\n"); object_fill = 0; } else printf("newpath -25 -21.65 moveto 25 43.30 rlineto 25 -43.30 rlineto -50 0 rlineto stroke\n"); }; 
        | QUADRAT SEMIKOLON         { if(object_fill == 1) { printf("newpath -50 -50 moveto 0 100 rlineto 100 0 rlineto 0 -100 rlineto -100 0 rlineto fill\n"); object_fill = 0; } else printf("newpath -50 -50 moveto 0 100 rlineto 100 0 rlineto 0 -100 rlineto -100 0 rlineto stroke\n"); }; 

expr: product;
expr: expr ADD product { printf("add "); };
expr: expr SUB product { printf("sub "); };
expr: expr MOD product { printf("mod "); };

product: exponent;
product: product MUL exponent { printf("mul "); };
product: product DIV exponent { printf("div "); };

exponent: signed EXP signed { printf("exp "); };
exponent: signed;

signed: ADD atomic;
signed: SUB atomic { printf("neg "); };
signed: atomic;

atomic: ID { 
        if($1->defined == 1) {
            printf("klxvar_%s ", $1->symbol); 
        } else {
            char meldung[500];
            snprintf(meldung, 500, "Variable '%s' muss deklariert werden, bevor sie verwendet werden kann.", $1->symbol);
            yyerror(meldung);
        }
    }; 

atomic: NUMBER { printf("%d ", $1); };
atomic: FLOAT { printf("%f ", $1); };
atomic: RKO expr RKS;

boolatomicclamp: RKO boolor RKS; 

boolatomic: expr KLEINER expr { printf("lt "); };
boolatomic: expr KLEINERGLEICH expr { printf("le "); };
boolatomic: expr GROESSER expr { printf("gt "); };
boolatomic: expr GROESSERGLEICH expr { printf("ge "); };
boolatomic: expr ISTGLEICH expr { printf("eq "); };
boolatomic: expr UNGLEICH expr { printf("neq "); };
boolatomic: boolatomicclamp;

boolexpr: NICHT boolexpr { printf("not "); };
boolexpr: boolatomic;

booland: boolexpr;
booland: booland UND boolexpr { printf("and "); };

boolor: booland;
boolor: boolor ODER booland { printf("or "); };



%% 

int yyerror(char *msg) {
    fprintf(stderr, "Error: (%d) %s\n", yylineno, msg);
    return 0;
}

int main(void) {
    yydebug=0;
    yyparse();
    return 0;    
}
