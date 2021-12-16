#ifndef DES_H
#define DES_H

#include <stdint.h>

#define DES_BLOCKSIZE 8
#define GPG_ERR_NO_ERROR 0
#define GPG_ERR_WEAK_KEY 1
#define GPG_ERR_INV_KEYLEN 2

#define MODE_ENC 0
#define MODE_DEC 1

/*
 * Encryption/Decryption context of DES
 */
typedef struct _des_ctx {
    uint32_t encrypt_subkeys[32];
    uint32_t decrypt_subkeys[32];
} des_ctx[1];

int des_setkey(const uint8_t *key, struct _des_ctx *ctx);
int des_ecb_crypt(struct _des_ctx *ctx, const uint8_t *from, uint8_t *to,
                  int mode);

#endif
