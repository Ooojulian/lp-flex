%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER ADD SUB MUL DIV ABS EOL

%%

calclist:
      | calclist exp EOL { 
            printf("Decimal: %d\n", $2);
            printf("Hex: 0x%X\n\n", $2);
        }
      ;

exp:
      factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor:
      term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    ;

term:
      NUMBER
    | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
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
