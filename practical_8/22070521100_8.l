%{
#include <stdio.h>
#include <stdlib.h> // Include stdlib for atof

#define NUMBER 257
#define PLUS 258
#define MINUS 259
#define MULTIPLY 260
#define DIVIDE 261
#define LPAREN 262
#define RPAREN 263
#define NEWLINE 264

/* FIX: Define yylval here instead of just declaring it as extern, 
   so the linker can find it. */
double yylval;

int yywrap(void) { return 1; }
%}

%%
[0-9]+(\.[0-9]+)?    { 
                        yylval = atof(yytext); 
                        return NUMBER; 
                     }

"+"                  { return PLUS;     }
"-"                  { return MINUS;    }
"*"                  { return MULTIPLY; }
"/"                  { return DIVIDE;   }
"("                  { return LPAREN;   }
")"                  { return RPAREN;   }

\n                   { return NEWLINE;  }

[ \t]+               ; 

.                    { 
                        fprintf(stderr, "Error: Invalid character '%s'\n", yytext);
                     }
%%

int main() {
    int token;
    printf("--- Infix Calculator Lexer (Tokens Only) ---\n");
    printf("Enter an expression (e.g., 2 * (3 + 4) / 7):\n");
    
    while ((token = yylex())) {
        if (token == NUMBER) {
            printf("Token: NUMBER (Value: %.2f)\n", yylval);
        } else {
            printf("Token: %d ('%s')\n", token, yytext);
        }
    }
    return 0;
}

