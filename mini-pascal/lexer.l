%{
#include <stdio.h>
#include <stdlib.h>
// #include "y.tab.h"  // Inclua a definição dos tokens gerados pelo Bison (geralmente "y.tab.h")
%}

id [a-zA-Z][a-zA-Z1-9]*

digitos [0-9]+

fracao_opcional (.{digitos})?

expoente_opcional ([Ee][+-]?{digitos})?

%%

"program"                  { return PROGRAM; }
.                          { return yytext[0]; }  // Para caracteres que não são identificados como tokens
    
"integer"                  { return INTEIRO; }
"real"                     { return REAL; }
"function"                 { return FUNCTION; }
"procedure"                { return PROCEDURE; }
"("                        { return ABRE_PARENTESES; }
")"                        { return FECHA_PARENTESES; }
"."                        { return PONTO_FINAL; }
";"                        { return PONTO_VIRGULA; }
","                        { return VIRGULA; }
":"                        { return DOIS_PONTOS; }
"begin"                    { return BEGIN_TOKEN; }
"end"                      { return END; }
"if"                       { return IF; }
"then"                     { return THEN; }
"else"                     { return ELSE; }
"while"                    { return WHILE; }
"do"                       { return DO; }
":="                       { return OPERADOR_ATRIBUICAO; }
"="|"<>"|">"|">="|"<"|"<=" { return OPERADOR_RELACIONAL; }
"\+"                       { return MAIS; }
"\-"                       { return MENOS; }
"or"                       { return OR; }
"\*|\/|div|mod|and"        { return OPERADOR_MULTIPLICATIVO; }

/* [0-9]+(\.[0-9]+)?([Ee][+-]?[0-9]+)? { return NUM; } */

// Reconhece números inteiros e decimais com notação científica 
{digitos}{fracao_opcional}{expoente_opcional} {
    yylval.lexema = strdup(yytext);
    return NUM;
}

{id} {
    yylval.lexema = strdup(yytext);
    return ID;
}

\n {
    //return EOL;
}

[ \t] {/*ignorar espacos em branco, incluindo tabs*/}

/* . { sprintf(err_buffer, "caracter estranho '%c'", *yytext); yyerror(err_buffer); } */
%%

int yywrap(void) {
    return 1;
}
