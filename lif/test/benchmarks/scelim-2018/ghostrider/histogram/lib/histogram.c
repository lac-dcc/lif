#include "../include/histogram.h"

#define CHECK_INST_COUNT 1 // ADDED TO CHECK OP INVARIANCE
#ifdef CHECK_INST_COUNT // ADDED TO CHECK OP INVARIANCE
volatile int foo = 0;
#endif

void histogram(int a[], int c[]) {
    int i;
    int t, v;

    for (i = 0; i < INPUT_SIZE; i++) c[i] = 0;

    for (i = 0; i < INPUT_SIZE; i++) {
        v = a[i];

        if (v > 0) {
#ifdef CHECK_INST_COUNT // ADDED TO CHECK OP INVARIANCE
            foo++;
#endif
            t = v % INPUT_SIZE;
        } else {
            t = (0 - v) % INPUT_SIZE;
        }

        c[t] = c[t] + 1;
    }
}
