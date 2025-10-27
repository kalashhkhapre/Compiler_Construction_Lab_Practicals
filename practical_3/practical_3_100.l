%{
#include <stdio.h>
int count = 0;
int yylex(void);
%}

%%
[Aa][a-zA-Z0-9_]* { count++; }
[ \t\n]+           { /* Ignore whitespace */ }
.                  { /* Ignore other characters */ }
%%

int yywrap(void) {
    return 1;
}

int main() {
    printf("Enter the input text:\n");
    yylex();
    printf("Number of words starting with 'A' or 'a': %d\n", count);
    return 0;
}

