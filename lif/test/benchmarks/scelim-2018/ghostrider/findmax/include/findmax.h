#ifndef FINDMAX_H
#define FINDMAX_H

#define INPUT_SIZE 1000

#ifdef ENABLE_UNROLL
int max(int h[]);
#else
int max(int n, int h[]);
#endif

#endif // FINDMAX_H
