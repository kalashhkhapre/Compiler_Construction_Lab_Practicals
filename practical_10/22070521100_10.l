%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int temp_count = 0;

#define MAX 100
char stack[MAX][20];
int top = -1;

void push(char *val) {
    strcpy(stack[++top], val);
}

char* pop() {
    return stack[top--];
}

void gen_code(char op) {
    char *b = pop();
    char *a = pop();
    char temp[20];
    sprintf(temp, "t%d", temp_count++);
    printf("%s = %s %c %s\n", temp, a, op, b);
    push(temp);  // push the temporary result back to stack
}

int yywrap(void) { return 1; }
%}

%%

[0-9]+                  { push(yytext); }                 /* Operand */
[a-zA-Z_][a-zA-Z0-9_]*  { push(yytext); }                 /* Variable */
[\+\-\*\/]              { gen_code(yytext[0]); }          /* Operator */
[ \t\n]+                ;                                  /* Ignore spaces */
.                       { printf("Invalid token: %s\n", yytext); }
%%

int main() {
    printf("Enter a postfix expression:\n");
    yylex();
    if(top == 1)
        printf("Final Result in %s\n", stack[top]);
    else
        printf("Error: Invalid expression\n");
    return 0;
}

