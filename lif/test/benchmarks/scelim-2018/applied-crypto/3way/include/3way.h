#ifndef _3WAY_H
#define _3WAY_H

#include <stdint.h>

#define STRT_E 0x0b0b /* round constant of first encryption round */
#define STRT_D 0xb1b1 /* round constant of first decryption round */
#define NMBR 11       /* number of rounds is 11 */

typedef struct {
    int32_t k[3], ki[3], ercon[NMBR + 1], drcon[NMBR + 1];
} twy_ctx;
/* Note: encrypt and decrypt expect full blocks--padding blocks is
caller’s responsibility. All bulk encryption is done in
ECB mode by these calls. Other modes may be added easily
enough. */
/* destroy: Context. */
/* Scrub context of all sensitive data. */
void twy_destroy(twy_ctx *);
/* encrypt: Context, ptr to data block, # of blocks. */
void twy_enc(twy_ctx *, int32_t *, int);
/* decrypt: Context, ptr to data block, # of blocks. */
void twy_dec(twy_ctx *, int32_t *, int);
/* key: Context, ptr to key data. */
void twy_key(int32_t *, twy_ctx *);
/* ACCODE----------------------------------------------------------- */
/* End of AC code prototypes and structures. */
/* ----------------------------------------------------------------- */

void encrypt(twy_ctx *c, int32_t *a);
void decrypt(twy_ctx *c, int32_t *a);

#endif
