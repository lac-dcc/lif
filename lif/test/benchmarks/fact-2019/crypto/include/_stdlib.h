#ifndef _STDLIB_H_
#define _STDLIB_H_

#include "../../../include/taint.h"

#include <stdint.h>
#include <stdbool.h>

// @return SECRET
bool _crypto_verify_16(
    secret uint8_t x[16],
    secret uint8_t y[16]
);

#endif // _STDLIB_H_
