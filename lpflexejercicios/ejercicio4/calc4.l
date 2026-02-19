/* calc4.l */
%{
#include "calc4.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+  { yylval = atoi(yytext); return NUMBER; }
"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
\n      { return EOL; }
[ \t]   { }
.       { printf("Caracter desconocido: %s\n", yytext); }

%%
