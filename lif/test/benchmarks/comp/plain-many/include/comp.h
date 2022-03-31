#ifndef COMP_H
#define COMP_H

#ifdef ENABLE_UNROLL
#ifndef N
#define N 32
#endif

#ifndef M
#define M 32
#endif

int comp(int **a, int *b);
#else
int comp(int **a, int *b, int n, int m);
#endif

#endif
