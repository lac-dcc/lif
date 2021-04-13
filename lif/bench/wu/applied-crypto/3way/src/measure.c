#include "../include/3way.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NS_PER_SECOND 1000000000
#define INLINE __attribute__((__always_inline__)) inline
INLINE uint64_t nanoseconds(struct timespec t) {
    return t.tv_sec * NS_PER_SECOND + t.tv_nsec;
}

int main() {
    twy_ctx gc;
    int32_t a[3],k[3];

    srand(time(NULL));
    for (size_t i = 0; i < 3; i++) k[i] = rand() % 256;
    for (size_t i = 0; i < 3; i++) a[i] = rand() % 256;

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    twy_key(k, &gc);
    twy_enc(&gc, a, 3);
    twy_dec(&gc, a, 3);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
} 
