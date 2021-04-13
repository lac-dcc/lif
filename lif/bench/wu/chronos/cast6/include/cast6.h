#ifndef CAST6_H
#define CAST6_H

#include <stdint.h>

#define CAST6_BLOCK_SIZE 16
#define CAST6_MIN_KEY_SIZE 16
#define CAST6_MAX_KEY_SIZE 32
#define CRYPTO_TFM_RES_BAD_KEY_LEN 0x00200000

struct cast6_ctx {
    uint32_t Km[12][4];
    uint8_t Kr[12][4];
};

int cast6_setkey(struct cast6_ctx *c, const uint8_t *in_key, unsigned key_len);
void cast6_encrypt(struct cast6_ctx *c, uint8_t *outbuf, const uint8_t *inbuf);

#endif
