%{
#include <stdio.h>
extern int yylineno;
%}

%define parse.error verbose

%token KREIS            1
%token SEMIKOLON        2
%token LINIE            3
%token EKO              4
%token EKS              5
%token TRENNZEICHEN     6
%token NUMBER           7
%token FARBE            8
%token SKALIEREN        9
%token KOORD            10

%%
program: header stmtlist trailer;

stmtlist: ;
stmtlist: stmtlist stmt;

stmt: {printf("gsave\n");} options klecks {printf("grestore\n");};

options: ;
options: EKO optionlist EKS;

optionlist: option; 
optionlist: optionlist option;
option: KOORD NUMBER NUMBER {printf("%d %d translate\n", $2, $3);};
option: FARBE NUMBER NUMBER NUMBER {printf("%d %d %d setrgbcolor\n", $2, $3, $4);};
option: SKALIEREN NUMBER {printf("%f %f scale\n", $2/100.0, $2/100.0);};
option: SKALIEREN NUMBER NUMBER {printf("%f %f scale\n", $2/100.0, $3/100.0);};

header: { printf("%%!PS-Adobe\n"); };

klecks:   KREIS SEMIKOLON { printf("newpath 0 0 50 0 360 arc fill\n"); }; 
        | LINIE SEMIKOLON { printf("newpath 0 0 moveto 350 350 lineto stroke\n"); }; 

trailer:  { printf("\nshowpage\nquit"); } ;

%% 

int yyerror(char *msg) {
    fprintf(stderr, "Error: (%d) %s\n", yylineno, msg);
    return 0;
}


int main(void) {

    yyparse();

return 0;    
}
