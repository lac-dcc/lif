#ifndef CURVE25519_C64_H
#define CURVE25519_C64_H

#include <stdint.h>

int32_t curve25519_donna(
    uint8_t *mypublic, // secret (why??), len = 32
    uint8_t *_secret, // secret (obviously), len = 32
    uint8_t *basepoint // public, len = 32
);

#endif // CURVE25519_C64_H
