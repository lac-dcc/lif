#include "../include/mu.h"

void mu(int32_t *a) {
    int i;
    int32_t b[3];
    b[0] = b[1] = b[2] = 0;
    for (i = 0; i < 32; i++) {
        b[0] <<= 1;
        b[1] <<= 1;
        b[2] <<= 1;
        if (a[0] & 1) b[2] |= 1; // leak
        if (a[1] & 1) b[1] |= 1; // leak
        if (a[2] & 1) b[0] |= 1; // leak
        a[0] >>= 1;
        a[1] >>= 1;
        a[2] >>= 1;
    }
    a[0] = b[0];
    a[1] = b[1];
    a[2] = b[2];
}

