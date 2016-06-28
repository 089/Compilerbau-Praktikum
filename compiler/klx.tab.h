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

#ifndef YY_YY_KLX_TAB_H_INCLUDED
# define YY_YY_KLX_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    KREIS = 258,
    LINIE = 259,
    DREIECK = 260,
    QUADRAT = 261,
    LINIENDICKE = 262,
    GEFUELLT = 263,
    NICHTGEFUELLT = 264,
    KOORD = 265,
    SKALIEREN = 266,
    DREHEN = 267,
    SEMIKOLON = 268,
    EKO = 269,
    EKS = 270,
    DEKO = 271,
    DEKS = 272,
    TRENNZEICHEN = 273,
    RKO = 274,
    RKS = 275,
    ASSIGN = 276,
    DEKLARIERE = 277,
    FARBE = 278,
    ROT = 279,
    BLAU = 280,
    GELB = 281,
    MINION = 282,
    GRUEN = 283,
    ORANGE = 284,
    LILA = 285,
    PINK = 286,
    SCHWARZ = 287,
    BRAUN = 288,
    GRAU = 289,
    WEISS = 290,
    ADD = 291,
    SUB = 292,
    MUL = 293,
    DIV = 294,
    EXP = 295,
    MOD = 296,
    WENN = 297,
    DANN = 298,
    DANNDANN = 299,
    GKO = 300,
    GKS = 301,
    FRAGEZEICHEN = 302,
    DOPPELPUNKT = 303,
    PROZEDUR = 304,
    WIEDERHOLEN = 305,
    KLEINER = 306,
    KLEINERGLEICH = 307,
    GROESSER = 308,
    GROESSERGLEICH = 309,
    ISTGLEICH = 310,
    UNGLEICH = 311,
    UND = 312,
    ODER = 313,
    NICHT = 314,
    WAHR = 315,
    FALSCH = 316,
    NUMBER = 317,
    ID = 318,
    FLOAT = 319
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 11 "klx.y" /* yacc.c:1909  */
 int i; node *n; double d; 

#line 122 "klx.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_KLX_TAB_H_INCLUDED  */
