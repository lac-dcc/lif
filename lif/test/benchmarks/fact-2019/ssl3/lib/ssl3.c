/**
 * Port from FaCT implementation:
 * https://github.com/PLSysSec/fact-eval/blob/master/openssl-ssl3/s3_cbc.fact
 */

#include "../include/ssl3.h"
#include "../../../include/taint.h"

#include <assert.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#include <openssl/sha.h>

#define l2n(l, c)                                                              \
    (*((c)++) = (unsigned char)(((l) >> 24L) & 0xff),                          \
     *((c)++) = (unsigned char)(((l) >> 16L) & 0xff),                          \
     *((c)++) = (unsigned char)(((l) >> 8L) & 0xff),                           \
     *((c)++) = (unsigned char)(((l)) & 0xff))

static void md_final_raw(SHA_CTX *ctx, unsigned char *md_out)
{
    l2n(ctx->h0, md_out);
    l2n(ctx->h1, md_out);
    l2n(ctx->h2, md_out);
    l2n(ctx->h3, md_out);
    l2n(ctx->h4, md_out);
}

int32_t __ssl3_cbc_digest_record(
    uint8ptr_wrapped_ty *md_state, uint8ptr_wrapped_ty *mac_out,
    uint8ptr_wrapped_ty *header, uint8ptr_wrapped_ty *data,
    uint64_t data_plus_mac_size
) {
    secret uint8_t *md_state_buf = md_state->buf;
    secret uint8_t *mac_out_buf = mac_out->buf;
    secret uint8_t *header_buf = header->buf;
    secret uint8_t *data_buf = data->buf;

    uint32_t MAX_HASH_BLOCK_SIZE = 128;
    // idk just picking some arbitrary number:
    uint32_t SIZEOF_LARGEST_DIGEST_CTX = 216;
    uint32_t MAX_HASH_BIT_COUNT_BYTES = 16;
    uint32_t EVP_MAX_MD_SIZE = 64;

    uint64_t md_size = 20;
    uint64_t md_block_size = 64;
    uint64_t sslv3_pad_length = 40;
    uint64_t md_length_size = 8;

    // skipping the prequel stuff in the function since it doesn't really
    // have any ct

    uint64_t variance_blocks = 2;
    uint64_t length = data->len + header->len;
    uint64_t max_mac_bytes = length - md_size - 1;
    uint64_t num_blocks = (
        max_mac_bytes + 1 + md_length_size + md_block_size - 1
    ) / md_block_size;
    uint64_t mac_end_offset = data_plus_mac_size + header->len - md_size;
    uint64_t c = mac_end_offset % md_block_size;
    uint64_t index_a = mac_end_offset / md_block_size;
    uint64_t index_b = (mac_end_offset + md_length_size) / md_block_size;

    uint64_t num_starting_blocks = 0;
    uint64_t k = 0; // XXX is this really public?

    if (num_blocks > variance_blocks + 1) {
        num_starting_blocks = num_blocks - variance_blocks;
        k = md_block_size * num_starting_blocks;
    }

    assert(data->len >= k);
    assert(header->len <= 2 * md_block_size);

    uint8_t first_block[128] = {0}; // `MAX_HASH_BLOCK_SIZE`
    uint64_t bits = 8 * mac_end_offset;
    uint8_t length_bytes[16] = {0}; // `MAX_HASH_BIT_COUNT_BYTES`

    length_bytes[md_length_size - 4] = (uint8_t) (bits >> 24);
    length_bytes[md_length_size - 3] = (uint8_t) (bits >> 16);
    length_bytes[md_length_size - 2] = (uint8_t) (bits >> 8);
    length_bytes[md_length_size - 1] = (uint8_t) bits;

    if (k > 0) {
        if (header->len <= md_block_size) {
            // "Should never happen"
            return 0;
        }

        uint64_t overhang = header->len - md_block_size;
        SHA1_Transform((SHA_CTX *) md_state_buf, header_buf);
        memcpy(first_block, &header_buf[md_block_size], overhang);

        uint64_t cpylen = md_block_size - overhang;;
        memcpy(&first_block[overhang], data_buf, cpylen);
        SHA1_Transform((SHA_CTX *) md_state_buf, first_block);

        uint64_t loopbound = k / md_block_size - 1;
        for (uint64_t i = 1; i < loopbound; i++) {
            uint64_t idx = md_block_size * i - overhang;
            SHA1_Transform((SHA_CTX *) md_state_buf, &data_buf[idx]);
        }
    }

    uint64_t loopbound = num_starting_blocks + variance_blocks + 1;
    for (uint64_t i = num_starting_blocks; i < loopbound; i++) {
        uint8_t block[128] = {0}; // `MAX_HASH_BLOCK_SIZE`
        bool is_block_a = i == index_a;
        bool is_block_b = i == index_b;

        for (uint64_t j = 0; j < md_block_size; j++) {
            uint8_t b = 0;
            uint64_t _k = k;

            if (_k < header->len) {
                b = header_buf[_k];
            } else if (_k < data->len + header->len){
                b = data_buf[_k - header->len];
            }

            k++;

            bool is_past_c = is_block_a && (j >= c);
            bool is_past_cp1 = is_block_a && (j >= c + 1);

            b = is_past_c ? 0x80 : b;
            if (is_past_cp1) {
                b = 0;
            }
            if (is_block_b && !is_block_a) {
                b = 0;
            }
            if (j >= md_block_size - md_length_size) {
                b = is_block_b
                        ? length_bytes[j - (md_block_size - md_length_size)]
                        : b;
            }
            block[j] = b;
        }

        SHA1_Transform((SHA_CTX *) md_state_buf, block);
        md_final_raw((SHA_CTX *) md_state_buf, block);

        for (uint64_t j = 0; j < md_size; j++) {
            mac_out_buf[j] |= is_block_b ? block[j] : 0;
        }
    }

    return 1;
}
