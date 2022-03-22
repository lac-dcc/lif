#include "../include/mu.h"
#include "../../include/taint.h"

#include <stdio.h>
#include <unistd.h>

int main() {
    secret int32_t a[3];

    /* for (int i = 0; i < 3; i++) scanf("%d", &a[i]); */

    // Read like Constantine:
    read(0, a, sizeof(int32_t) * 3);

    // Mark input as secret for ct_grind check:
    ct_secret(a, 3);

    mu(a);

    /* printf("%d\t%d\t%d\n", a[0], a[1], a[2]); */

    // Write like Constantine:
    write(1, a, sizeof(int32_t) * 3);
}
