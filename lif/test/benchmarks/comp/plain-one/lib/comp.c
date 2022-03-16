#include "../include/comp.h"

int comp(int *a, int *b, int n) {
    for (int i = 0; i < n; i++)
        if (a[i] != b[i]) return 0;
    return 1;
}
