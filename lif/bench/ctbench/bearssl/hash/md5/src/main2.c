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
    /* for (size_t i = 0; i < 32; i++) printf("%d, ", input_data[i]); */
    // We let the inputs fixed so we can check if the output remains the same
    // for the invariant version. Chunk size = 32.
    uint8_t input_data[16] = {
        243, 92, 179, 227, 122, 41, 79, 45, 245, 137, 163, 64, 61, 53, 119, 164
    };

    printf("%d\n", do_one_computation(input_data));
    return 0;
}
