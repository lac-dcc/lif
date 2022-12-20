#ifndef SSL3_H
#define SSL3_H

#include "../../include/fact.h"
#include <stdint.h>

// We annotate the indices of the arguments whose types we don't want
// lif to wrap (because they're already wrapped).
__attribute__((annotate("nowrap:0,1,2,3")))
int32_t __ssl3_cbc_digest_record(
    uint8ptr_wrapped_ty *md_state, uint8ptr_wrapped_ty *mac_out,
    // ~~~
    uint8ptr_wrapped_ty *header, uint8ptr_wrapped_ty *data,
    // `data_plus_mac_plus_padding_size` is len data
    uint64_t data_plus_mac_size
);

#endif
