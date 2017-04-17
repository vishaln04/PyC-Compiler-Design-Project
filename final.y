%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *fp;
%}

%token IF FOR WHILE SWITCH END ELSE COLON SEMICOLON VARNAME DIGIT INT CHAR PRINTF
%token P1 P2 P3 P4 P5 P6 P7 P11 P12 P21 P22 P23 CASE BREAK VOID MAIN FUNCTION RETURN INCLUDE HEADERFILE
%%
START : HEADER START1 
	;
HEADER : INCLUDE '$' HEADERFILE '$' 
	;
START1 : MAIN_FUNC
	| FUNC MAIN_FUNC
	;
FUNC : FUN 
	| FUN FUNC 
	;
FUN : FUNCTION VARNAME '(' PARALIST ')' ':' STMTS END
	| FUNCTION VARNAME '(' PARALIST ')' ':' STMTS RETURN VALUE ';' END
	;
PARALIST : DATATYPE VARNAME 
	| DATATYPE VARNAME ',' PARALIST
	|
	;
MAIN_FUNC : VOID MAIN '(' ')' ':' STMTS END
	;
STMTS : STMT ';' 
	| STMT ';' STMTS 
	| CONTROL STMTS
	| PrintFunc 
	|
	;

STMT : VAR 
	| EXP
	| VARNAME '(' para ')' 
	| VARNAME '=' VARNAME '(' para ')' 
	;
para : lambda 
	| VARNAMES
	; 
lambda : ;

CONTROL : IF_STMT 
	| FOR_LOOP 
	| WHILE_LOOP
	| SWITCH_STMT
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
SWITCH_STMT : SWITCH'(' VALUE')' ':' CASES END
	;

CASES : CASE1
	|CASE1 CASES
	;
CASE1 : CASE VALUE ':' STMTS BREAK ';'
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
