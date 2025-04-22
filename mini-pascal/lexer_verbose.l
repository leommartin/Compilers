%{
#include <stdio.h>
#include <stdlib.h>
%}

id [a-zA-Z][a-zA-Z1-9]*
digitos [0-9]+
fracao_opcional (\.{digitos})?
expoente_opcional ([Ee][+-]?{digitos})?

%%

"program"                  { printf("TOKEN: PROGRAM\n"); }
"integer"                  { printf("TOKEN: INTEIRO\n"); }
"real"                     { printf("TOKEN: REAL\n"); }
"function"                 { printf("TOKEN: FUNCTION\n"); }
"procedure"                { printf("TOKEN: PROCEDURE\n"); }
"("                        { printf("TOKEN: ABRE_PARENTESES\n"); }
")"                        { printf("TOKEN: FECHA_PARENTESES\n"); }
"."                        { printf("TOKEN: PONTO_FINAL\n"); }
";"                        { printf("TOKEN: PONTO_VIRGULA\n"); }
","                        { printf("TOKEN: VIRGULA\n"); }
":"                        { printf("TOKEN: DOIS_PONTOS\n"); }
"begin"                    { printf("TOKEN: BEGIN_TOKEN\n"); }
"end"                      { printf("TOKEN: END\n"); }
"if"                       { printf("TOKEN: IF\n"); }
"then"                     { printf("TOKEN: THEN\n"); }
"else"                     { printf("TOKEN: ELSE\n"); }
"while"                    { printf("TOKEN: WHILE\n"); }
"do"                       { printf("TOKEN: DO\n"); }
":="                       { printf("TOKEN: OPERADOR_ATRIBUICAO\n"); }
"="|"<>"|">"|">="|"<"|"<=" { printf("TOKEN: OPERADOR_RELACIONAL\n"); }
"+"                        { printf("TOKEN: MAIS\n"); }
"-"                        { printf("TOKEN: MENOS\n"); }
"or"                       { printf("TOKEN: OR\n"); }
"*"|"/"|"div"|"mod"|"and"  { printf("TOKEN: OPERADOR_MULTIPLICATIVO\n"); }

{digitos}{fracao_opcional}{expoente_opcional} {
    printf("TOKEN: NUM (%s)\n", yytext);
}

{id} {
    printf("TOKEN: ID (%s)\n", yytext);
}

[ \t\n\r]  {/* Ignorar espaços, tabs, novas linhas */}

. {
    printf("Caractere não reconhecido: '%c'\n", *yytext);
}

%%

int yywrap(void) {
    return 1;
}
