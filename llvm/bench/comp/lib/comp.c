#include "../include/comp.h"

int comp(int *a, int *b) {
    for (int i = 0; i < _N; i++)
        if (a[i] != b[i]) return 0;
    return 1;
}

