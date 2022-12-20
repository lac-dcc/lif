#include "../include/_stdlib.h"
#include "../../../include/taint.h"

#include <string.h>

/**************************************************************************
 * Ported from:
 * github.com/PLSysSec/fact-eval/blob/master/crypto_secretbox/stdlib.fact
 **************************************************************************/

bool _crypto_verify_16(
    secret uint8_t x[16],
    secret uint8_t y[16]
) {
    for (uint32_t i = 0; i < 16; i++) {
        if (x[i] != y[i]) { // TAINTED
            return false;
        }
    }

    return true;
}
