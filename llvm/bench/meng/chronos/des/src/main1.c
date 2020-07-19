#include "../include/des.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {158, 129, 54,  187, 32, 114, 26, 16,  82,  145, 246,
                          49,  17,  87,  72,  11, 124, 64, 2,   177, 44,  54,
                          235, 162, 241, 9,   69, 100, 36, 208, 166, 211};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};

    struct des_ctx ctx;

    des_ekey(in_key, ctx.expkey);
    des_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
