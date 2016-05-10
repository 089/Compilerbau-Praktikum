%{
#include <stdio.h>
extern int yylineno;
%}

%define parse.error verbose

%token KREIS LINIE DREIECK QUADRAT
%token KOORD SKALIEREN DREHEN
%token SEMIKOLON EKO EKS TRENNZEICHEN RKO RKS
%token FARBE ROT BLAU GRUEN ORANGE LILA PINK SCHWARZ BRAUN GRAU
%token ADD SUB MUL DIV EXP MOD
%token NUMBER

%%
program: header stmtlist trailer;

header: { printf("%%!PS-Adobe\n"); };
trailer: { printf("\nshowpage\nquit"); };

stmtlist: ;
stmtlist: stmtlist stmt;

stmt: {printf("gsave\n");} options klecks {printf("grestore\n");};

options: ;
options: EKO optionlist EKS;

optionlist: option; 
optionlist: optionlist option;
option: KOORD NUMBER NUMBER {printf("%d %d translate\n", $2, $3);};
option: FARBE NUMBER NUMBER NUMBER  {printf("%f %f %f setrgbcolor\n", $2/255.0, $3/255.0, $4/255.0);};
option: FARBE ROT                   {printf("%f %f %f setrgbcolor\n", 255/255.0, 0/255.0, 0/255.0);};
option: FARBE BLAU                  {printf("%f %f %f setrgbcolor\n", 0/255.0, 0/255.0, 255/255.0);};
option: FARBE GRUEN                 {printf("%f %f %f setrgbcolor\n", 0/255.0, 255/255.0, 255/255.0);};
option: FARBE ORANGE                {printf("%f %f %f setrgbcolor\n", 255/255.0, 255/255.0, 0/255.0);};
option: FARBE LILA                  {printf("%f %f %f setrgbcolor\n", 255/255.0, 0/255.0, 255/255.0);};
option: FARBE PINK                  {printf("%f %f %f setrgbcolor\n", 255/255.0, 0/255.0, 180/255.0);};
option: FARBE SCHWARZ               {printf("%f %f %f setrgbcolor\n", 0/255.0, 0/255.0, 0/255.0);};
option: FARBE BRAUN                 {printf("%f %f %f setrgbcolor\n", 139/255.0, 69/255.0, 19/255.0);};
option: FARBE GRAU                  {printf("%f %f %f setrgbcolor\n", 128/255.0, 128/255.0, 128/255.0);};
option: SKALIEREN NUMBER {printf("%f %f scale\n", $2/100.0, $2/100.0);};
option: SKALIEREN NUMBER NUMBER {printf("%f %f scale\n", $2/100.0, $3/100.0);};
option: DREHEN NUMBER {printf("%d rotate\n", ($2 % 360));};

klecks:   KREIS SEMIKOLON { printf("newpath 0 0 50 0 360 arc fill\n"); }; 
        | LINIE SEMIKOLON { printf("newpath -50 -50 moveto 50 50 rlineto stroke\n"); }; 
        | DREIECK SEMIKOLON { printf("newpath -25 -21.65 moveto 25 43.30 rlineto 25 -43.30 rlineto -50 0 rlineto stroke\n"); }; 
        | QUADRAT SEMIKOLON { printf("newpath -50 -50 moveto 0 100 rlineto 100 0 rlineto 0 -100 rlineto -100 0 rlineto stroke\n"); }; 


expr: product;
expr: expr ADD product {printf("add ");};
expr: expr SUB product {printf("sub ");};
expr: expr MOD product {printf("mod ");};

product: exponent;
product: product MUL exponent {printf("mul ");};
product: product DIV exponent {printf("div ");};

exponent: signed EXP signed {printf("exp ");};
exponent: signed;

signed: ADD atomic;
signed: SUB atomic {printf("neg ");};
signed: atomic;

atomic: NUMBER {printf("%d ", $1);};
atomic: RKO expr RKS;

%% 

int yyerror(char *msg) {
    fprintf(stderr, "Error: (%d) %s\n", yylineno, msg);
    return 0;
}


int main(void) {
    yyparse();
    return 0;    
}
