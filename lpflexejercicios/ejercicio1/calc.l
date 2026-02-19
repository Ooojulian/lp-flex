%{
#include "calc.tab.h"
#include <stdlib.h>
%}

%%

"//".*\n      return EOL;

[0-9]+        {
                yylval = atoi(yytext);
                return NUMBER;
              }

"+"           return ADD;
"-"           return SUB;
"*"           return MUL;
"/"           return DIV;

"\n"          return EOL;

[ \t]         ;

.             ;

%%

int yywrap(void)
{
    return 1;
}
