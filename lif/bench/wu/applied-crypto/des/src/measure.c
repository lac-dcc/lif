#include "../include/des.h"
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
    uint8_t in_key[32];
    unsigned char in[8];
    unsigned char out[8] = {0};

    srand(time(NULL));
    for (size_t i = 0; i < 32; i++) in_key[i] = rand() % 256;
    for (size_t i = 0; i < 8; i++) in[i] = rand() % 256;

    des_ctx dc;
    unsigned long work[2] = {0};

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    deskey(in_key, EN0);
    cpkey(dc.ek);
    scrunch(in, work);
    desfunc(dc.ek, work);
    unscrun(work, out);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
}
