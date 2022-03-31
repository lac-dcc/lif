#include "../include/dijkstra.h"

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

int x;
int main() {
    read(0, &x, sizeof(int));
    x -= (unsigned char) x;

    // Mark input as secret for ct_grind check:
    ct_secret(x, sizeof(int));

    // Graph edges (distance):
    secret int in[INPUT_SIZE][INPUT_SIZE];

    for (int i = 0; i < INPUT_SIZE; i++) {
        for (int j = 0; j < INPUT_SIZE; j++) {
            // Constantine will taint this, due to "read", so let's just
            // consider log as secret too...
            read(0, &in[i][j], sizeof(int));
        }
    }

    // Mark input as secret for ct_grind check:
    ct_secret(&x, sizeof(int));
    ct_secret(in, INPUT_SIZE * INPUT_SIZE * sizeof(int));

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

    int r = dijkstra(INPUT_SIZE, 0, INPUT_SIZE - 1, in);

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("Time: %ld\n", delta);
#endif

    write(1, &r, sizeof(int));
}
