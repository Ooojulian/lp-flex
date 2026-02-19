%{
#include "fb1-4.tab.h"
%}

%%

[0-9]+   { yylval = atoi(yytext); return NUMBER; }
\n       { return EOL; }
.        { return yytext[0]; }

%%
