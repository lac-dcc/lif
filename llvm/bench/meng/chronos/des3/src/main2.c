#include "../include/des3.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[24] = {32, 77, 87, 72, 21, 48, 43, 55, 34, 50, 17, 67,
                          3,  85, 98, 98, 97, 98, 31, 65, 75, 86, 16, 15};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};

    struct des3_ede_ctx ctx;

    des3_ede_setkey(in_key, &ctx, 24);
    des3_ede_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
