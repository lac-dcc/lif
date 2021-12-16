#include "../include/anubis.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int main() {
    uint8_t in_key[32];
    uint8_t in[64];

    for (int i = 0; i < 32; i++) scanf("%" SCNu8, &in_key[i]);
    for (int i = 0; i < 64; i++) scanf("%" SCNu8, &in[i]);

    struct anubis_ctx ctx = {0};

    uint8_t out[64] = {0x00};
    anubis_setkey(in_key, &ctx, 24);
    anubis_crypt(ctx.E, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
