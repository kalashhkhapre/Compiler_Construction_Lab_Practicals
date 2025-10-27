%{
#include <stdio.h>
int yywrap(void) { return 1; }   /* prevents linker error */
%}

%%
.*com$   { printf("Line ends with 'com': %s", yytext); }
.*        { /* ignore other lines */ }
%%

int main()
{
    yylex();
    return 0;
}

