#include "../include/ssl3.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <openssl/sha.h>
#include <valgrind/memcheck.h>

#ifdef ENABLE_CTGRIND
#define ct_secret(addr, len) VALGRIND_MAKE_MEM_UNDEFINED(addr, len)
#else
#define ct_secret(addr, len)
#endif

int main() {
   uint8ptr_wrapped_ty md_state;
   uint8ptr_wrapped_ty mac_out;
   uint8ptr_wrapped_ty header;
   uint8ptr_wrapped_ty data;

   size_t mac_secret_length = 20;
   size_t sslv3_pad_length = 40;

   md_state.len = sizeof(SHA_CTX);
   mac_out.len = 20;
   header.len = mac_secret_length + sslv3_pad_length
        + 8 /* sequence number */
        + 1 /* record type */
        + 2 /* record length */;
   data.len = 128;

   // All of these buffers are secret, but we mark them as secret inside
   // function __ssl3_cbc_digest_record as a workaround for Lif's
   // taint analysis' overapproximation; otherwise, the entire struct would
   // be considered as tainted, including the length field.
   md_state.buf = (uint8_t *) malloc(md_state.len * sizeof(uint8_t));
   mac_out.buf = (uint8_t *) malloc(mac_out.len * sizeof(uint8_t));
   header.buf = (uint8_t *) malloc(header.len * sizeof(uint8_t));
   data.buf = (uint8_t *) malloc(data.len * sizeof(uint8_t));

   secret uint64_t data_plus_mac_size = data.len - data.buf[127];

   SHA1_Init((SHA_CTX *) md_state.buf);

   read(0, header.buf, header.len * sizeof(uint8_t));
   read(0, data.buf, data.len * sizeof(uint8_t));

    // Mark input as secret for ct_grind check:
    ct_secret(md_state.buf, md_state.len);
    ct_secret(mac_out.buf, mac_out.len);
    ct_secret(header.buf, header.len);
    ct_secret(data.buf, data.len);
    ct_secret(&data_plus_mac_size, 1);

   __ssl3_cbc_digest_record(
       &md_state, &mac_out, &header, &data, data_plus_mac_size);

   write(1, mac_out.buf, mac_out.len * sizeof(uint8_t));
}
