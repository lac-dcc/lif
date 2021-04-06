#include "../include/khazad.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {101, 70,  47,  14,  122, 80,  183, 67,  206, 210, 246,
                          249, 112, 240, 153, 113, 13,  37,  224, 87,  170, 209,
                          24,  101, 113, 215, 176, 107, 252, 40,  116, 124};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0x00};

    struct khazad_ctx ctx;

    khazad_setkey(in_key, &ctx, 16);
    khazad_crypt(ctx.E, out, in);

    for (size_t i = 0; i < 32; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
