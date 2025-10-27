%{
#include <stdio.h>
#include <stdlib.h>

void decimal_to_hex(int num) {
    char hex[100];
    int i = 0, remainder;

    if(num == 0) {
        printf("0x0\n");
        return;
    }

    while(num != 0) {
        remainder = num % 16;
        if (remainder < 10)
            hex[i++] = remainder + '0';
        else
            hex[i++] = remainder - 10 + 'A';
        num /= 16;
    }

    printf("0x");
    for (int j = i - 1; j >= 0; j--)
        printf("%c", hex[j]);
    printf("\n");
}
%}

%%
[0-9]+  {
            int num = atoi(yytext);
            printf("Decimal: %s => Hexadecimal: ", yytext);
            decimal_to_hex(num);
        }
.|\n    { /* Ignore other characters */ }
%%
int yywrap() {
    return 1;
}

int main() {
    printf("Reading numbers from input file...\n");
    yylex();
    return 0;
}


