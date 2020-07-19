#include "../include/khazad.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {228, 159, 237, 87,  198, 37,  198, 191, 202, 77,  55,
                          65,  82,  28,  239, 108, 250, 35,  56,  26,  111, 244,
                          109, 44,  248, 2,   0,   61,  174, 120, 117, 166};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0x00};

    struct khazad_ctx ctx;

    khazad_setkey(in_key, &ctx, 16);
    khazad_crypt(ctx.E, out, in);

    for (size_t i = 0; i < 32; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
