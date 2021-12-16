#ifndef CAMELLIA_H
#define CAMELLIA_H

#include <stdint.h>

void camellia_setup128(const unsigned char *key, uint32_t *subkey);

#endif
