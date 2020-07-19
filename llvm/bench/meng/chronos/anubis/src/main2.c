#include "../include/anubis.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {10, 128, 84,  188, 121, 182, 82,  33,  19,  131, 60,
                          40, 128, 5,   52,  166, 153, 163, 23,  207, 154, 138,
                          76, 96,  204, 55,  124, 134, 88,  171, 83,  71};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0x00};

    struct anubis_ctx ctx = {0};

    anubis_setkey(in_key, &ctx, 24);
    anubis_crypt(ctx.E, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
