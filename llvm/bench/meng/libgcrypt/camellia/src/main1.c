#include "../include/camellia.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[24] __attribute__((aligned(64))) = {
        230, 206, 204, 99,  222, 174, 15, 99,  194, 200, 123, 233,
        145, 84,  160, 149, 219, 114, 38, 185, 31,  54,  185, 40};

    uint32_t subkey[50] = {0};
    camellia_setup128(in_key, subkey);

    for (size_t i = 0; i < 24; i++) printf("%d ", in_key[i]);
    printf("\n");
    for (size_t i = 0; i < 50; i++) printf("%d ", subkey[i]);
    printf("\n");

    return 0;
}
