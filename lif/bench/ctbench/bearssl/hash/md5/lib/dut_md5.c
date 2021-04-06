// See: https://github.com/arthurlopes/ctbench/blob/master/dudect/BearSSL/hash/md5/dut_md5.c
#include <stdlib.h>
#include <stdint.h>
#include <string.h> // memcmp
#include "../include/dut.h"
#include "../../../include/random.h"
#include "../../../include/bearssl_block.h"
#include "../../../include/bearssl.h"
#include "../../../include/inner.h"
#include "../../../include/config.h"

br_md5_context ctx;
uint32_t key[64] = {0};
const size_t chunk_size = 16;
const size_t number_measurements = 1e5; // per test

uint8_t do_one_computation(const unsigned char *data) {
    uint32_t in[64] = {10};
    /* uint8_t ret = 0; */
    /* uint32_t iv[32] = {10}; */
    /* uint32_t out[32] = {0}; */

    br_md5_round(data, in);
    br_md5_update(&ctx, data, 32);

    return data[0];
}

void init_dut(void) {
    br_md5_init(&ctx);
}

void prepare_inputs(uint8_t *input_data, uint8_t *classes) {
  randombytes(input_data, number_measurements * chunk_size);
  for (size_t i = 0; i < number_measurements; i++) {
    classes[i] = randombit();
    if (classes[i] == 0) {
      memset(input_data + (size_t)i * chunk_size, 0x00, chunk_size);
    } else {
      // leave random
    }
  }
}
