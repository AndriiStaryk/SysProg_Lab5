%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();                  
    void yyerror(const char *s);   
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

ArithmeticExpression: E {
        printf("\nResult=%d\n", $$);
        return 0;
    }
;

E: E '+' E { $$ = $1 + $3; }
 | E '-' E { $$ = $1 - $3; }
 | E '*' E { $$ = $1 * $3; }
 | E '/' E { $$ = $1 / $3; }
 | E '%' E { $$ = $1 % $3; }
 | '(' E ')' { $$ = $2; }
 | NUMBER { $$ = $1; }
;

%%

void main() {
    printf("\nEnter expression using numbers, (), -, +, *, \\ , % \n");
    yyparse();
}

void yyerror(const char *s) {
    printf("\nEntered arithmetic expression is Invalid\n\n");
}
