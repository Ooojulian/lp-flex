/* just like Unix wc */
%{
#include <stdio.h>
#include <string.h>

int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+  { words++; chars += strlen(yytext); }
\n         { chars++; lines++; }
.          { chars++; }

%%

int main()
{
    yylex();
    printf("Lines: %d Words: %d Chars: %d\n", lines, words, chars);
    return 0;
}
