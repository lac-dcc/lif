#include "../include/fcrypt.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {106, 139, 57, 242, 5,   13,  124, 149, 252, 59,  194,
                          98,  165, 48, 191, 40,  221, 2,   119, 113, 100, 238,
                          122, 54,  46, 137, 193, 175, 230, 116, 196, 110};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0x00};

    struct fcrypt_ctx ctx;

    fcrypt_setkey(in_key, &ctx, 8);
    fcrypt_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 32; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
