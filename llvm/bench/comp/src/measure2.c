#include "../include/comp.h"
#include <stdio.h>
#include <time.h>

#define _NS_PER_SECO_ND 1000000000
#define INLINE __attribute__((__always_inline__)) inline
INLINE uint64_t nanoseconds(struct timespec t) {
    return t.tv_sec * _NS_PER_SECO_ND + t.tv_nsec;
}

// Dummy value used to warm up the cache.
volatile int dummy;

int main() {
    int a[_N], b[_N];
#pragma nounroll
    for (size_t i = 0; i < _N; i++) a[i] = b[i] = i;
    b[0] = -1;
#pragma nounroll
    for (size_t i = 0; i < _N; i++) {
        dummy = a[i];
        dummy = b[i];
    }

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    comp(a, b);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
}

