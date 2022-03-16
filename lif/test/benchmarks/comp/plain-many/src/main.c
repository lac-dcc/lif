#include "../include/comp.h"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <valgrind/memcheck.h>

#ifdef ENABLE_CTGRIND
#define ct_secret(addr, len) VALGRIND_MAKE_MEM_UNDEFINED(addr, len)
#else
#define ct_secret(addr, len)
#endif

int main() {
    int n;
    int m;

    /* scanf("%d", &n); */
    /* scanf("%d", &m); */

    // Read like Constantine:
    read(0, &n, sizeof(int));
    read(0, &m, sizeof(int));

    int **a = (int **) malloc(5 * sizeof(int *));
    for (int i = 0; i < 5; i++) a[i] = (int *) malloc(n * sizeof(int));

    __attribute__((annotate("secret"))) int *b =
        (int *) malloc(n * sizeof(int));

    /* for (int i = 0; i < n ; i++) scanf("%d", &a[i]); */
    /* for (int i = 0; i < n ; i++) scanf("%d", &b[i]); */

    // Read like Constantine:
    for (int i = 0; i < 5; i++) read(0, a[i], sizeof(int) * n);
    read(0, b, sizeof(int) * n);

    // Mark input as secret for ct_grind check:
    ct_secret(b, n);

    /* printf("%d\n", comp(a, b, 5, m)); */

    // Write like Constantine:
    int r = comp(a, b, 5, m);
    write(1, &r, sizeof(int));
}
