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
    uint8_t input_data[32] = {
        145, 69, 238, 12, 138, 186, 19, 197, 174, 235, 164, 220, 188, 63, 228,
        48, 88, 123, 127, 53, 171, 9, 150, 166, 65, 73, 23, 244, 210, 113, 106,
        214
    };

    printf("%d\n", do_one_computation(input_data));
    return 0;
}
