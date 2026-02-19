%{
#include <stdio.h>
%}

%%

[0-9]+   { printf("NUMBER: %s\n", yytext); }
[a-zA-Z]+ { printf("WORD: %s\n", yytext); }
\n        { }
.         { }

%%

int main()
{
    yylex();
    return 0;
}
