#include "../include/aes.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {65,  225, 3,   70, 133, 247, 232, 184, 124, 97, 113,
                          130, 29,  219, 56, 131, 46,  15,  76,  42,  84, 44,
                          7,   240, 75,  74, 7,   149, 208, 0,   232, 112};
    uint8_t in[64] = {0};
    uint8_t out[64] = {0};

    struct crypto_aes_ctx ctx;

    crypto_aes_expand_key(in_key, &ctx, 24);
    aes_encrypt(&ctx, out, in, 24);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
