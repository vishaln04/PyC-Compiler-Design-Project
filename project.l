%{
#include "y.tab.h"
%}
%%
[a-zA-Z]+ {return VARNAME}
[0-9]+ {return DIGIT}

"+" | "-" {return OP1}
"/" | "*" | "%" {return OP2}
"<" | ">" | ">=" | "<=" | "!=" | "==" {return OP3}
"^" {return OP4}

. 	return yytext[0];
\n 	return yytext[0];
%%
