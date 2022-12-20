#ifndef CRYPTO_POLY1305_H_
#define CRYPTO_POLY1305_H_

#include "../../include/fact.h"
#include "../../../include/taint.h"

#include <stdint.h>
#include <stdbool.h>

// using 64-bit implementation (poly1305_donna64.h)
// #define poly1305_block_size 16
typedef struct poly1305_state_internal_t {
    secret uint64_t r[3];
    secret uint64_t h[3];
    secret uint64_t pad[2];
    uint64_t leftover;
    secret uint8_t buffer[16]; // poly1305_block_size
    secret uint8_t final;
} poly1305_state_internal_t;

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:1")))
void _poly1305_blocks(
    poly1305_state_internal_t *state, // MUTABLE
    uint8ptr_wrapped_ty *m // SECRET (buffer)
);

void _poly1305_init(
    poly1305_state_internal_t *state, // MUTABLE
    secret uint8_t key[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:1")))
void _poly1305_update(
    poly1305_state_internal_t *state, // MUTABLE
    uint8ptr_wrapped_ty *m // SECRET (buffer)
);

void _poly1305_finish(
    poly1305_state_internal_t *state, // MUTABLE
    secret uint8_t mac[16]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:1")))
int32_t _crypto_onetimeauth_poly1305( // crypto_onetimeauth_poly1305_donna from poly1305_donna.c
    secret uint8_t out[16], // MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    secret uint8_t key[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:1")))
bool _crypto_onetimeauth_poly1305_verify( // crypto_onetimeauth_poly1305_donna_verify from poly1305.c
    uint8_t h[16],
    uint8ptr_wrapped_ty *input,
    secret uint8_t k[32]
);

#endif // CRYPTO_POLY1305_H_
