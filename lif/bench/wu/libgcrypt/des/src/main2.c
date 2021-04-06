#include "../include/des.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[24] __attribute__((aligned(64))) = {
        0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};

    des_ctx ctx;
    des_setkey(in_key, ctx);
    des_ecb_crypt(ctx, in, out, MODE_ENC);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
