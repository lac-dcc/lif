#include "../include/camellia.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[24] __attribute__((aligned(64))) = {
        106, 139, 57,  242, 5,   13, 124, 149, 252, 59,  194, 98,
        165, 48,  191, 40,  221, 2,  119, 113, 100, 238, 122, 54,
    };

    uint32_t subkey[50] = {0};
    camellia_setup128(in_key, subkey);

    for (size_t i = 0; i < 24; i++) printf("%d ", in_key[i]);
    printf("\n");
    for (size_t i = 0; i < 50; i++) printf("%d ", subkey[i]);
    printf("\n");

    return 0;
}
