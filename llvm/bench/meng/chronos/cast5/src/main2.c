#include "../include/cast5.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1,
                          1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};

    struct cast5_ctx ctx;

    cast5_setkey(in_key, &ctx, 16);
    cast5_encrypt(&ctx, out, in, ctx.rr);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
