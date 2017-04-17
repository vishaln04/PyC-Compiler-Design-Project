%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *fp;
%}

%token IF FOR WHILE END ELSE COLON SEMICOLON OP1 OP2 OP3 OP4 VARNAME DIGIT INT CHAR PRINTF

%%

STMTS : STMT ';' 
	| STMT ';' STMTS 
	| CONTROL STMTS
	| PrintFunc 
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

COND : VALUE OP3 VALUE 
	;
PrintFunc : PRINTF '(' EXPR ')' ';'
	;

IF_STMT : IF '(' COND ')' ':' STMTS END 
	| IF '(' COND ')' ':' STMTS ELSE STMTS END 
	;

VALUE : VARNAME 
	| DIGIT 
	;

FOR_LOOP : FOR '(' EXP ';' COND ';' EXPR ')' ':' STMTS END 
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
