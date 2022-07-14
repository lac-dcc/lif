#include "../include/mu.h"
#include "../../include/taint.h"

#include <stdio.h>
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
    secret int32_t a[3];

    /* for (int i = 0; i < 3; i++) scanf("%d", &a[i]); */

    // Read like Constantine:
    read(0, a, sizeof(int32_t) * 3);

    // Mark input as secret for ct_grind check:
    ct_secret(a, sizeof(int32_t) * 3);

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

    mu(a);

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("\nTime: %ld\n", delta);
#endif

    /* printf("%d\t%d\t%d\n", a[0], a[1], a[2]); */

    // Write like Constantine:
    write(1, a, sizeof(int32_t) * 3);
}
