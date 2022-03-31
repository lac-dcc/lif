#include "../include/curve25519_c64.h"
#include "../../../include/taint.h"

#include <string.h>
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
    secret uint8_t data[32];
    read(0, data, 32);

    // Mark input as secret for ct_grind check:
    ct_secret(data, sizeof(uint8_t) * 32);

    uint8_t out[32] = {0};
    uint8_t ret = 0;

    uint8_t basepoint[32] = {9};

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

    curve25519_donna(out, data, basepoint);

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("Time: %ld\n", delta);
#endif

    memcpy(data, out, 32);
    ret ^= out[0];
    write(1, &ret, 1);
}
