#include "../include/aes.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {106, 139, 57,  242, 5,   13,  124, 149, 252, 59,  194,
                          98,  165, 48,  191, 40,  221, 2,   119, 113, 100, 238,
                          122, 54,  110, 174, 180, 130, 136, 5,   8};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};
    AES_KEY e_key;
    AES_set_encrypt_key(in_key, 128, &e_key);
    AES_encrypt(in, out, &e_key);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
