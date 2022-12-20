#include "../include/crypto_secretbox.h"
#include "../include/salsa20.h"
#include "../include/crypto_poly1305.h"
#include "../../include/fact.h"
#include "../../../include/taint.h"

/**
 * Port from FaCT implementation:
 * https://github.com/PLSysSec/fact-eval/blob/master/openssl-ssl3/s3_cbc.fact
 */


#include <assert.h>
#include <sodium/utils.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <sodium.h>


// NOTE: the original function has an additional parameter
// `const unsigned char *c`, but the secretbox code passes
// NULL in for this parameter so I'm just not using it
void __crypto_core_hsalsa20(
    secret uint8_t out[32], // MUTABLE
    secret uint8_t input[16],
    secret uint8_t k[32]
) {
    // ========== FaCT code starts here ==========
    uint32_t x0 = 0x61707865;
    uint32_t x5 = 0x3320646e;
    uint32_t x10 = 0x79622d32;
    uint32_t x15 = 0x6b206574;

    uint32_t x1 = load32_le(k);
    uint32_t x2 = load32_le(k + 4);
    uint32_t x3 = load32_le(k + 8);
    uint32_t x4 = load32_le(k + 12);
    uint32_t x11 = load32_le(k + 16);
    uint32_t x12 = load32_le(k + 20);
    uint32_t x13 = load32_le(k + 24);
    uint32_t x14 = load32_le(k + 28);
    uint32_t x6 = load32_le(input);
    uint32_t x7 = load32_le(input + 4);
    uint32_t x8 = load32_le(input + 8);
    uint32_t x9 = load32_le(input + 12);

    for (uint32_t i = 0; i < 10; ++i) {
        x4  ^= (x0  + x12) <<  7 ;
        x8  ^= (x4  + x0 ) <<  9 ;
        x12 ^= (x8  + x4 ) <<  13;
        x0  ^= (x12 + x8 ) <<  18;
        x9  ^= (x5  + x1 ) <<  7 ;
        x13 ^= (x9  + x5 ) <<  9 ;
        x1  ^= (x13 + x9 ) <<  13;
        x5  ^= (x1  + x13) <<  18;
        x14 ^= (x10 + x6 ) <<  7 ;
        x2  ^= (x14 + x10) <<  9 ;
        x6  ^= (x2  + x14) <<  13;
        x10 ^= (x6  + x2 ) <<  18;
        x3  ^= (x15 + x11) <<  7 ;
        x7  ^= (x3  + x15) <<  9 ;
        x11 ^= (x7  + x3 ) <<  13;
        x15 ^= (x11 + x7 ) <<  18;
        x1  ^= (x0  + x3 ) <<  7 ;
        x2  ^= (x1  + x0 ) <<  9 ;
        x3  ^= (x2  + x1 ) <<  13;
        x0  ^= (x3  + x2 ) <<  18;
        x6  ^= (x5  + x4 ) <<  7 ;
        x7  ^= (x6  + x5 ) <<  9 ;
        x4  ^= (x7  + x6 ) <<  13;
        x5  ^= (x4  + x7 ) <<  18;
        x11 ^= (x10 + x9 ) <<  7 ;
        x8  ^= (x11 + x10) <<  9 ;
        x9  ^= (x8  + x11) <<  13;
        x10 ^= (x9  + x8 ) <<  18;
        x12 ^= (x15 + x14) <<  7 ;
        x13 ^= (x12 + x15) <<  9 ;
        x14 ^= (x13 + x12) <<  13;
        x15 ^= (x14 + x13) <<  18;
    }

    store32_le(out, x0);
    store32_le(out + 4, x5);
    store32_le(out + 8, x10);
    store32_le(out + 12, x15);
    store32_le(out + 16, x6);
    store32_le(out + 20, x7);
    store32_le(out + 24, x8);
    store32_le(out + 28, x9);
}

int32_t __crypto_stream_xsalsa20(
    uint8ptr_wrapped_ty *c, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
) {
    // ========== FaCT code starts here ==========
  uint8_t subkey[32] = {0};

  // view(n, 0, 16)
  __crypto_core_hsalsa20(subkey, n, k);

  // view(n, 16, 8)
  int32_t ret = _crypto_stream_salsa20(c, n + 16, subkey);

  sodium_memzero(subkey, sizeof subkey);
  return ret;
}

