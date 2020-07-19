#include "../include/comp.h"
#include <stdio.h>

int main() {
    int32_t a[4], b[4];
    for (size_t i = 0; i < 4; i++) a[i] = b[i] = i;
    b[3] = -1;
    int32_t r = comp(a, b);
    printf("%d\n", r);
    return 0;
}
