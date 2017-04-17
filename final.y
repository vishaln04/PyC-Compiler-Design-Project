%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *fp;
%}

%token IF FOR WHILE END ELSE COLON SEMICOLON VARNAME DIGIT INT CHAR PRINTF
%token P1 P2 P3 P4 P5 P6 P7 P11 P12 P21 P22 P23
%%

STMTS : STMT ';' 
	| STMT ';' STMTS 
	| CONTROL STMTS
	| PrintFunc 
	|
	;

STMT : VAR 
	| EXP 
	;

CONTROL : IF_STMT 
	| FOR_LOOP 
	| WHILE_LOOP 
	;

DATATYPE : INT 
	| CHAR 
	;

VAR : DATATYPE VARNAMES
	| DATATYPE VARNAME '=' DIGIT 
	;

VARNAMES : VARNAME ',' VARNAMES 
	| VARNAME 
	;

EXP : VARNAME '=' EXPR 
	| VARNAME '=' id
	;
EXPR : EXPR1 EXPR_1 
	| EXPR1 
	;
EXPR_1 : OP1 EXPR1 EXPR_1 
	| OP1 EXPR1 
	;
EXPR1 : EXPR2 EXPR1_1 
	| EXPR2 
	;
EXPR1_1 : OP2 EXPR2 EXPR1_1 
	| OP2 EXPR2 
	; 
EXPR2 : EXPR3 EXPR2_1
	| EXPR3 
	;
EXPR2_1 : OP4 EXPR3 EXPR2_1
	| OP4 EXPR3 
	;
EXPR3 : '(' EXPR ')' 
	| id
	;
id : VARNAME 
	| DIGIT 
	;

PrintFunc : PRINTF '(' EXPR ')' ';'
	;

IF_STMT : IF'('COND')' ':' STMTS END 
	| IF '(' COND ')' ':' STMTS ELSE STMTS END 
	;
COND : VALUE OP3 VALUE 
	;
VALUE : VARNAME 
	| DIGIT 
	;
OP3 : P1
	| P2
	| P3
	| P4
	| P5
	| P6
	;
OP1 : P11
	| P12
	;
OP2 : P21
	| P22
	| P23
	;
OP4 : P7
	;
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
