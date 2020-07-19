#include "../include/des.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[24] __attribute__((aligned(64))) = {
        143, 225, 19,  59,  80,  227, 84,  7,   51,  170, 246, 189,
        170, 76,  126, 106, 188, 145, 239, 185, 250, 241, 255, 126};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};

    des_ctx ctx;
    des_setkey(in_key, ctx);
    des_ecb_crypt(ctx, in, out, MODE_ENC);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
