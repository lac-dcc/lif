#ifndef COMP_H
#define COMP_H

#include <stdint.h>

typedef struct S { int *p; int n; } S;
int32_t comp(S *a, int32_t *b, int n);

#endif
