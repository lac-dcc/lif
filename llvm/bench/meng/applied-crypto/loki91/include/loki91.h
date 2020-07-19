#ifndef LOKI91_H
#define LOKI91_H

#include <stdint.h>

#define LOKIBLK 8 /* No of bytes in a LOKI data-block */
#define ROUNDS 16 /* No of LOKI rounds */

typedef struct {
    int32_t loki_subkeys[ROUNDS];
} loki_ctx;

void setlokikey(unsigned char *key, loki_ctx *c);
void enloki(loki_ctx *c, unsigned char *b);

#endif
