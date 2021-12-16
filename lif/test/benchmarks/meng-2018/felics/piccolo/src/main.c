#include "../include/piccolo.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int main() {
    uint8_t in_key[24];
    uint8_t in[64];

    for (int i = 0; i < 24; i++) scanf("%" SCNu8, &in_key[i]);
    for (int i = 0; i < 64; i++) scanf("%" SCNu8, &in[i]);

    uint8_t roundKeys[108];
    RunEncryptionKeySchedule(in_key, roundKeys);
    Piccolo_encrypt(roundKeys, in);

    for (size_t i = 0; i < 64; i++) printf("%d ", in[i]);
    printf("\n");

    return 0;
}
