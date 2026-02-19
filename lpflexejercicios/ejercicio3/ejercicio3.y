%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER ADD SUB MUL DIV AND OR EOL

%%

calclist:
      | calclist exp EOL { printf("Resultado: %d\n", $2); }
      ;

exp:
      exp ADD term { $$ = $1 + $3; }
    | exp SUB term { $$ = $1 - $3; }
    | exp OR term  { $$ = $1 | $3; }
    | exp AND term { $$ = $1 & $3; }
    | term
    ;

term:
      term MUL factor { $$ = $1 * $3; }
    | term DIV factor { $$ = $1 / $3; }
    | factor
    ;

factor:
      NUMBER
    ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    return yyparse();
}
