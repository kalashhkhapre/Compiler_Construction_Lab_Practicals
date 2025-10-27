%{
#include <stdio.h>
#include <stdlib.h>

#define MAX 100
int stack[MAX];
int top = -1;

void push(int val) {
    if (top >= MAX - 1) {
        printf("Stack overflow\n");
        exit(1);
    }
    stack[++top] = val;
}

int pop() {
    if (top < 0) {
        printf("Stack underflow\n");
        exit(1);
    }
    return stack[top--];
}

int yywrap(void) { return 1; }
%}

%%
[0-9]+      { push(atoi(yytext)); }   /* Push operand */
[\+\-\*\/]  {
                int b = pop();
                int a = pop();
                switch(yytext[0]) {
                    case '+': push(a + b); break;
                    case '-': push(a - b); break;
                    case '*': push(a * b); break;
                    case '/':
                        if (b == 0) {
                            printf("Error: Division by zero\n");
                            exit(1);
                        }
                        push(a / b);
                        break;
                }
            }
\n          {
                if (top == 0)
                    printf("Result = %d\n", stack[top]);
                else
                    printf("Invalid expression\n");
                top = -1; /* reset for next expression */
            }
[ \t]+      ;   /* ignore spaces */
.           { printf("Invalid token: %s\n", yytext); exit(1); }
%%

int main() {
    printf("Enter a postfix expression (press Enter after it):\n");
    yylex();
    return 0;
}

