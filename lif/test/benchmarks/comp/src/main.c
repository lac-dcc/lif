#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "../include/comp.h"

int main() {
    int n;
    int m;

    /* scanf("%d", &n); */
    /* scanf("%d", &m); */

    // Read like Constantine:
    read(0, &n, sizeof(int));
    read(0, &m, sizeof(int));

    int *a = (int *) malloc(n * sizeof(int));
    int *b = (int *) malloc(n * sizeof(int));

    /* for (int i = 0; i < n ; i++) scanf("%d", &a[i]); */
    /* for (int i = 0; i < n ; i++) scanf("%d", &b[i]); */

    // Read like Constantine:
    read(0, a, sizeof(int) * n);
    read(0, b, sizeof(int) * n);

    /* printf("%d\n", comp(a, b, m)); */

    // Write like Constantine:
    int r = comp(a, b, m);
    write(1, &r, sizeof(int));
}
