#include "../include/cast6.h"
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
    uint8_t in[16];
    uint8_t out[16];
    struct cast6_ctx ctx;

    srand(time(NULL));
    for (size_t i = 0; i < 32; i++) in_key[i] = rand() % 256;
    for (size_t i = 0; i < 16; i++) in[i] = rand() % 256;

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    cast6_setkey(&ctx, in_key, 32);
    cast6_encrypt(&ctx, out, in);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
}
