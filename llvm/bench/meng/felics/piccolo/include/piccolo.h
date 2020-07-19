#ifndef PICCOLO_H
#define PICCOLO_H

#include <stdint.h>

void RunEncryptionKeySchedule(uint8_t *key, uint8_t *roundKeys);
void Piccolo_encrypt(uint8_t *roundKeys, uint8_t *block);

#endif
