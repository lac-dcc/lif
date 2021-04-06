#ifndef FCRYPT_H
#define FCRYPT_H

#include <stdint.h>

#define ROUNDS 16
#define BITS_PER_LONG 32
struct fcrypt_ctx {
    uint32_t sched[ROUNDS];
};

int fcrypt_setkey(const uint8_t *key, struct fcrypt_ctx *ctx,
                  unsigned int keylen);
void fcrypt_encrypt(struct fcrypt_ctx *ctx, uint8_t *dst, const uint8_t *src);

#endif
