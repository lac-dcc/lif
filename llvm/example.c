#include <stdlib.h>
#include <stdio.h>

int comp2(int *input, int *secret) {
    if (input[0] != secret[0]) return 0;
    if (input[1] != secret[1]) return 0;
    return 1;
}

int main() {
    int *input = (int *) malloc(sizeof(int) * 2);
    int *secret = (int *) malloc(sizeof(int) * 2);

    input[0] = secret[0] = 0;
    input[1] = secret[1] = 1;

    printf("%d\n", comp2(input, secret));

    secret[1] = 0;
    printf("%d\n", comp2(input, secret));
    
    return 0;
}
