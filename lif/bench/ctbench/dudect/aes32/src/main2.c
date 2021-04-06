#include "../include/dut.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    /* uint8_t *classes = (uint8_t *) calloc(number_measurements, sizeof(uint8_t)); */
    /* uint8_t *input_data = */
    /*     (uint8_t *) calloc(number_measurements * chunk_size, sizeof(uint8_t)); */

    init_dut();
    /* prepare_inputs(input_data, classes); */
    // We let the inputs fixed so we can check if the output remains the same
    // for the invariant version. Chunk size = 16.
    uint8_t input_data[16] = {
        46, 177, 201, 33, 35, 83, 151, 250, 226,
        25, 158, 101, 153, 246, 100, 197
    };

    printf("%d\n", do_one_computation(input_data, 11));
    return 0;
}
