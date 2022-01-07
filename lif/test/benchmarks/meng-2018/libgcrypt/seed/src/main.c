#include "../include/seed.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>

int main() {
    uint8_t in_key[16];
    uint8_t in[16];

    /* for (int i = 0; i < 24; i++) scanf("%" SCNx8, &in_key[i]); */
    /* for (int i = 0; i < 64; i++) scanf("%" SCNx8, &in[i]); */

    // Read like Constantine:
    read(0, in_key, sizeof(uint8_t) * 16);
    read(0, in, sizeof(uint8_t) * 16);

    uint8_t out[16] = {0};
    SEED_context ctx;
    do_setkey(in_key, &ctx, 16);
    do_encrypt(&ctx, out, in);

    /* for (size_t i = 0; i < 16; i++) printf("%d ", out[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, out, sizeof(uint8_t) * 16);

    return 0;
}
