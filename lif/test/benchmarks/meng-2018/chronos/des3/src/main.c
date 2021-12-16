#include "../include/des3.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int main() {
    uint8_t in_key[24];
    uint8_t in[64];

    for (int i = 0; i < 24; i++) scanf("%" SCNu8, &in_key[i]);
    for (int i = 0; i < 64; i++) scanf("%" SCNu8, &in[i]);

    struct des3_ede_ctx ctx;

    uint8_t out[64] = {0};
    des3_ede_setkey(&ctx, in_key, 24);
    des3_ede_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
