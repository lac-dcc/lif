#include "../include/des.h"
#include "../../../../include/taint.h"

#include <stdint.h>
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
    secret uint8_t in_key[32];
    secret unsigned char in[8];

    /* for (int i = 0; i < 32; i++) { */
    /*     int x; */
    /*     scanf("%d", &x); */
    /*     in_key[i] = (uint8_t) x; */
    /* } */

    /* for (int i = 0; i < 8; i++) { */
    /*     int x; */
    /*     scanf("%x", &x); */
    /*     in[i] = (unsigned char) x; */
    /* } */

    // Read like Constantine:
    read(0, in_key, sizeof(uint8_t) * 32);
    read(0, in, sizeof(unsigned char) * 8);

    // Mark input as secret for ct_grind check:
    ct_secret(in_key, 3);
    ct_secret(in, 3);

    unsigned char out[8] = {0};

    des_ctx dc;
    unsigned long work[2] = {0};

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

    // des_key(&dc,key);
    deskey(in_key, EN0);
    cpkey(dc.ek);
    scrunch(in, work);
    desfunc(dc.ek, work);
    unscrun(work, out);

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("Time: %ld\n", delta);
#endif

    /* for (size_t i = 0; i < 8; i++) printf("%d ", out[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, out, sizeof(unsigned char) * 8);
}
