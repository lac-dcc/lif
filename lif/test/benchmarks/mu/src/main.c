#include "../include/mu.h"
#include <stdio.h>

int main() {
    int32_t a[3];
    for (int i = 0; i < 3; i++) scanf("%d", &a[i]);
    printf("%d\n", 1);
    mu(a);
    printf("%d\t%d\t%d\n", a[0], a[1], a[2]);
}
