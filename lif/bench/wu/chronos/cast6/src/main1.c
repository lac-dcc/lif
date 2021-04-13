#include "../include/cast6.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {171, 124, 26,  1,   28,  58,  37, 38,  73,  55, 169,
                          62,  45,  157, 243, 189, 83,  23, 66,  202, 85, 241,
                          186, 75,  82,  12,  163, 232, 58, 132, 235, 61};
    uint8_t in[16] = {0x00};
    uint8_t out[16] = {0};
    struct cast6_ctx ctx;

    cast6_setkey(&ctx, in_key, 32);
    cast6_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 32; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
