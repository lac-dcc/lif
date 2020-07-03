#include "comp.h"
#include <stdio.h>

int main() {
    int32_t a[N], b[N];
    for (size_t i = 0; i < N; i++) a[i] = b[i] = i;
    int32_t r = comp(a, b);
    printf("%d\n", r);
    return 0;
}
