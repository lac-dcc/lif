#ifndef CAST_H
#define CAST_H

#include <stdint.h>

typedef struct cast_key_st {
    uint64_t data[32];
    int short_key; /* Use reduced rounds for short key */
} CAST_KEY;

void CAST_set_key(const unsigned char *data, CAST_KEY *key, int len);

void CAST_encrypt(const CAST_KEY *key, uint64_t *data);

#endif
