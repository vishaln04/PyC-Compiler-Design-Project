%{
#include <stdio.h>
#include <stdlib.h>
#include<math.h>
extern FILE *fp;
int exitFlag=0;
int value[52];
int declared[52];
int valueSet[52];
int type[52];
int val;
int sym[50];
%}

%token IF FOR WHILE END ELSE VARNAME DIGIT INT CHAR PRINTF MAIN
%token P1 P2 P3 P4 P5 P6 P7 P11 P12 P21 P22 P23
%left '+' '-'
%left '*' '/' '%'
%%

PROGRAM : MAIN'('')'':' STMTS END
		;

STMTS : STMT ';' {;}
	| STMT ';' STMTS  {;} 
	| CONTROL STMTS   {;}
	| PrintFunc       {;}
	|
	;

STMT : VAR            {$$=$1;}
	| EXP 			  {$$=$1;}
	;

CONTROL : IF_STMT 
	| FOR_LOOP 
	| WHILE_LOOP 
	;

DATATYPE : INT 		  {;}
	| CHAR 			  {;}
	;

VAR : DATATYPE VARNAMES				{;}				
	| DATATYPE VARNAME '=' DIGIT 	{;}
	;

VARNAMES : VARNAME ',' VARNAMES 	{;}
	| VARNAME 						{;}
	;

EXP : VARNAME '=' EXPR 				{$$=sym[$1]; sym[$1]=$3; printf("Final Value is : %d\n",$3);}
	| VARNAME '=' id 				{$$=sym[$1]; sym[$1]=$3; printf("Final Value is : %d\n",$3);}
	;
EXPR : EXPR1 {val=$1;} EXPR_1 		{$$ = $3;printf("Value of EXPR is : %d\n",$3);}
	| EXPR1 						{$$=$1;printf("Value of EXPR is : %d\n",$$);}
	;
EXPR_1 : OP1 EXPR1 EXPR_1 			{
										if($1=='+'){
											$$=$3 + $2;
											printf("Value of EXPR_1 is : %d\n",$$);
											printf("Operator Value is %c\n",$1);
										}
										else{
											$$=$3 - $2;
											printf("Value of EXPR_1 is : %d\n",$$);
											printf("Operator Value is %c\n",$1);
										}
									}
	| OP1 EXPR1 					{
										if($1=='+'){
											$$=val + $2;
											printf("Value of EXPR_1 is : %d\n",$$);
											printf("Operator Value is %c\n",$1);
										}
										else{
											$$=val - $2;
											printf("Value of EXPR_1 is : %d\n",$$);
											printf("Operator Value is %c\n",$1);
										}
									}
	;
EXPR1 : EXPR2 {val=$1;} EXPR1_1 	{$$ = $3;printf("Value of EXPR1 is : %d\n",$3);}
	| EXPR2 						{$$=$1;printf("Value of EXPR1 is : %d\n",$1);}
	;
EXPR1_1 : OP2 EXPR2 EXPR1_1 		{
										if($1=='*'){
											$$=$3 * $2;
											printf("Value of EXPR_1 is : %d\n",$$);
											printf("Operator Value is %c\n",$1);
										}
										else if($1=='/'){
											if($2!=0){
												$$=$3 / $2;
												printf("Value of EXPR_1 is : %d\n",$$);
												printf("Operator Value is %c\n",$1);
											}
											else {
												printf("\nError: Can't divide by 0\n");
												exit(1);
											}
										}
										else {
											$$=$3 % $2;
											printf("Value of EXPR_1 is : %d\n",$$);
											printf("Operator Value is %c\n",$1);
										}
									}
	| OP2 EXPR2 					{
										if($1=='*'){
											$$=val * $2;
											printf("Value of EXPR_1 is : %d\n",$$);
											printf("Operator Value is %c\n",$1);
										}
										else if($1=='/'){
											if($2!=0) {
												$$=val / $2;
												printf("Value of EXPR_1 is : %d\n",$$);
												printf("Operator Value is %c\n",$1);
											}
											else {
												printf("\nError: Can't divide by 0\n");
												exit(1);
											}
										}
										else {
											$$=val % $2;
											printf("Value of EXPR_1 is : %d\n",$$);
											printf("Operator Value is %c\n",$1);
										}
									}
	; 
EXPR2 : EXPR3 {val = $1;} EXPR2_1	{$$ = $3;printf("Value of EXPR2 is : %d\n",$3);}
	| EXPR3 						{$$=$1;printf("Value of EXPR2 is : %d\n",$1);}
	;
EXPR2_1 : OP4 EXPR3 EXPR2_1			{	
										$$=pow($3, $2);
										printf("Value of EXPR_1 is : %d\n",$$);
										printf("Operator Value is %c\n",$1);
									}
	| OP4 EXPR3 					{
										$$=pow(val, $2);
										printf("Value of EXPR_1 is : %d\n",$$);
										printf("Operator Value is %c\n",$1);
									}
	;
EXPR3 : '(' EXPR ')' 				{$$=$2;}
	| id 							{$$=$1;printf("Value of EXPR3 is : %d\n",$1);}
	;
id : VARNAME 						{$$=sym[$1];printf("Value of Variable is : %d\n",sym[$1]);}
	| DIGIT 						{$$=$1;printf("Value of Digit is : %d\n",$1);}
	;

PrintFunc : PRINTF '(' EXPR ')' ';'
	;

IF_STMT : IF'('COND')' ':' STMTS END 
	| IF '(' COND ')' ':' STMTS ELSE STMTS END 
	;
COND : VALUE OP3 VALUE 
	;
VALUE : VARNAME 					{$$=$1;}
	| DIGIT 						{$$=$1;}
	;
OP3 : P1 							{$$='<';}
	| P2 							{$$='>';}
	| P3 							{$$='>=';}
	| P4 							{$$='<=';}
	| P5 							{$$='!=';}
	| P6 							{$$='==';}
	;
OP1 : P11 							{$$='+';}
	| P12 							{$$='-';}
	;
OP2 : P21 							{$$='/';}
	| P22 							{$$='*';}
	| P23 							{$$='%';}
	;
OP4 : P7 							{$$='^';}

FOR_LOOP : FOR '(' EXP ';' COND ';' EXP ')' ':' STMTS END 
	;

WHILE_LOOP : WHILE '(' COND ')' ':' STMTS END 
	;

%%
#include"lex.yy.c"
#include<ctype.h>
int count=0;
int main(int argc, char *argv[])
{
	yyin = fopen("example.c", "r");
	
   if(!yyparse())
		printf("\nParsing complete\n");
	else
		printf("\nParsing failed\n");
	
	fclose(yyin);
    return 0;
}
         
yyerror(char *s) {
	printf("%d : %s %s\n", yylineno, s, yytext );
}         
