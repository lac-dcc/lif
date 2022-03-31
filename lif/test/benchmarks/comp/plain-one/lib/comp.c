#include "../include/comp.h"

#ifdef ENABLE_UNROLL
int comp(int *a, int *b) {
    // Unrollable version requires a loop with constant bound.
    for (int i = 0; i < N; i++)
#else
int comp(int *a, int *b, int n) {
    for (int i = 0; i < n; i++)
#endif
        if (a[i] != b[i]) return 0;
    return 1;
}
