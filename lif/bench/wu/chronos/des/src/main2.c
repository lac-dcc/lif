#include "../include/des.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {0, 0, 0, 0,  0,  0,  0, 0, 0, 0, 2,  2, 2, 2, 3, 4,
                          1, 2, 3, 20, 43, 21, 2, 3, 4, 1, 32, 2, 3, 3, 2, 3};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};

    struct des_ctx ctx;

    des_ekey(in_key, ctx.expkey);
    des_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
