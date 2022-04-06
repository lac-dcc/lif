#include "../include/findmax.h"
#include "../../../../include/taint.h"

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
    secret int in[INPUT_SIZE];

    for (int i = 0; i < INPUT_SIZE; i++)
        read(0, &in[i], sizeof(int));

    // Mark input as secret for ct_grind check:
    ct_secret(in, sizeof(int) * INPUT_SIZE);

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

#ifdef ENABLE_UNROLL
    int r = max(in);
#else
    int r = max(INPUT_SIZE, in);
#endif

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("\nTime: %ld\n", delta);
#endif

    write(1, &r, sizeof(int));
}
