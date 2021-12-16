#include "../include/des.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int main() {
    uint8_t in_key[32];
    uint8_t in[64];

    for (int i = 0; i < 32; i++) scanf("%" SCNu8, &in_key[i]);
    for (int i = 0; i < 64; i++) scanf("%" SCNu8, &in[i]);

    struct des_ctx ctx;

    uint8_t out[64] = {0};
    des_ekey(in_key, ctx.expkey);
    des_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
