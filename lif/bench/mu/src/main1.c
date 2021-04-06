#include "../include/mu.h"
#include <stdio.h>

int main() {
    int32_t a[3] = {0, 0, 0};
    mu(a);
    printf("%d\t%d\t%d\n", a[0], a[1], a[2]);
}
