#ifndef ANUBIS_H
#define ANUBIS_H

#include <stdint.h>

#define ANUBIS_MIN_KEY_SIZE 16
#define ANUBIS_MAX_KEY_SIZE 40
#define ANUBIS_BLOCK_SIZE 16
#define ANUBIS_MAX_N 10
#define ANUBIS_MAX_ROUNDS (8 + ANUBIS_MAX_N)
#define CRYPTO_TFM_REQ_WEAK_KEY 0x00000100
#define CRYPTO_TFM_REQ_MAY_SLEEP 0x00000200
#define CRYPTO_TFM_REQ_MAY_BACKLOG 0x00000400
#define CRYPTO_TFM_RES_WEAK_KEY 0x00100000
#define CRYPTO_TFM_RES_BAD_KEY_LEN 0x00200000
#define CRYPTO_TFM_RES_BAD_KEY_SCHED 0x00400000
#define CRYPTO_TFM_RES_BAD_BLOCK_LEN 0x00800000
#define CRYPTO_TFM_RES_BAD_FLAGS 0x01000000

struct anubis_ctx {
    int key_len; // in bits
    int R;
    uint32_t E[ANUBIS_MAX_ROUNDS + 1][4];
    uint32_t D[ANUBIS_MAX_ROUNDS + 1][4];
};

int anubis_setkey(const uint8_t *in_key, struct anubis_ctx *ctx,
                  unsigned int key_len);
void anubis_crypt(uint32_t roundKey[ANUBIS_MAX_ROUNDS + 1][4],
                  uint8_t *ciphertext, const uint8_t *plaintext);
#endif
