#include "../include/comp.h"
#include "../../../include/taint.h"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#ifdef ENABLE_MEASURE_TIME
#include <stdint.h>
#include <time.h>

#define _NS_PER_SECO_ND 1000000000
#define INLINE __attribute__((__always_inline__)) inline
INLINE uint64_t nanoseconds(struct timespec t) {
    return t.tv_sec * _NS_PER_SECO_ND + t.tv_nsec;
}
#endif

int main() {
    int n, m;

    // For constantine, we will need another way to define n and m;
    // otherwise, "read" will taint them.
    read(0, &n, sizeof(int));
    read(0, &m, sizeof(int));

    int **a = (int **) malloc(5 * sizeof(int *));
    for (int i = 0; i < 5; i++) a[i] = (int *) malloc(n * sizeof(int));

    secret int *b = (int *) malloc(n * sizeof(int));

    /* for (int i = 0; i < n ; i++) scanf("%d", &a[i]); */
    /* for (int i = 0; i < n ; i++) scanf("%d", &b[i]); */

    // Read like Constantine:
    for (int i = 0; i < 5; i++) read(0, a[i], sizeof(int) * n);
    read(0, b, sizeof(int) * n);

    // Mark input as secret for ct_grind check:
    ct_secret(b, sizeof(int) * n);

    /* printf("%d\n", comp(a, b, 5, m)); */

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

#ifdef ENABLE_UNROLL
    int r = comp(a, b);
#else
    int r = comp(a, b, 5, m);
#endif

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("\nTime: %ld\n", delta);
#endif

    // Write like Constantine:
    write(1, &r, sizeof(int));
}
