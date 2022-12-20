#include "../include/salsa20.h"
#include "../../include/fact.h"
#include "../../../include/taint.h"

/**************************************************************************
 * Ported from:
 * github.com/PLSysSec/fact-eval/blob/master/crypto_secretbox/salsa20.fact
 **************************************************************************/
#include <assert.h>
#include <string.h>
#include <stdlib.h>
#include <sodium.h>

void _crypto_core_salsa20( // crypto_core_salsa in core_salsa_ref.c
    secret uint8_t output[64], // MUTABLE
    secret uint8_t input[16],
    secret uint8_t k[32]
) {
    secret uint32_t x0 = 0x61707865;
    secret uint32_t x5 = 0x3320646e;
    secret uint32_t x10 = 0x79622d32;
    secret uint32_t x15 = 0x6b206574;

    secret uint32_t j0 = x0;
    secret uint32_t j5 = x5;
    secret uint32_t j10 = x10;
    secret uint32_t j15 = x15;

    secret uint32_t x1 = load32_le(k);
    secret uint32_t x2 = load32_le(k + 4);
    secret uint32_t x3 = load32_le(k + 8);
    secret uint32_t x4 = load32_le(k + 12);

    secret uint32_t x11 = load32_le(k + 16);
    secret uint32_t x12 = load32_le(k + 20);
    secret uint32_t x13 = load32_le(k + 24);
    secret uint32_t x14 = load32_le(k + 28);

    secret uint32_t j1 = x1;
    secret uint32_t j2 = x2;
    secret uint32_t j3 = x3;
    secret uint32_t j4 = x4;
    secret uint32_t j11 = x11;
    secret uint32_t j12 = x12;
    secret uint32_t j13 = x13;
    secret uint32_t j14 = x14;

    secret uint32_t x6 = load32_le(input);
    secret uint32_t x7 = load32_le(input + 4);
    secret uint32_t x8 = load32_le(input + 8);
    secret uint32_t x9 = load32_le(input + 12);

    secret uint32_t j6 = x6;
    secret uint32_t j7 = x7;
    secret uint32_t j8 = x8;
    secret uint32_t j9 = x9;

    for (uint32_t i = 0; i < 10; i++) {
        x4  ^= rotl32(x0 + x12, 7);
        x8  ^= rotl32(x4 + x0, 9);
        x12 ^= rotl32(x8 + x4, 13);
        x0  ^= rotl32(x12 + x8, 18);
        x9  ^= rotl32(x5 + x1, 7);
        x13 ^= rotl32(x9 + x5, 9);
        x1  ^= rotl32(x13 + x9, 13);
        x5  ^= rotl32(x1 + x13, 18);
        x14 ^= rotl32(x10 + x6, 7);
        x2  ^= rotl32(x14 + x10, 9);
        x6  ^= rotl32(x2 + x14, 13);
        x10 ^= rotl32(x6 + x2, 18);
        x3  ^= rotl32(x15 + x11, 7);
        x7  ^= rotl32(x3 + x15, 9);
        x11 ^= rotl32(x7 + x3, 13);
        x15 ^= rotl32(x11 + x7, 18);
        x1  ^= rotl32(x0 + x3, 7);
        x2  ^= rotl32(x1 + x0, 9);
        x3  ^= rotl32(x2 + x1, 13);
        x0  ^= rotl32(x3 + x2, 18);
        x6  ^= rotl32(x5 + x4, 7);
        x7  ^= rotl32(x6 + x5, 9);
        x4  ^= rotl32(x7 + x6, 13);
        x5  ^= rotl32(x4 + x7, 18);
        x11 ^= rotl32(x10 + x9, 7);
        x8  ^= rotl32(x11 + x10, 9);
        x9  ^= rotl32(x8 + x11, 13);
        x10 ^= rotl32(x9 + x8, 18);
        x12 ^= rotl32(x15 + x14, 7);
        x13 ^= rotl32(x12 + x15, 9);
        x14 ^= rotl32(x13 + x12, 13);
        x15 ^= rotl32(x14 + x13, 18);
    }

    store32_le(output, x0 + j0);
    store32_le(output + 4, x1 + j1);
    store32_le(output + 8, x2 + j2);
    store32_le(output + 12, x3 + j3);
    store32_le(output + 16, x4 + j4);
    store32_le(output + 20, x5 + j5);
    store32_le(output + 24, x6 + j6);
    store32_le(output + 28, x7 + j7);
    store32_le(output + 32, x8 + j8);
    store32_le(output + 36, x9 + j9);
    store32_le(output + 40, x10 + j10);
    store32_le(output + 44, x11 + j11);
    store32_le(output + 48, x12 + j12);
    store32_le(output + 52, x13 + j13);
    store32_le(output + 56, x14 + j14);
    store32_le(output + 60, x15 + j15);
}

