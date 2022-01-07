#include "../include/des.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>

int main() {
    uint8_t in_key[24] __attribute__((aligned(64)));
    uint8_t in[64] = {0x00};

    /* for (int i = 0; i < 24; i++) scanf("%" SCNu8, &in_key[i]); */
    /* for (int i = 0; i < 64; i++) scanf("%" SCNu8, &in[i]); */

    // Read like Constantine:
    read(0, in_key, sizeof(uint8_t) * 24);
    read(0, in, sizeof(uint8_t) * 64);

    uint8_t out[64] = {0};
    des_ctx ctx;

    des_setkey(in_key, ctx);
    des_ecb_crypt(ctx, in, out, MODE_ENC);

    /* for (size_t i = 0; i < 64; i++) printf("%d ", out[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, out, sizeof(uint8_t) * 64);

    return 0;
}
