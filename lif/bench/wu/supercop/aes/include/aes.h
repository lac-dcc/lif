#ifndef AES_H
#define AES_H

#include <stdint.h>

struct aes_key_st {
    uint32_t rd_key[60];
    int rounds;
};
typedef struct aes_key_st AES_KEY;

int AES_set_encrypt_key(const unsigned char *userKey, const int bits,
                        AES_KEY *key);
void AES_encrypt(const unsigned char *in, unsigned char *out,
                 const AES_KEY *key);
#endif
