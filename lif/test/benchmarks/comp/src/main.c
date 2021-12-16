#include <stdio.h>
#include <stdlib.h>

#include "../include/comp.h"

S s;
int main() {
    int n;
    int m;
    scanf("%d", &n);
    scanf("%d", &m);

    s.p = (int *) malloc(n * sizeof(int));
    int *b = (int *) malloc(n * sizeof(int));

    for (int i = 0; i < n ; i++) scanf("%d", &s.p[i]);
    for (int i = 0; i < n ; i++) scanf("%d", &b[i]);

    printf("%d\n", comp(&s, b, m));
}
