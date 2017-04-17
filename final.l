alpha [a-zA-Z]
digit [0-9]

%%
[ \t]		;
[ \n]   { yylineno = yylineno + 1;}
int	return INT;
char return CHAR;
for 	return FOR;
while	return WHILE;
if	return IF;
include	return INCLUDE;
return	return RETURN;
function	return FUNCTION;
void  return VOID;
main	return MAIN;
end return END;
stdio.h	return HEADERFILE;
case return CASE;
break return BREAK;
switch return SWITCH;
else	return ELSE;
printf  return PRINTF;
{digit}+       return DIGIT;
{alpha}({alpha}|{digit})* return VARNAME;
"+" return P11;
"-"  return P12;
"/" return P21;
"*" return P22;
"%"  return P23;
"<" return P1;
">" return P2;
">=" return P3;
"<=" return P4;
"!=" return P5;
"=="  return P6;
"^"  return P7;
\/\/.* ;
\/\*(.*\n)*.*\*\/ ;
.       return yytext[0];
%%
