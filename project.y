%{
#include<stdio.h>
#include<stdlib.h>
%}

%token 

%%

START : HEADER START1 ;
HEADER : include filename ;| lambda ;
START1 : MAIN | FUNC MAIN ;
FUNC : FUN | FUN FUNC ;
FUN : function VARNAME (PARALIST) : STMTS end | function VARNAME (PARALIST) : STMTS return [VARNAMES | DIGIT ] ; end;
PARALIST : DATATYPE VARNAME | lambda | DATATYPE VARNAME , PARALIST;
MAIN : void main() : STMTS end;
STMTS : STMT ; | STMT ; STMTS | CONTROL STMTS ;
STMT : VAR| EXP | VARNAME(lambda| VARNAMES) | VARNAMES= VARNAME(lambda| VARNAMES) | filename.funcname(lambda| VARNAMES) | VARNAMES = filename>funcname(lambda | VARNAMES)| PRINTF | SCANF;

PRINTF : printf("msg[%d | %c]*?",[VARNAMES]*?) ;
SCANF: scanf("[%d | %c] +?",[& VARNAMES]+) ;
CONTROL : IF | FOR | WHILE | SWITCH ;

DATATYPE: int | char ;

VARNAME : [a-zA-Z]+ ;
DIGIT : [0-9]+ ;

VAR : DATATYPE VARNAMES; | DATATYPE VARNAME = DIGIT | char VARNAME = "msg" ;
VARNAMES : VARNAME , VARNAMES | VARNAME ;

EXP: VARNAME = EXPR ;
EXPR : EXPR1 EXPR_1 | EXPR1 ;
EXPR_1 : OP1 EXPR1 EXPR_1 | OP1 EXPR1 ;
EXPR1 : EXPR2 EXPR1_1 | EXPR2 ;
EXPR1_1 : OP2 EXPR2 EXPR1_1 | OP2 EXPR2 ; 
EXPR2 : EXPR3 EXPR2_1| EXPR3 ;
EXPR2_1: ^EXPR3 EXPR2_1| ^EXPR3 ;
EXPR3: (EXPR)| id;

OP1 : +| -;
OP2 : / | * |%;

IF: if(COND): STMTS ; end | if(COND): STMTS else STMTS end ;
COND: VARNAMES OP3 VARNAME ;
OP3 : < | > |>= | <= | != | == ;

FOR : for(EXP;COND ;EXPR):STMTS end ;
WHILE : while(COND):STMTS end;
SWITCH : switch(VARNAME): CASES end;
CASES: CASE|CASE CASES;
CASE : CASE DIGIT : STMTS break;

%%

