#include "../include/aes.h"
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
    uint8_t in[64];
    uint8_t out[64];
    AES_KEY e_key;

    srand(time(NULL));
    for (size_t i = 0; i < 32; i++) in_key[i] = rand() % 256;
    for (size_t i = 0; i < 64; i++) in[i] = rand() % 256;

    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    AES_set_encrypt_key(in_key, 128, &e_key);
    AES_encrypt(in, out, &e_key);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);

    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("%ld\n", delta);
    return 0;
}

