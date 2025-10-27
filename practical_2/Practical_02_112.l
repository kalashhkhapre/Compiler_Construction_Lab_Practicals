%{
#include <stdio.h>
#include <string.h>

int lc = 0, sc = 0, wc = 0, kw = 0, id = 0, num = 0, sym = 0, comments = 0;

char *keywords[] = {
  "int", "float", "if", "else", "while", "for", "do", "return",
  "break", "continue", "char", "double", "long", "short", "unsigned",
  "void", "static", "const", "switch", "case", "default", "struct",
  "union", "typedef", "enum", "sizeof", "volatile", "register", NULL
};

int isKeyword(char *str) {
    for (int i = 0; keywords[i] != NULL; i++) {
        if (strcmp(str, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%
"//".*              { comments++; }                      // single-line comment
"/"([^]|\+[^/])\+"/"  { comments++; }             // multi-line comment
[\n]                { lc++; }
[ ]                 { sc++; }
[0-9]+              { num++; }
[a-zA-Z_][a-zA-Z0-9_]* {
                        wc++;
                        if (isKeyword(yytext))
                            kw++;
                        else
                            id++;
                    }
[=+\-*/%;<>{}()[\],] { sym++; }
.                   { /* ignore other characters */ }
%%

int yywrap() { return 1; }

int main() {
    printf("Enter your code snippet (Ctrl+D to end input):\n");
    yylex();
    printf("\n--- Output ---\n");
    printf("Lines         : %d\n", lc);
    printf("Spaces        : %d\n", sc);
    printf("Words         : %d\n", wc);
    printf("Keywords      : %d\n", kw);
    printf("Identifiers   : %d\n", id);
    printf("Numbers       : %d\n", num);
    printf("Special chars : %d\n", sym);
    printf("Comments      : %d\n", comments);
    return 0;
}
