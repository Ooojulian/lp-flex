%{
#include "calc.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return '\n'; }
[ \t]   ;
.       { return yytext[0]; }

%%
