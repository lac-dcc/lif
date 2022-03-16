#include "../include/des.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <valgrind/memcheck.h>

#ifdef ENABLE_CTGRIND
#define ct_secret(addr, len) VALGRIND_MAKE_MEM_UNDEFINED(addr, len)
#else
#define ct_secret(addr, len)
#endif

int main() {
    __attribute__((annotate("secret"))) uint8_t in_key[32];
    __attribute__((annotate("secret"))) unsigned char in[8];

    /* for (int i = 0; i < 32; i++) { */
    /*     int x; */
    /*     scanf("%d", &x); */
    /*     in_key[i] = (uint8_t) x; */
    /* } */

    /* for (int i = 0; i < 8; i++) { */
    /*     int x; */
    /*     scanf("%x", &x); */
    /*     in[i] = (unsigned char) x; */
    /* } */

    // Read like Constantine:
    read(0, in_key, sizeof(uint8_t) * 32);
    read(0, in, sizeof(unsigned char) * 8);

    // Mark input as secret for ct_grind check:
    ct_secret(in_key, 3);
    ct_secret(in, 3);

    unsigned char out[8] = {0};

    des_ctx dc;
    unsigned long work[2] = {0};

    // des_key(&dc,key);
    deskey(in_key, EN0);
    cpkey(dc.ek);
    scrunch(in, work);
    desfunc(dc.ek, work);
    unscrun(work, out);

    /* for (size_t i = 0; i < 8; i++) printf("%d ", out[i]); */
    /* printf("\n"); */

    // Write like Constantine:
    write(1, out, sizeof(unsigned char) * 8);
}
