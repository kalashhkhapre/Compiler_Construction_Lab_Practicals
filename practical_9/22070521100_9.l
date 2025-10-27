%{
#include <stdio.h>
#include <string.h>

int yywrap(void) { return 1; }
%}

/*------------------- TOKEN RULES -------------------*/
%%
"for"               { printf("Keyword: FOR\n"); }
"("                 { printf("Symbol: (\n"); }
")"                 { printf("Symbol: )\n"); }
";"                 { printf("Symbol: ;\n"); }
"<="|">="|"=="|"!="|"<"|">"  { printf("Relational Operator: %s\n", yytext); }
"="                 { printf("Assignment Operator: =\n"); }
[0-9]+              { printf("Number: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[ \t\n]+            ;   /* Ignore whitespace */
.                   { printf("Unknown token: %s\n", yytext); }
%%

int main() {
    printf("Enter a FOR loop statement:\n");
    yylex();
    return 0;
}

