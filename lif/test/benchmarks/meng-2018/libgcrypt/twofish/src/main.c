#include "../include/twofish.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int main() {
    uint8_t in_key[16];
    uint8_t in[16];

    for (int i = 0; i < 24; i++) scanf("%" SCNx8, &in_key[i]);
    for (int i = 0; i < 64; i++) scanf("%" SCNx8, &in[i]);

    uint8_t out[16] = {0};
    TWOFISH_context ctx;
    do_twofish_setkey(in_key, &ctx, 16);
    do_twofish_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 16; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
