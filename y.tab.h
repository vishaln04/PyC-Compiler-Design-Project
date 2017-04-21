/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IF = 258,
    FOR = 259,
    WHILE = 260,
    END = 261,
    ELSE = 262,
    VARNAME = 263,
    DIGIT = 264,
    INT = 265,
    CHAR = 266,
    PRINTF = 267,
    MAIN = 268,
    P1 = 269,
    P2 = 270,
    P3 = 271,
    P4 = 272,
    P5 = 273,
    P6 = 274,
    P7 = 275,
    P11 = 276,
    P12 = 277,
    P21 = 278,
    P22 = 279,
    P23 = 280
  };
#endif
/* Tokens.  */
#define IF 258
#define FOR 259
#define WHILE 260
#define END 261
#define ELSE 262
#define VARNAME 263
#define DIGIT 264
#define INT 265
#define CHAR 266
#define PRINTF 267
#define MAIN 268
#define P1 269
#define P2 270
#define P3 271
#define P4 272
#define P5 273
#define P6 274
#define P7 275
#define P11 276
#define P12 277
#define P21 278
#define P22 279
#define P23 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
