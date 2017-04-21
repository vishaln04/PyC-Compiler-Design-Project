alpha [a-zA-Z]
digit [0-9]

%%

[ \t]		;
[ \n]   	{ yylineno = yylineno + 1;};
main 		return MAIN;
void 		return VOID;
function        return FUNCTION;
include 	return INCLUDE;
return 		return RETURN;
stdio.h 	return HEADERFILE;
int		return INT;
char 		return CHAR;
for 		return FOR;
while		return WHILE;
if		return IF;
end 		return END;
else		return ELSE;
printf  	return PRINTF;
{digit}+        {yylval = atoi(yytext); return DIGIT;};

{alpha}({alpha}|{digit})* {yylval = *yytext; return VARNAME;};

"+" 		return P11;
"-"  		return P12;
"/" 		return P21;
"*" 		return P22;
"%"  		return P23;
"<" 		return P1;
">" 		return P2;
">=" 		return P3;
"<=" 		return P4;
"!=" 		return P5;
"=="  		return P6;
"^"  		return P7;
\/\/.* ;
\/\*(.*\n)*.*\*\/ ;
. 	        return yytext[0];
%%
