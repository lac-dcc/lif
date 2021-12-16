#include "../include/loki91.h"
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    unsigned char key[8];
    unsigned char data[24];

    for (int i = 0; i < 8; i++) {
        int x;
        scanf("%x", &x);
        key[i] = (uint8_t) x;
    }

    for (int i = 0; i < 24; i++) {
        int x;
        scanf("%d", &x);
        data[i] = (unsigned char) x;
    }

    loki_ctx lc;
    setlokikey(key, &lc);
    enloki(&lc, data);
    for (size_t i = 0; i < 24; i++) printf("%d ", data[i]);
    printf("\n");
    return 0;
}
