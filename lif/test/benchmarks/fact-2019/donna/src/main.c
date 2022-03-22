#include "../include/curve25519_c64.h"
#include "../../../include/taint.h"

#include <string.h>
#include <unistd.h>

int main() {
    secret uint8_t data[32];
    read(0, data, 32);

    // Mark input as secret for ct_grind check:
    ct_secret(data, 32);

    uint8_t out[32] = {0};
    uint8_t ret = 0;

    uint8_t basepoint[32] = {9};

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    curve25519_donna(out, data, basepoint);
    memcpy(data, out, 32);

    ret ^= out[0];
    write(1, &ret, 1);
}
