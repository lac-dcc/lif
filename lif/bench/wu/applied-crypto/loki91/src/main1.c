#include "../include/loki91.h"
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    unsigned char key[8] = {0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xe7};
    unsigned char data[24] = {6,   102, 118, 207, 176, 180, 235, 137,
                              2,   196, 66,  105, 218, 28,  246, 186,
                              102, 211, 248, 182, 212, 177, 0,   169};

    loki_ctx lc;
    setlokikey(key, &lc);
    enloki(&lc, data);
    for (size_t i = 0; i < 24; i++) printf("%d ", data[i]);
    printf("\n");
    return 0;
}
