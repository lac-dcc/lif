#ifndef SALSA20_H_
#define SALSA20_H_

#include "../../../include/taint.h"
#include "../../include/fact.h"

#include <stdint.h>

void _crypto_core_salsa20( // crypto_core_salsa in core_salsa_ref.c
    secret uint8_t output[64], // MUTABLE
    secret uint8_t input[16], 
    secret uint8_t k[32] 
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0")))
int32_t _crypto_stream_salsa20( // stream_ref in salsa20_ref.c
    uint8ptr_wrapped_ty *c, // MUTABLE, SECRET (buffer)
    uint8_t n[8],
    secret uint8_t k[32]
);

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0,1")))
int32_t _crypto_stream_salsa20_xor_ic( // stream_ref_xor_ic in salsa20_ref.c
    uint8ptr_wrapped_ty *c, // MUTABLE, SECRET (buffer)
    uint8ptr_wrapped_ty *m, // SECRET (buffer)
    secret uint8_t n[8],
    uint64_t ic_val,
    secret uint8_t k[32]
);

#endif // SALSA20_H_
