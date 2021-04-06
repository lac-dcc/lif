#include "../include/comp.h"
#include <stdio.h>

int main() {
    int32_t a[_N], b[_N];
    for (size_t i = 0; i < _N; i++) a[i] = b[i] = i;
    int32_t r = comp(a, b);
    printf("%d\n", r);
    r = comp2(a, b);
    printf("%d\n", r);
    r = comp3(a, b);
    printf("%d\n", r);
    return 0;
}
