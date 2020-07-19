#include "../include/cast.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {93,  74,  26,  198, 16, 113, 137, 114, 117, 40,  48,
                          223, 125, 189, 247, 90, 89,  116, 159, 149, 232, 237,
                          228, 249, 141, 169, 7,  179, 124, 95,  75,  155};
    uint8_t in[64] = {0x00};
    CAST_KEY key;
    uint64_t *data = (uint64_t *)in;

    CAST_set_key(in_key, &key, 16);
    CAST_encrypt(&key, data);

    for (size_t i = 0; i < 64; i++) printf("%d ", in[i]);
    printf("\n");

    return 0;
}
