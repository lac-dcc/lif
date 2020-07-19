#include "../include/loki91.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NS_PER_SECOND 1000000000
#define INLINE __attribute__((__always_inline__)) inline
INLINE uint64_t nanoseconds(struct timespec t) {
    return t.tv_sec * NS_PER_SECOND + t.tv_nsec;
}

int main(void) {
    unsigned char key[8];
    unsigned char data[24];

    srand(time(NULL));
    for (size_t i = 0; i < 8; i++) key[i] = rand() % 256;
    for (size_t i = 0; i < 24; i++) data[i] = rand() % 256;

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    loki_ctx lc;
    setlokikey(key, &lc);
    enloki(&lc, data);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
}

