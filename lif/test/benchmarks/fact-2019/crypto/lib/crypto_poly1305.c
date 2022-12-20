#include "../include/crypto_poly1305.h"
#include "../include/_stdlib.h"

#include <assert.h>
#include <stdlib.h>
#include <sodium.h>

void _poly1305_blocks(
    poly1305_state_internal_t *state, // MUTABLE
    uint8ptr_wrapped_ty *m // SECRET (buffer)
) {
    secret uint8_t *m_buf = m->buf;

    // ========== FaCT code starts here ==========
    uint64_t mask44 = 0xfffffffffff;
    uint64_t mask42 = 0x3ffffffffff;

    secret uint64_t hibit = (state->final != 0) ? 0 : (((uint64_t)1) << 40);

    secret uint64_t r0 = state->r[0];
    secret uint64_t r1 = state->r[1];
    secret uint64_t r2 = state->r[2];

    secret uint64_t h0 = state->h[0];
    secret uint64_t h1 = state->h[1];
    secret uint64_t h2 = state->h[2];

    secret uint64_t s1 = r1 * (5 << 2);
    secret uint64_t s2 = r2 * (5 << 2);

    uint64_t mloops = m->len / 16;
    for (uint64_t bindex = 0; bindex < mloops; bindex++) {
        secret uint64_t t0 = load64_le(m_buf + bindex * 16);
        secret uint64_t t1 = load64_le(m_buf + bindex * 16 + 8);

        /* h += m[i] */
        // this is clearly some sort of odd-bit add-with-carry
        h0 += ((t0)&mask44);
        h1 += (((t0 >> 44) | (t1 << 20)) & mask44);
        h2 += (((t1 >> 24)) & mask42) | hibit;

        /* h *= r */
        secret __uint128_t d0 = (((__uint128_t)h0) * r0) +
                                (((__uint128_t)h1) * s2) +
                                (((__uint128_t)h2) * s1);

        secret __uint128_t d1 = (((__uint128_t)h0) * r1) +
                                (((__uint128_t)h1) * r0) +
                                (((__uint128_t)h2) * s2);

        secret __uint128_t d2 = (((__uint128_t)h0) * r2) +
                                (((__uint128_t)h1) * r1) +
                                (((__uint128_t)h2) * r0);

        /* (partial) h %= p */
        secret uint64_t c = (uint64_t)(d0 >> 44);
        h0 = ((uint64_t)(d0)) & mask44;
        d1 += c;
        c = (uint64_t)(d1 >> 44);
        h1 = ((uint64_t)(d1)) & mask44;
        d2 += c;
        c = (uint64_t)(d2 >> 42);
        h2 = ((uint64_t)(d2)) & mask42;
        h0 += c * 5;
        c = (uint64_t)(h0 >> 44);
        h0 &= mask44;
        h1 += c;
    }

    state->h[0] = h0;
    state->h[1] = h1;
    state->h[2] = h2;
}

void _poly1305_init(
    poly1305_state_internal_t *state, // MUTABLE
    secret uint8_t key[32]
) {
    // ========== FaCT code starts here ==========
    /* r &= 0xffffffc0ffffffc0ffffffc0fffffff */
    secret uint64_t t0 = load64_le(key);
    secret uint64_t t1 = load64_le(key + 8);

    /* wiped after finalization */
    state->r[0] = (t0)&0xffc0fffffff;
    state->r[1] = ((t0 >> 44) | (t1 << 20)) & 0xfffffc0ffff;
    state->r[2] = ((t1 >> 24)) & 0x00ffffffc0f;

    /* h = 0 */
    state->h[0] = 0;
    state->h[1] = 0;
    state->h[2] = 0;

    /* save pad for later */
    state->pad[0] = load64_le(key + 16);
    state->pad[1] = load64_le(key + 24);

    state->leftover = 0;
    state->final = 0;
}

void _poly1305_update(
    poly1305_state_internal_t *state, // MUTABLE
    uint8ptr_wrapped_ty *m // SECRET (buffer)
) {
    secret uint8_t *m_buf = m->buf;
    // < 16, length of buffer field
    uint64_t len_state_buffer =
        sizeof(state->buffer) / sizeof(state->buffer[0]);

    // ========== FaCT code starts here ==========
    uint64_t mindex = 0;

    /* handle leftover */
    if (state->leftover != 0) {
        uint64_t want = 16 - state->leftover;
        if (want > m->len) {
            want = m->len;
        }

        for (uint64_t i = 0; i < want; i++) {
            uint64_t index = state->leftover + i;
            assert(index < len_state_buffer);
            assert(i < m->len);
            state->buffer[index] = m_buf[i];
        }

        mindex += want;
        state->leftover += want;

        if (state->leftover < 16) {
            return;
        }

        uint8ptr_wrapped_ty w_state_buffer;

        w_state_buffer.len = len_state_buffer;
        w_state_buffer.buf =
            (uint8_t *)malloc(w_state_buffer.len * sizeof(uint8_t));

        _poly1305_blocks(state, &w_state_buffer);
        state->leftover = 0;

        // NOTE: the implementation of free is not constant-time.
        /* free(w_state_buffer.buf); */
        /* w_state_buffer.buf = NULL; */
    }

    /* process full blocks */
    if (m->len - mindex >= 16) {
        uint64_t want = ((m->len - mindex) & ~((uint64_t)(16 - 1))); // XXX wat

        uint64_t _mindex = mindex;
        assert(_mindex < _mindex + want);
        assert(_mindex + want <= m->len);

        uint8ptr_wrapped_ty w_view_m;

        w_view_m.len = want;
        w_view_m.buf = (uint8_t *)malloc(w_view_m.len * sizeof(uint8_t));

        view(w_view_m.buf, m_buf, _mindex, want);
        _poly1305_blocks(state, &w_view_m);

        // NOTE: the implementation of free is not constant-time.
        /* free(w_view_m.buf); */
        /* w_view_m.buf = NULL; */

        mindex += want;
    }

    /* store leftover */
    if (mindex < m->len) {
        uint64_t remaining = m->len - mindex;
        for (uint64_t i = 0; i < remaining; i++) {
            uint64_t _leftover = state->leftover;
            uint64_t _mindex = mindex;
            assert(_leftover + i < len_state_buffer);
            assert(_mindex + i < m->len);
            state->buffer[_leftover + i] = m_buf[_mindex + i];
        }
        state->leftover += remaining;
    }
}

