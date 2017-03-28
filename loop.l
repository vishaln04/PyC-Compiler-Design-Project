%{
#include<stdio.h>
#include<ctype.h>
int c1=1; int c2=1; int c3=1;
%}
op "++"|"--"
rop "<"|">"|"<="|">="|"=="|"!="
id [a-zA-Z][a-zA-Z0-9]*
no [0-9]*
pp [\n]
%%

do{pp}+\{(.*\n)*.*\}{pp}+\while\(({id}{rop}({no}|{id}))?\) {printf("\nDo-While correct\n\n");c1=0;}
while\(({id}{rop}({no}|{id}))?\){pp}*\{(.*\n)*.*\} {printf("\nWhile correct\n\n");c2=0;}
for\(({id}=({no}|{id}))?\;{id}{rop}({id}|{no})\;{id}{op}\){pp}*\{(.*\n)*.*\} {printf("For correct\n");c3=0;}
%%
main()
{ yyin=fopen("test.c","r");
yylex();
if(c1==1)
printf("\nDo While is Not Correct\n\n");
if(c2==1)
printf("\nWhile is Not Correct\n\n");
if(c3==1)
printf("\nFor is Not Correct\n\n");
}
int yywrap()
{
return 1;
}
