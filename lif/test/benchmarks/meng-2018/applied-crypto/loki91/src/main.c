#include "../include/loki91.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
    unsigned char in[8];
    unsigned char in_key[24];

    /* for (int i = 0; i < 8; i++) { */
    /*     int x; */
    /*     scanf("%x", &x); */
    /*     key[i] = (uint8_t) x; */
    /* } */

    /* for (int i = 0; i < 24; i++) { */
    /*     int x; */
    /*     scanf("%d", &x); */
    /*     data[i] = (unsigned char) x; */
    /* } */

    // Read like Constantine:
    read(0, in, sizeof(unsigned char) * 8);
    read(0, in_key, sizeof(unsigned char) * 24);

    loki_ctx lc;
    setlokikey(in_key, &lc);
    enloki(&lc, in);

    /* for (size_t i = 0; i < 24; i++) printf("%d ", data[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, in, sizeof(unsigned char) * 8);
    return 0;
}
