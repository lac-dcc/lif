#include "../include/twofish.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NS_PER_SECOND 1000000000
#define INLINE __attribute__((__always_inline__)) inline
INLINE uint64_t nanoseconds(struct timespec t) {
    return t.tv_sec * NS_PER_SECOND + t.tv_nsec;
}

int main() {
    uint8_t in_key[16];
    uint8_t in[16];
    uint8_t out[16];

    srand(time(NULL));
    for (size_t i = 0; i < 16; i++) in_key[i] = rand() % 256;
    for (size_t i = 0; i < 16; i++) in[i] = rand() % 256;

    TWOFISH_context ctx;

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    do_twofish_setkey(in_key, &ctx, 16);
    do_twofish_encrypt(&ctx, out, in);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
}

