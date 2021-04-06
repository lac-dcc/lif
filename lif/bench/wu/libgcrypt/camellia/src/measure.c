#include "../include/camellia.h"
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
    uint8_t in_key[24] __attribute__((aligned(64))) = {
        230, 206, 204, 99,  222, 174, 15, 99,  194, 200, 123, 233,
        145, 84,  160, 149, 219, 114, 38, 185, 31,  54,  185, 40};

    uint32_t subkey[50] = {0};

    srand(time(NULL));
    for (size_t i = 0; i < 24; i++) in_key[i] = rand() % 256;
    for (size_t i = 0; i < 50; i++) subkey[i] = rand() % 256;

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    camellia_setup128(in_key, subkey);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
}
