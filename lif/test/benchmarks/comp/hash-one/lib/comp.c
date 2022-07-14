#include "../include/comp.h"

#ifdef ENABLE_UNROLL
int comp(int *a, int *b) {
#else
int comp(int *a, int *b, int n) {
#endif
    int ha = 1;
    int hb = 1;

#ifdef ENABLE_UNROLL
    for (int i = 0; i < N; i++) {
#else
    for (int i = 0; i < n; i++) {
#endif
        if (a[i]) ha = (ha * a[i]) % HASH_SIZE;
        else ha++;
    }

#ifdef ENABLE_UNROLL
    for (int i = 0; i < N; i++) {
#else
    for (int i = 0; i < n; i++) {
#endif
        if (b[i]) hb = (hb * b[i]) % HASH_SIZE;
        else hb++;
    }

    if (ha == hb) return 1;
    else return 0;
}
