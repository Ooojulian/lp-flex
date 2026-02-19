%{
#include <stdio.h>
%}

%token NUMBER
%token EOL

%%

input:
      | input line
      ;

line:
      EOL
    | exp EOL { printf("Result: %d\n", $1); }
    ;

exp:
      NUMBER
    | exp '+' NUMBER { $$ = $1 + $3; }
    ;

%%

int main()
{
    yyparse();
}

int yyerror(char *s)
{
    printf("Error: %s\n", s);
}
