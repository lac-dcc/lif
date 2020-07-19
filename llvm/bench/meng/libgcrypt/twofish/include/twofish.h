#ifndef TWOFISH_H
#define TWOFISH_H

#include <stdint.h>

/* Structure for an expanded Twofish key.  s contains the key-dependent
 * S-boxes composed with the MDS matrix; w contains the eight "whiening"
 * subkeys, K[0] through K[7].	k holds the remaining, "round" subkeys.  Note
 * that k[i] corresponds to what the Twofish paper calls K[i+8]. */
typedef struct {
    uint32_t s[4][256], w[8], k[32];

#ifdef USE_AVX2
    int use_avx2;
#endif
} TWOFISH_context;

int do_twofish_setkey(const uint8_t *key, TWOFISH_context *ctx,
                      const unsigned keylen);
void do_twofish_encrypt(const TWOFISH_context *ctx, uint8_t *out,
                        const uint8_t *in);

#endif
