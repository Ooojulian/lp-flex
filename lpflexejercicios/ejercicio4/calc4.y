/* calc4.y */
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%token ADD SUB MUL DIV ABS EOL

%%

calclist:
      /* vacío */
    | calclist exp EOL { printf("= %d\n", $2); }
    ;

exp:
      exp ADD term { $$ = $1 + $3; }
    | exp SUB term { $$ = $1 - $3; }
    | term
    ;

term:
      term MUL factor { $$ = $1 * $3; }
    | term DIV factor { $$ = $1 / $3; }
    | factor
    ;

factor:
      NUMBER
    | ABS factor { $$ = $2 >= 0 ? $2 : -$2; }
    ;

%%

int main() {
    return yyparse();
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
