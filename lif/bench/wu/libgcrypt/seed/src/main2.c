#include "../include/seed.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
    uint8_t in_key[16] __attribute__((aligned(64))) = {0, 1, 0, 0, 0, 0, 0, 0,
                                                       0, 0, 0, 0, 0, 0, 0, 0};
    uint8_t in[16] = {0x83, 0xA2, 0xF8, 0xA2, 0x88, 0x64, 0x1F, 0xB9,
                      0xA4, 0xE9, 0xA5, 0xCC, 0x2F, 0x13, 0x1C, 0x7D};
    uint8_t out[16] = {0};
    SEED_context ctx;
    do_setkey(in_key, &ctx, 16);
    do_encrypt(&ctx, out, in);

    for (size_t i = 0; i < 16; i++) printf("%d ", out[i]);
    printf("\n");

    return 0;
}
