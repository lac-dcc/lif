#include "../include/3way.h"

/* inverts the order of the bits of a */
void mu(word32 *a)  {
    int i;
    word32 b[3];
    b[0] = b[1] = b[2] = 0;
    for( i=0; i<32; i++ ) {
        b[0] <<= 1; b[1] <<= 1; b[2] <<= 1;
        if(a[0]&1) b[2] |= 1;
        if(a[1]&1) b[1] |= 1;
        if(a[2]&1) b[0] |= 1;
        a[0] >>= 1; a[1] >>= 1; a[2] >>= 1;
    }
    a[0] = b[0]; a[1] = b[1]; a[2] = b[2];
}

/* the nonlinear step */
void gamma_(word32 *a) {
    word32 b[3];
    b[0] = a[0] ^ (a[1]|(~a[2]));
    b[1] = a[1] ^ (a[2]|(~a[0]));
    b[2] = a[2] ^ (a[0]|(~a[1]));
    a[0] = b[0]; a[1] = b[1]; a[2] = b[2];
}

/* the linear step */
void theta(word32 *a) {
    word32 b[3];
    b[0] = a[0] ^ (a[0]>>16) ^ (a[1]<<16) ^ (a[1]>>16) ^ (a[2]<<16) ^
     (a[1]>>24) ^ (a[2]<<8) ^ (a[2]>>8) ^ (a[0]<<24) ^
     (a[2]>>16) ^ (a[0]<<16) ^ (a[2]>>24) ^ (a[0]<<8);
    b[1] = a[1] ^ (a[1]>>16) ^ (a[2]<<16) ^ (a[2]>>16) ^ (a[0]<<16) ^
     (a[2]>>24) ^ (a[0]<<8) ^ (a[0]>>8) ^ (a[1]<<24) ^
     (a[0]>>16) ^ (a[1]<<16) ^ (a[0]>>24) ^ (a[1]<<8);
    b[2] = a[2] ^ (a[2]>>16) ^ (a[0]<<16) ^ (a[0]>>16) ^ (a[1]<<16) ^
     (a[0]>>24) ^ (a[1]<<8) ^ (a[1]>>8) ^ (a[2]<<24) ^
     (a[1]>>16) ^ (a[2]<<16) ^ (a[1]>>24) ^ (a[2]<<8);
    a[0] = b[0]; a[1] = b[1]; a[2] = b[2];
}

void pi_1(word32 *a) {
    a[0] = (a[0]>>10) ^ (a[0]<<22);
    a[2] = (a[2]<<1) ^ (a[2]>>31);
}

void pi_2(word32 *a) {
    a[0] = (a[0]<<1) ^ (a[0]>>31);
    a[2] = (a[2]>>10) ^ (a[2]<<22);
}

/* the round function */
void rho(word32 *a) {
    theta(a);
    pi_1(a);
    gamma_(a);
    pi_2(a);
}

/* generates the round constants */
void rndcon_gen(word32 strt,word32 *rtab) {
    int i;
    for(i=0; i<=NMBR; i++ ) {
        rtab[i] = strt;
        strt <<= 1;
        if( strt&0x10000 ) strt ^= 0x11011;
    }
}

/* Modified slightly to fit the caller’s needs. */
void encrypt(twy_ctx *c, word32 *a) {
    char i;
    for( i=0; i<NMBR; i++ ) {
        a[0] ^= c->k[0] ^ (c->ercon[i]<<16);
        a[1] ^= c->k[1];
        a[2] ^= c->k[2] ^ c->ercon[i];
        rho(a);
    }
    a[0] ^= c->k[0] ^ (c->ercon[NMBR]<<16);
    a[1] ^= c->k[1];
    a[2] ^= c->k[2] ^ c->ercon[NMBR];
    theta(a);
}

/* Modified slightly to meet caller’s needs. */
void decrypt(twy_ctx *c, word32 *a) {
    char i;
    mu(a);
    for( i=0; i<NMBR; i++ ) {
        a[0] ^= c->ki[0] ^ (c->drcon[i]<<16);
        a[1] ^= c->ki[1];
        a[2] ^= c->ki[2] ^ c->drcon[i];
        rho(a);
    }
    a[0] ^= c->ki[0] ^ (c->drcon[NMBR]<<16);
    a[1] ^= c->ki[1];
    a[2] ^= c->ki[2] ^ c->drcon[NMBR];
    theta(a);
    mu(a);
}

void twy_key(twy_ctx *c, u4 *key) {
    c->ki[0] = c->k[0] = key[0];
    c->ki[1] = c->k[1] = key[1];
    c->ki[2] = c->k[2] = key[2];
    theta(c->ki);
    mu(c->ki);
    rndcon_gen(STRT_E,c->ercon);
    rndcon_gen(STRT_D,c->drcon);
}

/* Encrypt in ECB mode. */
void twy_enc(twy_ctx *c, u4 *data, int blkcnt) {
    u4 *d;
    int i;
    d = data;

    // =============== begin :: Isochronous pass ================ //
    // Currently we cannot support loops without unrolling, so we
    // set the loop limit to 3 (see main).
    // ================= end :: Isochronous pass ================ //
    /* for(i=0;i<blkcnt;i++) { */
    for (i = 0; i < 3; i++) {
        if (i < blkcnt) {
            encrypt(c,d);
            d +=3;
        }   
    }
}

/* Decrypt in ECB mode. */
void twy_dec(twy_ctx *c, u4 *data, int blkcnt) {
    u4 *d;
    int i;
    d = data;

    // =============== begin :: Isochronous pass ================ //
    // Currently we cannot support loops without unrolling, so we
    // set the loop limit to 3 (see main).
    // ================= end :: Isochronous pass ================ //
    /* for(i=0;i<blkcnt;i++){ */
    for (i = 0; i < 3; i++) {
        if (i < blkcnt) {
            decrypt(c,d);
            d+=3;
        }   
    }
}

/* Scrub sensitive values from memory before deallocating. */
void twy_destroy(twy_ctx *c) {
    int i;
    for(i=0;i<3;i++) c->k[i] = c->ki[i] = 0;
}
