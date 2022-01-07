#include "../include/cast.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>

int main() {
    uint8_t in_key[32];
    uint8_t in[64];

    /* for (int i = 0; i < 32; i++) scanf("%" SCNu8, &in_key[i]); */
    /* for (int i = 0; i < 64; i++) scanf("%" SCNu8, &in[i]); */

    // Read like Constantine:
    read(0, in_key, sizeof(uint8_t) * 32);
    read(0, in, sizeof(uint8_t) * 64);

    CAST_KEY key;
    uint64_t *data = (uint64_t *)in;

    CAST_set_key(in_key, &key, 16);
    CAST_encrypt(&key, data);

    /* for (size_t i = 0; i < 64; i++) printf("%d ", in[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, in, sizeof(uint8_t) * 64);

    return 0;
}
