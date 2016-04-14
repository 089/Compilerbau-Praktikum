%{
#include <stdio.h>
%}

%token KREIS        1
%token SEMIKOLON    2
%token LINIE        3

%%
program: header klecks trailer;

klecks: klecks klecks;

header:  { printf("%%!PS-Adobe\n"); };
trailer:  { printf("showpage\nquit"); } ;
klecks: KREIS SEMIKOLON { printf("newpath 50 50 50 0 360 arc fill\n"); }; 
klecks: LINIE SEMIKOLON { printf("newpath 30 30 moveto 350 350 lineto stroke\n"); }; 

%% 

int yyerror( char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 0;
}


int main(void) {

    yyparse();

return 0;    
}
