#include "../include/lblock.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[24] = {
        106, 139, 57,  242, 5,   13, 124, 149, 252, 59,  194, 98,
        165, 48,  191, 40,  221, 2,  119, 113, 100, 238, 122, 54,
    };
    uint8_t in[64] = {0x00};

    uint8_t roundKeys[128];

    RunEncryptionKeySchedule(in_key, roundKeys);
    LBlock_encrypt(roundKeys, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", in[i]);
    printf("\n");

    return 0;
}
