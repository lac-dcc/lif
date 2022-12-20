#ifndef CRYPTO_SECRETBOX_H_
#define CRYPTO_SECRETBOX_H_

#include "../../include/fact.h"
#include "../../../include/taint.h"

#include <stdint.h>
#include <stdbool.h>

void __crypto_core_hsalsa20(
    secret uint8_t out[32], // MUTABLE
    secret uint8_t input[16],
    secret uint8_t k[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0")))
int32_t __crypto_stream_xsalsa20(
    uint8ptr_wrapped_ty *c, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0,1")))
int32_t __crypto_stream_xsalsa20_xor_ic(
    uint8ptr_wrapped_ty *c, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    uint8_t n[24],
    uint64_t ic,
    secret uint8_t k[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0,1")))
int32_t __crypto_stream_xsalsa20_xor(
    uint8ptr_wrapped_ty *c, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0,1")))
bool __crypto_secretbox_xsalsa20poly1305(
    uint8ptr_wrapped_ty *c, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0,1")))
bool __crypto_secretbox_xsalsa20poly1305_open(
    uint8ptr_wrapped_ty *m, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *c, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0,1")))
bool __crypto_secretbox(
    uint8ptr_wrapped_ty *c, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0,1")))
bool __crypto_secretbox_open(
    uint8ptr_wrapped_ty *m, // SECRET (buffer), MUTABLE
    uint8ptr_wrapped_ty *c, // SECRET (buffer)
    uint8_t n[24],
    secret uint8_t k[32]
);

#endif
