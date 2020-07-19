#include "../include/anubis.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {32, 77, 87, 72, 21, 48, 43, 55, 34, 50, 17,
                          67, 2,  15, 30, 21, 3,  85, 98, 98, 97, 98,
                          31, 65, 75, 86, 16, 15, 8,  80, 21, 32};

    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0x00};
    struct anubis_ctx ctx = {0};

    anubis_setkey(in_key, &ctx, 24);
    anubis_crypt(ctx.E, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
