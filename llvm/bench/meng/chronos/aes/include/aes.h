#ifndef AES_H
#define AES_H

#include <stdint.h>

#define AES_MIN_KEY_SIZE 16
#define AES_MAX_KEY_SIZE 32
#define AES_BLOCK_SIZE 16

/*
 * Pleaseensure that the first two fields are 16-byte aligned
 * relative to the start of the structure, i.e., don't move them!
 */
struct crypto_aes_ctx {
    uint32_t key_enc[60];
    uint32_t key_dec[60];
    uint32_t key_length;
};

int crypto_aes_expand_key(const uint8_t *in_key, struct crypto_aes_ctx *ctx,
                          unsigned int key_len);

void aes_encrypt(struct crypto_aes_ctx *ctx, uint8_t *out, const uint8_t *in,
                 const int key_len);

#endif
