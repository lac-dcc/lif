#include "../include/des3.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[24] = {170, 189, 202, 248, 185, 48,  3,  81,
                          240, 81,  249, 222, 216, 96,  89, 207,
                          96,  74,  156, 52,  173, 112, 8,  152};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};

    struct des3_ede_ctx ctx;

    des3_ede_setkey(&ctx, in_key, 24);
    des3_ede_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
