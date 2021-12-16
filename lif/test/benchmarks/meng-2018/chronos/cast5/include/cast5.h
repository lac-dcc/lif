#ifndef CAST5_H
#define CAST5_H

#include <stdint.h>

#define CAST5_BLOCK_SIZE 8
#define CAST5_MIN_KEY_SIZE 5
#define CAST5_MAX_KEY_SIZE 16

struct cast5_ctx {
    uint32_t Km[16];
    uint8_t Kr[16];
    int rr; /* rr?number of rounds = 16:number of rounds = 12; (rfc 2144) */
};

int cast5_setkey(uint8_t *key, struct cast5_ctx *c, unsigned key_len);
void cast5_encrypt(struct cast5_ctx *c, uint8_t *outbuf, const uint8_t *inbuf,
                   int rr);
#endif
