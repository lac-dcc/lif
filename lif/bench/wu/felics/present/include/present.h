#ifndef PRESENT_H
#define PRESENT_H

#include <stdint.h>

void RunEncryptionKeySchedule(uint8_t *key, uint8_t *roundKeys);
void PRESENT_encrypt(uint8_t *roundKeys, uint8_t *block);

#endif
