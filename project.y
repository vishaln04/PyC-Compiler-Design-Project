%{
#include<stdio.h>
#include<stdlib.h>
%}

%token IF FOR WHILE END ELSE COLON SEMICOLON OP1 OP2 OP3 OP4 VARNAME DIGIT INT CHAR

%%
S : STMTS {printf("Input accepted\n"); exit(0);}

STMTS : STMT ';' | STMT ';' STMTS | CONTROL STMTS ;
STMT : VAR | EXP ;
CONTROL : IF_STMT | FOR_LOOP | WHILE_LOOP ;

DATATYPE : INT | CHAR ;


VAR : DATATYPE VARNAMES ';' | DATATYPE VARNAME '=' DIGIT ;

VARNAMES : VARNAME ',' VARNAMES | VARNAME ;

EXP : VARNAME '=' EXPR ;
EXPR : EXPR1 EXPR_1 | EXPR1 ;
EXPR_1 : OP1 EXPR1 EXPR_1 | OP1 EXPR1 ;
EXPR1 : EXPR2 EXPR1_1 | EXPR2 ;
EXPR1_1 : OP2 EXPR2 EXPR1_1 | OP2 EXPR2 ; 
EXPR2 : EXPR3 EXPR2_1| EXPR3 ;
EXPR2_1 : OP4 EXPR3 EXPR2_1| OP4 EXPR3 ;
EXPR3 : '(' EXPR')' | id;
id : VARNAME | DIGIT ;


IF_STMT : IF '(' COND ')' ':' STMTS ';' END | IF '(' COND ')' ':' STMTS ELSE STMTS END ;
COND : VALUE OP3 VALUE ;
VALUE : VARNAME | DIGIT ;


FOR_LOOP : FOR '(' EXP ';' COND ';' EXPR ')' ':' STMTS END ;

WHILE_LOOP : WHILE '(' COND ')' ':' STMTS END ;

%%
#include "lex.yy.c"
int yyerror(char *msg)
{
printf("the statement is invalid\n");
exit(0);
}
main()
{
printf("enter the statement\n");
yyparse();
}

