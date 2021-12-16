#ifndef DES_H
#define DES_H

#include <stdint.h>

#define DES_KEY_SIZE 8
#define DES_EXPKEY_WORDS 32
#define DES_BLOCK_SIZE 8

#define DES3_EDE_KEY_SIZE (3 * DES_KEY_SIZE)
#define DES3_EDE_EXPKEY_WORDS (3 * DES_EXPKEY_WORDS)
#define DES3_EDE_BLOCK_SIZE DES_BLOCK_SIZE
#define CRYPTO_ALG_TESTED 0x00000400

/*
 * Transform masks and values (for crt_flags).
 */
#define CRYPTO_TFM_REQ_MASK 0x000fff00
#define CRYPTO_TFM_RES_MASK 0xfff00000

#define CRYPTO_TFM_REQ_WEAK_KEY 0x00000100
#define CRYPTO_TFM_REQ_MAY_SLEEP 0x00000200
#define CRYPTO_TFM_REQ_MAY_BACKLOG 0x00000400
#define CRYPTO_TFM_RES_WEAK_KEY 0x00100000
#define CRYPTO_TFM_RES_BAD_KEY_LEN 0x00200000
#define CRYPTO_TFM_RES_BAD_KEY_SCHED 0x00400000
#define CRYPTO_TFM_RES_BAD_BLOCK_LEN 0x00800000
#define CRYPTO_TFM_RES_BAD_FLAGS 0x01000000

struct des_ctx {
    uint32_t expkey[DES_EXPKEY_WORDS];
};

struct des3_ede_ctx {
    uint32_t expkey[DES3_EDE_EXPKEY_WORDS];
};

unsigned long des_ekey(const uint8_t *k, uint32_t *pe);
void des_encrypt(struct des_ctx *ctx, uint8_t *dst, const uint8_t *src);

#endif
