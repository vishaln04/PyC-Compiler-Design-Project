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
else	return ELSE;
printf  return PRINTF;
{digit}+       return DIGIT;
{alpha}({alpha}|{digit})* return VARNAME;
"+" | "-"  return OP1;
"/" | "*" | "%"  return OP2;
"<" | ">" | ">=" | "<=" | "!=" | "=="  return OP3;
"^"  return OP4;
\/\/.* ;
\/\*(.*\n)*.*\*\/ ;
.       return yytext[0];
%%
