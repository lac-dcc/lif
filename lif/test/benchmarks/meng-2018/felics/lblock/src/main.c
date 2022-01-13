#include "../include/lblock.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>

int main() {
    uint8_t in_key[24];
    uint8_t in[64];

    /* for (int i = 0; i < 24; i++) scanf("%" SCNu8, &in_key[i]); */
    /* for (int i = 0; i < 64; i++) scanf("%" SCNu8, &in[i]); */

    // Read like Constantine:
    read(0, in_key, sizeof(uint8_t) * 24);
    read(0, in, sizeof(uint8_t) * 64);

    uint8_t roundKeys[128];
    RunEncryptionKeySchedule(in_key, roundKeys);
    LBlock_encrypt(roundKeys, in);

    /* for (size_t i = 0; i < 64; i++) printf("%d ", in[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, in, sizeof(uint8_t) * 64);

    return 0;
}