int32_t _crypto_stream_salsa20( // stream_ref in salsa20_ref.c
    uint8ptr_wrapped_ty *c, // MUTABLE, SECRET (buffer)
    uint8_t n[8],
    secret uint8_t k[32]
) {
    secret uint8_t *c_buf = c->buf;

    // ========== FaCT code starts here ==========
    secret uint8_t kcopy[32];
    memcpy(kcopy, k, 32);

    secret uint8_t input[16] = {0};
    for (uint32_t i = 0; i < 8; i++) {
        input[i] = n[i];
    }
    // input[8..15] = 0 already taken care of by zeros

    uint32_t ctimes = (uint32_t)c->len >> 6;
    for (uint32_t j = 0; j < ctimes; j++) {
        _crypto_core_salsa20(c_buf + j * 64, input, kcopy);
        secret uint32_t u = 1;
        for (uint32_t i = 8; i < 16; i++) {
            u += input[i];
            input[i] = (uint8_t)u;
            u >>= 8;
        }
    }

    secret uint8_t block[64] = {0};
    if (ctimes * 64 < c->len) {
        _crypto_core_salsa20(block, input, kcopy);
        uint32_t remain = (uint32_t)(c->len - ctimes * 64);
        for (uint32_t i = 0; i < remain; i++) {
            c_buf[i] = block[i];
        }
    }

    sodium_memzero(block, sizeof(block));
    sodium_memzero(kcopy, sizeof(kcopy));

    return 0; // ???
}

int32_t _crypto_stream_salsa20_xor_ic( // stream_ref_xor_ic in salsa20_ref.c
    uint8ptr_wrapped_ty *c, // MUTABLE, SECRET (buffer)
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    secret uint8_t n[8],
    uint64_t ic_val,
    secret uint8_t k[32]
) {
    // Lif will propagate secretness (taint analysis), but just to be sure:
    secret uint8_t *c_buf = c->buf;
    secret uint8_t *m_buf = m->buf;

    // ========== FaCT code starts here ==========
    assert(m->len == c->len);
    uint64_t ic = ic_val;

    secret uint8_t kcopy[32];
    memcpy(kcopy, k, 32);

    secret uint8_t input[16] = {0};
    for (uint32_t i = 0; i < 8; i++) {
        input[i] = n[i];
    }

    for (uint32_t i = 8; i < 16; i++) {
        input[i] = ic & (uint8_t)0xff;
        ic >>= 8;
    }

    uint64_t mtimes = m->len / 64;
    secret uint8_t block[64] = {0};

    for (uint64_t j = 0; j < mtimes; j++) {
        _crypto_core_salsa20(block, input, kcopy);
        for (uint32_t i = 0; i < 64; i++) {
            c_buf[i] = m_buf[i] ^ block[i];
        }

        secret uint32_t u = 1;
        for (uint32_t i = 8; i < 16; i++) {
            u += input[i];
            input[i] = (uint8_t)u;
            u >>= 8;
        }
    }

    if (mtimes * 64 < m->len) {
        uint64_t remain = m->len - mtimes * 64;
        _crypto_core_salsa20(block, input, kcopy);
        for (uint64_t i = 0; i < remain; i++) {
            c_buf[i] = m_buf[i] ^ block[i];
        }
    }

    sodium_memzero(block, sizeof block);
    sodium_memzero(kcopy, sizeof kcopy);

    memcpy(c->buf, c_buf, c->len * sizeof(uint8_t));
    return 0;
}
