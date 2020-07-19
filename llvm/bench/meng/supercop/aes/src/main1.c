#include "../include/aes.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {110, 174, 180, 139, 251, 244, 166, 152, 168, 193, 207,
                          255, 35,  74,  109, 110, 71,  11,  214, 13,  22,  184,
                          243, 25,  99,  81,  94,  130, 136, 124, 40,  47};
    uint8_t in[64] = {0x00};
    uint8_t out[64] = {0};
    AES_KEY e_key;
    AES_set_encrypt_key(in_key, 128, &e_key);
    AES_encrypt(in, out, &e_key);

    for (size_t i = 0; i < 64; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
