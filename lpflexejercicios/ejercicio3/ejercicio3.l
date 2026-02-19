%{
#include "ejercicio3.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+      {
                yylval = atoi(yytext);
                return NUMBER;
            }

"+"     return ADD;
"-"     return SUB;
"*"     return MUL;
"/"     return DIV;
"&"     return AND;
"|"     return OR;

\n      return EOL;

[ \t]   ;

.       ;

%%
