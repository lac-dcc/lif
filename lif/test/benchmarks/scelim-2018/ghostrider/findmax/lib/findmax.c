#include "../include/findmax.h"

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
