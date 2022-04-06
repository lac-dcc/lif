#include "../include/histogram.h"

void histogram(int a[], int c[]) {
    int i;
    int t, v;

    for (i = 0; i < INPUT_SIZE; i++) c[i] = 0;

    for (i = 0; i < INPUT_SIZE; i++) {
        v = a[i];

        if (v > 0)
            t = v % INPUT_SIZE;
        else
            t = (0 - v) % INPUT_SIZE;

        c[t] = c[t] + 1;
    }
}