void _poly1305_finish(
    poly1305_state_internal_t *state, // MUTABLE
    secret uint8_t mac[16]
) {
    // length of buffer field
    uint64_t len_state_buffer =
        sizeof(state->buffer) / sizeof(state->buffer[0]);

    // ========== FaCT code starts here ==========
    /* process the remaining block */
    if (state->leftover != 0) {
        uint64_t start = state->leftover;
        assert(start < len_state_buffer);
        state->buffer[start] = 1;
        for (uint64_t i = start + 1; i < 16; i++) {
            state->buffer[i] = 0;
        }
        state->final = 1;

        uint8ptr_wrapped_ty w_state_buffer;

        w_state_buffer.len = len_state_buffer;
        w_state_buffer.buf =
            (uint8_t *)malloc(w_state_buffer.len * sizeof(uint8_t));

        _poly1305_blocks(state, &w_state_buffer);

        // NOTE: the implementation of free is not constant-time.
        /* free(w_state_buffer.buf); */
        /* w_state_buffer.buf = NULL; */
    }

    uint64_t mask44 = 0xfffffffffff;
    uint64_t mask42 = 0x3ffffffffff;

    /* fully carry h */
    secret uint64_t h0 = state->h[0];
    secret uint64_t h1 = state->h[1];
    secret uint64_t h2 = state->h[2];

    secret uint64_t c = h1 >> 44;
    h1 &= mask44;
    h2 += c;
    c = h2 >> 42;
    h2 &= mask42;
    h0 += c * 5;
    c = h0 >> 44;
    h0 &= mask44;
    h1 += c;
    c = h1 >> 44;
    h1 &= mask44;
    h2 += c;
    c = h2 >> 42;
    h2 &= mask42;
    h0 += c * 5;
    c = h0 >> 44;
    h0 &= mask44;
    h1 += c;

    /* compute h + -p */
    secret uint64_t g0 = h0 + 5;
    c = g0 >> 44;
    g0 &= mask44;
    secret uint64_t g1 = h1 + c;
    c = g1 >> 44;
    g1 &= mask44;
    secret uint64_t g2 = h2 + c - (((uint64_t)1) << 42);

    /* select h if h < p, or h + -p if h >= p */
    c = (g2 >> ((8 * 8) - 1)) - 1;
    g0 &= c;
    g1 &= c;
    g2 &= c;
    c = ~c;
    h0 = (h0 & c) | g0;
    h1 = (h1 & c) | g1;
    h2 = (h2 & c) | g2;

    /* h = (h + pad) */
    secret uint64_t t0 = state->pad[0];
    secret uint64_t t1 = state->pad[1];

    h0 += t0 & mask44;
    c = h0 >> 44;
    h0 &= mask44;
    h1 += (((t0 >> 44) | (t1 << 20)) & mask44) + c;
    c = h1 >> 44;
    h1 &= mask44;
    h2 += (((t1 >> 24)) & mask42) + c;
    h2 &= mask42;

    /* mac = h % (2^128) */
    h0 = (h0 | (h1 << 44));
    h1 = ((h1 >> 20) | (h2 << 24));

    store64_le(mac, h0);
    store64_le(mac + 8, h1);

    sodium_memzero(state, sizeof (*state));
}

int32_t _crypto_onetimeauth_poly1305( // crypto_onetimeauth_poly1305_donna from poly1305_donna.c
    secret uint8_t out[16], // MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    secret uint8_t key[32]
) {
    // ========== FaCT code starts here ==========
    poly1305_state_internal_t state = {
        .r = {0, 0, 0},
        .h = {0, 0, 0},
        .pad = {0, 0},
        .leftover = 0,
        .buffer = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        .final = 0
    };

    _poly1305_init(&state, key);
    _poly1305_update(&state, m);
    _poly1305_finish(&state, out);

    return 0;
}

bool _crypto_onetimeauth_poly1305_verify( // crypto_onetimeauth_poly1305_donna_verify from poly1305.c
    uint8_t h[16],
    uint8ptr_wrapped_ty *input,
    secret uint8_t k[32]
) {
    // ========== FaCT code starts here ==========
    secret uint8_t correct[16] = {0};
    _crypto_onetimeauth_poly1305(correct, input, k);

    // FaCT adds a declassify: is there anything we can do to emulate?
    return _crypto_verify_16(h, correct);
}
