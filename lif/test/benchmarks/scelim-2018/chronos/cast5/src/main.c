#include "../include/cast5.h"
#include "../../../../include/taint.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>

int main() {
    secret uint8_t in_key[32];
    secret uint8_t in[64];

    /* for (int i = 0; i < 32; i++) scanf("%" SCNu8, &in_key[i]); */
    /* for (int i = 0; i < 64; i++) scanf("%" SCNu8, &in[i]); */

    // Read like Constantine:
    read(0, in_key, sizeof(uint8_t) * 32);
    read(0, in, sizeof(uint8_t) * 64);

    // Mark input as secret for ct_grind check:
    ct_secret(in_key, sizeof(uint8_t) * 32);
    ct_secret(in, sizeof(uint8_t) * 64);

    struct cast5_ctx ctx;

    uint8_t out[64] = {0};
    cast5_setkey(in_key, &ctx, 16);
    cast5_encrypt(&ctx, out, in, ctx.rr);

    /* for (size_t i = 0; i < 64; i++) printf("%d ", out[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, out, sizeof(uint8_t) * 64);

    return 0;
}
