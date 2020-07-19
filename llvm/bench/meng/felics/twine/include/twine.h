#ifndef TWINE_H
#define TWINE_H

#include <stdint.h>

void RunEncryptionKeySchedule(uint8_t *key, uint8_t *roundKeys);
void TWINE_encrypt(uint8_t *roundKeys, uint8_t *block);

#endif
