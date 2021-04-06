#include "../include/piccolo.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[24] = {0xf8, 0x12, 0x7e, 0x00, 0x00, 0x00, 0x6c, 0x7e,
                          0x81, 0x93, 0xa5, 0xb7, 0xc9, 0xda, 0xec, 0xfe,
                          0x11, 0x32, 0x53, 0x74, 0x95, 0xb6, 0xd7, 0xf8};
    uint8_t in[64] = {0x00};

    uint8_t roundKeys[108];

    RunEncryptionKeySchedule(in_key, roundKeys);
    Piccolo_encrypt(roundKeys, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", in[i]);
    printf("\n");

    return 0;
}
