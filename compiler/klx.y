%{
#include <stdio.h>
%}

%token KREIS        1
%token SEMIKOLON    2
%token LINIE        3
%token EKO          4
%token EKS          5
%token AT           6
%token NUMBER       7

%%
program: header stmtlist trailer;

stmtlist: ;
stmtlist: stmtlist stmt;
stmt: options klecks;

options: ;
options: EKO optionlist EKS;

optionlist: option; 
option: NUMBER AT NUMBER;

header: { printf("%%!PS-Adobe\n"); };

klecks:   KREIS SEMIKOLON { printf("newpath 50 50 50 0 360 arc fill\n"); }; 
        | LINIE SEMIKOLON { printf("newpath 30 30 moveto 350 350 lineto stroke\n"); }; 
        | klecks klecks;

trailer:  { printf("\nshowpage\nquit"); } ;

%% 

int yyerror(char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 0;
}


int main(void) {

    yyparse();

return 0;    
}
