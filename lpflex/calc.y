%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%

input:
      | input line
      ;

line:
      '\n'
    | exp '\n' { printf("Resultado: %d\n", $1); }
    ;

exp:
      NUMBER
    | exp '+' exp { $$ = $1 + $3; }
    | exp '-' exp { $$ = $1 - $3; }
    | exp '*' exp { $$ = $1 * $3; }
    | exp '/' exp { $$ = $1 / $3; }
    ;

%%

int main(void)
{
    printf("Calculadora:\n");
    yyparse();
    return 0;
}

int yyerror(const char *s)
{
    printf("Error: %s\n", s);
    return 0;
}
