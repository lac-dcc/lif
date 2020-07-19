#include "../include/cast.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[32] = {106, 139, 57,  242, 5,   13,  124, 149, 252, 59,  194,
                          98,  165, 48,  191, 40,  221, 2,   119, 113, 100, 238,
                          122, 54,  110, 174, 180, 130, 136, 5,   8};
    uint8_t in[64] = {0x00};
    CAST_KEY key;
    uint64_t *data = (uint64_t *)in;

    CAST_set_key(in_key, &key, 16);
    CAST_encrypt(&key, data);

    for (size_t i = 0; i < 64; i++) printf("%d ", in[i]);
    printf("\n");

    return 0;
}
