#include "../include/loki91.h"
#include "../../../../include/taint.h"

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

int main(void) {
    secret unsigned char in[8];
    secret unsigned char in_key[24];

    /* for (int i = 0; i < 8; i++) { */
    /*     int x; */
    /*     scanf("%x", &x); */
    /*     key[i] = (uint8_t) x; */
    /* } */

    /* for (int i = 0; i < 24; i++) { */
    /*     int x; */
    /*     scanf("%d", &x); */
    /*     data[i] = (unsigned char) x; */
    /* } */

    // Read like Constantine:
    read(0, in, sizeof(unsigned char) * 8);
    read(0, in_key, sizeof(unsigned char) * 24);

    // Mark input as secret for ct_grind check:
    ct_secret(in, 3);
    ct_secret(in_key, 3);

    loki_ctx lc;

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

    setlokikey(in_key, &lc);
    enloki(&lc, in);

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("Time: %ld\n", delta);
#endif

    /* for (size_t i = 0; i < 24; i++) printf("%d ", data[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, in, sizeof(unsigned char) * 8);
    return 0;
}
