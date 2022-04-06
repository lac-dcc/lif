#ifndef COMP_H
#define COMP_H

#define HASH_SIZE 1024

#ifdef ENABLE_UNROLL
#ifndef N
#define N 1024
#endif

int comp(int *a, int *b);
#else
int comp(int *a, int *b, int n);
#endif

#endif
