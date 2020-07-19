#ifndef SEED_H
#define SEED_H

#include <stdint.h>

typedef struct {
    uint32_t keyschedule[32];
} SEED_context;

int do_setkey(const uint8_t *key, SEED_context *ctx, const unsigned keylen);
void do_encrypt(const SEED_context *ctx, uint8_t *outbuf, const uint8_t *inbuf);

#endif
