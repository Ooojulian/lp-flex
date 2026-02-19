%{
#include <stdio.h>
%}

%%

"colour"  { printf("color"); }
"flavour" { printf("flavor"); }
"centre"  { printf("center"); }
"theatre" { printf("theater"); }

.|\n { printf("%s", yytext); }

%%

int main()
{
    yylex();
    return 0;
}
