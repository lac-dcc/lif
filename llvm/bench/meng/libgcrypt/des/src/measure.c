#include "../include/des.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NS_PER_SECOND 1000000000
#define INLINE __attribute__((__always_inline__)) inline
INLINE uint64_t nanoseconds(struct timespec t) {
    return t.tv_sec * NS_PER_SECOND + t.tv_nsec;
}

int main() {
    uint8_t in_key[24] __attribute__((aligned(64)));
    uint8_t in[64];
    uint8_t out[64];

    srand(time(NULL));
    for (size_t i = 0; i < 24; i++) in_key[i] = rand() % 256;
    for (size_t i = 0; i < 64; i++) in[i] = rand() % 256;

    des_ctx ctx;

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    des_setkey(in_key, ctx);
    des_ecb_crypt(ctx, in, out, MODE_ENC);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
}
