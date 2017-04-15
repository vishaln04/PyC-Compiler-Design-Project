%{
#include "y.tab.h"
%}
%%
[\t\n] 
"if" {return IF;}
"for" {return FOR;}
"end" {return END;}
"else" {return ELSE;}
"int" {return INT;}
"char" {return CHAR;}
[a-zA-Z]+ {return VARNAME;}
[0-9]+ {return DIGIT;}

"+" | "-" {return OP1;}
"/" | "*" | "%" {return OP2;}
"<" | ">" | ">=" | "<=" | "!=" | "==" {return OP3;}
"^" {return OP4;}
  return yytext[0];

%%
