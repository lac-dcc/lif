#include "../include/cast6.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>

int main() {
    uint8_t in_key[32];
    uint8_t in[16];

    /* for (int i = 0; i < 32; i++) scanf("%" SCNu8, &in_key[i]); */
    /* for (int i = 0; i < 16; i++) scanf("%" SCNu8, &in[i]); */

    // Read like Constantine:
    read(0, in_key, sizeof(uint8_t) * 32);
    read(0, in, sizeof(uint8_t) * 16);

    struct cast6_ctx ctx;

    uint8_t out[16] = {0};
    cast6_setkey(&ctx, in_key, 32);
    cast6_encrypt(&ctx, out, in);

    /* for (size_t i = 0; i < 32; i++) printf("%d ", out[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, out, sizeof(uint8_t) * 16);

    return 0;
}
