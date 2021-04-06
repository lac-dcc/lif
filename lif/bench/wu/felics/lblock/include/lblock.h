#ifndef LBLOCK_H
#define LBLOCK_H

#include <stdint.h>

void RunEncryptionKeySchedule(uint8_t *key, uint8_t *roundKeys);
void LBlock_encrypt(uint8_t *roundKeys, uint8_t *block);

#endif
