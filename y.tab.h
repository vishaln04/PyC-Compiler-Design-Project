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
    COLON = 263,
    SEMICOLON = 264,
    VARNAME = 265,
    DIGIT = 266,
    INT = 267,
    CHAR = 268,
    PRINTF = 269,
    P1 = 270,
    P2 = 271,
    P3 = 272,
    P4 = 273,
    P5 = 274,
    P6 = 275,
    P7 = 276,
    P11 = 277,
    P12 = 278,
    P21 = 279,
    P22 = 280,
    P23 = 281
  };
#endif
/* Tokens.  */
#define IF 258
#define FOR 259
#define WHILE 260
#define END 261
#define ELSE 262
#define COLON 263
#define SEMICOLON 264
#define VARNAME 265
#define DIGIT 266
#define INT 267
#define CHAR 268
#define PRINTF 269
#define P1 270
#define P2 271
#define P3 272
#define P4 273
#define P5 274
#define P6 275
#define P7 276
#define P11 277
#define P12 278
#define P21 279
#define P22 280
#define P23 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