int32_t __crypto_stream_xsalsa20_xor_ic(
    uint8ptr_wrapped_ty *c, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    uint8_t n[24],
    uint64_t ic,
    secret uint8_t k[32]
) {
    // ========== FaCT code starts here ==========
    uint8_t subkey[32] = {0};

    // view(n, 0, 16)
    __crypto_core_hsalsa20(subkey, n, k);
    /* uint8ptr_wrapped_ty* tmp = view(n, 16, 8); */

    // view(n, 16, 8)
    int32_t ret = _crypto_stream_salsa20_xor_ic(c, m, n + 16, ic, subkey);

    sodium_memzero(subkey, sizeof subkey);
    return ret;
}

int32_t __crypto_stream_xsalsa20_xor(
    uint8ptr_wrapped_ty *c, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
) {
    // ========== FaCT code starts here ==========
    return __crypto_stream_xsalsa20_xor_ic(c, m, n, 0, k);
}

bool __crypto_secretbox_xsalsa20poly1305(
    uint8ptr_wrapped_ty *c, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
) {
    secret uint8_t *c_buf = c->buf;
    // ========== FaCT code starts here ==========
    if (m->len < 32) {
        return false;
    }

    assert(c->len == m->len);
    __crypto_stream_xsalsa20_xor(c, m, n, k);

    secret uint8_t cview[16];
    view(cview, c_buf, 16, 16);

    uint8ptr_wrapped_ty w_mview;
    w_mview.len = c->len - 32;
    w_mview.buf = (uint8_t *)malloc(w_mview.len * sizeof(uint8_t));
    view(w_mview.buf, c_buf, 32, c->len - 32); // yes this is c and not m

    secret uint8_t kview[32];
    view(kview, c_buf, 0, 32); // yes this is c and not m

    _crypto_onetimeauth_poly1305(cview, &w_mview, kview);

    // NOTE: the implementation of free is not constant-time.
    /* free(w_mview.buf); */
    /* w_mview.buf = NULL; */

    // ADDED:
    memcpy(c->buf + 16, cview, 16);

    for (uint64_t i = 0; i < 16; ++i) {
        c->buf[i] = 0;
    }

    return true;
}

bool __crypto_secretbox_xsalsa20poly1305_open(
    uint8ptr_wrapped_ty *m, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *c, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
) {
    secret uint8_t *c_buf = c->buf;
    // ========== FaCT code starts here ==========
    if (m->len < 32) {
        return false;
    }

    assert(c->len == m->len);

    uint8ptr_wrapped_ty w_subkey;
    w_subkey.len = 32;
    w_subkey.buf = (uint8_t *)calloc(w_subkey.len, sizeof(uint8_t));
    __crypto_stream_xsalsa20(&w_subkey, n, k);

    secret uint8_t subkey[32];
    memcpy(subkey, w_subkey.buf, 32);

    uint8_t tmp1[16];
    view(tmp1, c_buf, 16, 16);

    uint8ptr_wrapped_ty w_cview;
    w_cview.len = c->len -  32;
    w_cview.buf = (uint8_t *)malloc(w_cview.len * sizeof(uint8_t));
    view(w_cview.buf, c->buf, 32, w_cview.len);

    if (!_crypto_onetimeauth_poly1305_verify(tmp1, &w_cview, subkey)) {
        // NOTE: the implementation of free is not constant-time.
        /* free(w_cview.buf); */
        /* w_cview.buf = NULL; */
        return false;
    }

    // NOTE: the implementation of free is not constant-time.
    /* free(w_cview.buf); */
    /* w_cview.buf = NULL; */

    __crypto_stream_xsalsa20_xor(m, c, n, k);

    for (uint32_t i = 0; i < 32; ++i) {
        m->buf[i] = 0;
    }

    return true;
}

bool __crypto_secretbox(
    uint8ptr_wrapped_ty *c, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
) {
    // ========== FaCT code starts here ==========
    return __crypto_secretbox_xsalsa20poly1305(c, m, n, k);
}

bool __crypto_secretbox_open(
    uint8ptr_wrapped_ty *m, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *c, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
)  {
    // ========== FaCT code starts here ==========
    return __crypto_secretbox_xsalsa20poly1305_open(m, c, n, k);
}
