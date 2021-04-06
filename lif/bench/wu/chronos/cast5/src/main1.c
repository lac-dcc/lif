#include "../include/cast5.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {106, 139, 57, 242, 5,   13,  124, 149, 252, 59,  194,
                          98,  165, 48, 191, 40,  221, 2,   119, 113, 100, 238,
                          122, 54,  46, 137, 193, 175, 230, 116, 196, 110};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};
    struct cast5_ctx ctx;

    cast5_setkey(in_key, &ctx, 16);
    cast5_encrypt(&ctx, out, in, ctx.rr);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
