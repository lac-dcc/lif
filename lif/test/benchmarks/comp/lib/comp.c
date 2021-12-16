#include "../include/comp.h"

int comp(S *a, int32_t *b, int n) {
    for (int i = 0; i < n; i++)
        if (a->p[i] != b[i]) return 0;
    return 1;
}
