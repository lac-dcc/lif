#include "../include/histogram.h"

#define CHECK_INST_COUNT 1 // ADDED TO CHECK OP INVARIANCE
#ifdef CHECK_INST_COUNT // ADDED TO CHECK OP INVARIANCE
#include <stdio.h>

#define ENABLE_CTGRIND 1
#include "../../../../include/taint.h"
#endif

void histogram(int a[], int c[]) {
    int i;
    int t, v;

    for (i = 0; i < INPUT_SIZE; i++) c[i] = 0;

    for (i = 0; i < INPUT_SIZE; i++) {
        v = a[i];

#ifdef CHECK_INST_COUNT // ADDED TO CHECK OP INVARIANCE
        int foo = 0;
#endif

        if (v > 0) {
#ifdef CHECK_INST_COUNT // ADDED TO CHECK OP INVARIANCE
            foo++;
#endif
            t = v % INPUT_SIZE;
        } else {
            t = (0 - v) % INPUT_SIZE;
        }

#ifdef CHECK_INST_COUNT // ADDED TO CHECK OP INVARIANCE
        // Mark foo as public to eliminate false positives due
        // to non constant-time implementation of printf.
        ct_public(&foo, sizeof(int));
        printf("%d\n", foo);
#endif

        c[t] = c[t] + 1;
    }
}
