#include "../include/comp.h"

int comp(int *a, int *b, int n) {
    int ha = 1;
    int hb = 1;

    for (int i = 0; i < n; i++) {
        if (a[i]) ha = (ha * a[i]) % HASH_SIZE;
        else ha++;
    }

    for (int i = 0; i < n; i++) {
        if (b[i]) hb = (hb * b[i]) % HASH_SIZE;
        else hb++;
    }

    if (ha == hb) return 1;
    else return 0;
}
