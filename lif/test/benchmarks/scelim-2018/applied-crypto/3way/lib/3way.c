#include "../include/3way.h"

void mu(int32_t *a) /* inverts the order of the bits of a */
{
    int i;
    int32_t b[3];
    b[0] = b[1] = b[2] = 0;
    for (i = 0; i < 32; i++) {
        b[0] <<= 1;
        b[1] <<= 1;
        b[2] <<= 1;
        if (a[0] & 1) b[2] |= 1;
        if (a[1] & 1) b[1] |= 1;
        if (a[2] & 1) b[0] |= 1;
        a[0] >>= 1;
        a[1] >>= 1;
        a[2] >>= 1;
    }
    a[0] = b[0];
    a[1] = b[1];
    a[2] = b[2];
}

void gamma(int32_t *a) /* the nonlinear step */
{
    int32_t b[3];
    b[0] = a[0] ^ (a[1] | (~a[2]));
    b[1] = a[1] ^ (a[2] | (~a[0]));
    b[2] = a[2] ^ (a[0] | (~a[1]));
    a[0] = b[0];
    a[1] = b[1];
    a[2] = b[2];
}

void theta(int32_t *a) /* the linear step */
{
    int32_t b[3];
    b[0] = a[0] ^ (a[0] >> 16) ^ (a[1] << 16) ^ (a[1] >> 16) ^ (a[2] << 16) ^
           (a[1] >> 24) ^ (a[2] << 8) ^ (a[2] >> 8) ^ (a[0] << 24) ^
           (a[2] >> 16) ^ (a[0] << 16) ^ (a[2] >> 24) ^ (a[0] << 8);
    b[1] = a[1] ^ (a[1] >> 16) ^ (a[2] << 16) ^ (a[2] >> 16) ^ (a[0] << 16) ^
           (a[2] >> 24) ^ (a[0] << 8) ^ (a[0] >> 8) ^ (a[1] << 24) ^
           (a[0] >> 16) ^ (a[1] << 16) ^ (a[0] >> 24) ^ (a[1] << 8);
    b[2] = a[2] ^ (a[2] >> 16) ^ (a[0] << 16) ^ (a[0] >> 16) ^ (a[1] << 16) ^
           (a[0] >> 24) ^ (a[1] << 8) ^ (a[1] >> 8) ^ (a[2] << 24) ^
           (a[1] >> 16) ^ (a[2] << 16) ^ (a[1] >> 24) ^ (a[2] << 8);
    a[0] = b[0];
    a[1] = b[1];
    a[2] = b[2];
}

void pi_1(int32_t *a) {
    a[0] = (a[0] >> 10) ^ (a[0] << 22);
    a[2] = (a[2] << 1) ^ (a[2] >> 31);
}

void pi_2(int32_t *a) {
    a[0] = (a[0] << 1) ^ (a[0] >> 31);
    a[2] = (a[2] >> 10) ^ (a[2] << 22);
}

void rho(int32_t *a) /* the round function */
{
    theta(a);
    pi_1(a);
    gamma(a);
    pi_2(a);
}

void rndcon_gen(int32_t strt,
                int32_t *rtab) { /* generates the round constants */
    int i;
    for (i = 0; i <= NMBR; i++) {
        rtab[i] = strt;
        strt <<= 1;
        if (strt & 0x10000) strt ^= 0x11011;
    }
}

/* Modified slightly to fit the caller’s needs. */
void encrypt(twy_ctx *c, int32_t *a) {
    int i;
    for (i = 0; i < NMBR; i++) {
        a[0] ^= c->k[0] ^ (c->ercon[i] << 16);
        a[1] ^= c->k[1];
        a[2] ^= c->k[2] ^ c->ercon[i];
        rho(a);
    }

    a[0] ^= c->k[0] ^ (c->ercon[NMBR] << 16);
    a[1] ^= c->k[1];
    a[2] ^= c->k[2] ^ c->ercon[NMBR];
    theta(a);
}

/* Modified slightly to meet caller’s needs. */
/* void decrypt(twy_ctx *c, int32_t *a) { */
/*     int i; */
/*     mu(a); */

/*     for (i = 0; i < NMBR; i++) { */
/*         a[0] ^= c->ki[0] ^ (c->drcon[i] << 16); */
/*         a[1] ^= c->ki[1]; */
/*         a[2] ^= c->ki[2] ^ c->drcon[i]; */
/*         rho(a); */
/*     } */

/*     a[0] ^= c->ki[0] ^ (c->drcon[NMBR] << 16); */
/*     a[1] ^= c->ki[1]; */
/*     a[2] ^= c->ki[2] ^ c->drcon[NMBR]; */
/*     theta(a); */
/*     mu(a); */
/* } */

void twy_key(int32_t *key, twy_ctx *c) {
    c->ki[0] = c->k[0] = key[0];
    c->ki[1] = c->k[1] = key[1];
    c->ki[2] = c->k[2] = key[2];
    theta(c->ki);
    mu(c->ki);
    rndcon_gen(STRT_E, c->ercon);
    rndcon_gen(STRT_D, c->drcon);
}

/* Encrypt in ECB mode. */
/* void twy_enc(twy_ctx *c, int32_t *data, int blkcnt) { */
/*     int32_t *d; */
/*     int i; */
/*     d = data; */
/*     for (i = 0; i < blkcnt; i++) { */
/*         encrypt(c, d); */
/*         d += 3; */
/*     } */
/* } */

/* Decrypt in ECB mode. */
/* void twy_dec(twy_ctx *c, int32_t *data, int blkcnt) { */
/*     int32_t *d; */
/*     int i; */
/*     d = data; */
/*     for (i = 0; i < blkcnt; i++) { */
/*         decrypt(c, d); */
/*         d += 3; */
/*     } */
/* } */

/* Scrub sensitive values from memory before deallocating. */
/* void twy_destroy(twy_ctx *c) { */
/*     int i; */
/*     for (i = 0; i < 3; i++) c->k[i] = c->ki[i] = 0; */
/* } */
