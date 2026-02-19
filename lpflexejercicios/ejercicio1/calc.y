%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER
%token ADD SUB MUL DIV
%token EOL

%%

calclist:
      /* vacío */
    | calclist exp EOL { printf("= %d\n", $2); }
    ;

exp:
      NUMBER
    | exp ADD exp { $$ = $1 + $3; }
    | exp SUB exp { $$ = $1 - $3; }
    | exp MUL exp { $$ = $1 * $3; }
    | exp DIV exp { $$ = $1 / $3; }
    ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main(void)
{
    return yyparse();
}
