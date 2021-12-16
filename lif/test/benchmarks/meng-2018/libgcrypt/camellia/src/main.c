#include "../include/camellia.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

int main() {
    uint8_t in_key[24] __attribute__((aligned(64)));
    for (int i = 0; i < 24; i++) scanf("%" SCNu8, &in_key[i]);

    uint32_t subkey[50] = {0};
    camellia_setup128(in_key, subkey);

    for (size_t i = 0; i < 24; i++) printf("%d ", in_key[i]);
    printf("\n");
    for (size_t i = 0; i < 50; i++) printf("%d ", subkey[i]);
    printf("\n");

    return 0;
}
