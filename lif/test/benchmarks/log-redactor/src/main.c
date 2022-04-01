#include "../include/log_redactor.h"
#include "../../include/taint.h"

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

int main () {
#ifndef ENABLE_UNROLL
    const unsigned L0 = 3;
    const unsigned L1 = 10;
    const unsigned P = 4;
#endif

    secret char *log[L0];
    secret char pattern[P];

    for (unsigned i = 0; i < L0; i++) {
        log[i] = (char *) malloc(L1);
        // Constantine will taint this, due to "read", so let's just
        // consider log as secret too...
        read(0, log[i], L1);
    }

    read(0, pattern, P);

    // Mark input as secret for ct_grind check:
    ct_secret(pattern, sizeof(char) * P);
    ct_secret(log, sizeof(char) * L0 * L1);

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

#ifdef ENABLE_UNROLL
    log_redactor(log, pattern);
#else
    log_redactor(log, pattern, L0, L1, P);
#endif

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("\nTime: %ld\n", delta);
#endif

    for (unsigned j = 0; j < L0; j++) {
        // Write like Constantine:
        write(1, log[j], L1);
    }
}
