#include "../include/aes.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {0, 0, 0, 0,  0,  0,  0, 0, 0, 0, 2,  2, 2, 2, 3, 4,
                          1, 2, 3, 20, 43, 21, 2, 3, 4, 1, 32, 2, 3, 3, 2, 3};
    uint8_t in[64] = {0};
    uint8_t out[64] = {0};

    struct crypto_aes_ctx ctx;

    crypto_aes_expand_key(in_key, &ctx, 24);
    aes_encrypt(&ctx, out, in, 24);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
