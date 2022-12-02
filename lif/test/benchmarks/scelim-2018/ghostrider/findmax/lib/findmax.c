#include "../include/findmax.h"

#define CHECK_INST_COUNT 1 // ADDED TO CHECK OP INVARIANCE
#ifdef CHECK_INST_COUNT // ADDED TO CHECK OP INVARIANCE
volatile int foo = 0;
#endif

#ifdef ENABLE_UNROLL
int max(int h[]) {
#else
int max(int n, int h[]) {
#endif
    int i = 0;
    int m = 0;
#ifdef ENABLE_UNROLL
    while (i < INPUT_SIZE) {
#else
    while (i < n) {
#endif
        if (h[i] > m) m = h[i];
        i++;
    }
    return m;
}
