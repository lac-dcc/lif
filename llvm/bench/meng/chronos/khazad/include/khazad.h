#ifndef KHAZAD_H
#define KHAZAD_H

#include <stdint.h>

#define KHAZAD_KEY_SIZE 16
#define KHAZAD_BLOCK_SIZE 8
#define KHAZAD_ROUNDS 8

struct khazad_ctx {
    uint64_t E[KHAZAD_ROUNDS + 1];
    uint64_t D[KHAZAD_ROUNDS + 1];
};

int khazad_setkey(const uint8_t *in_key, struct khazad_ctx *ctx,
                  unsigned int key_len);
void khazad_crypt(const uint64_t roundKey[KHAZAD_ROUNDS + 1],
                  uint8_t *ciphertext, const uint8_t *plaintext);

#endif
