#include "../include/crypto_secretbox.h"
#include "../../../include/taint.h"

#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#include <time.h>
#include <stdint.h>

#define _NS_PER_SECO_ND 1000000000
#define INLINE __attribute__((__always_inline__)) inline
INLINE uint64_t nanoseconds(struct timespec t) {
    return t.tv_sec * _NS_PER_SECO_ND + t.tv_nsec;
}

int main() {
    uint8ptr_wrapped_ty c;
    uint8ptr_wrapped_ty m;

    c.len = 163;
    c.buf = (uint8_t *)malloc(c.len * sizeof(uint8_t));

    m.len = 163;
    m.buf = (uint8_t *)malloc(m.len * sizeof(uint8_t));

    uint8_t nonce[24];
    uint8_t data[32];

    // API requires first 32 bytes to be 0
    memset(m.buf, 0, 32);

    read(0, m.buf + 32, (m.len - 32) * sizeof(uint8_t));
    read(0, nonce, sizeof nonce);
    read(0, data, sizeof data);

    // Mark input as secret for ct_grind check:
    ct_secret(c.buf, sizeof(uint8_t) * c.len);
    ct_secret(m.buf, sizeof(uint8_t) * m.len);
    ct_secret(data, sizeof data);

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

    bool r1 = __crypto_secretbox(&c, &m, nonce, data);
    bool r2 = __crypto_secretbox_open(&m, &c, nonce, data);

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("\nTime: %ld\n", delta);
#endif

    /* printf("%d -- %d\n", r1, r2); */
    write(1, &r1, sizeof(bool));
    write(1, &r2, sizeof(bool));

    return 0;
}
