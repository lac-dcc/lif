#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define N 2000

int comp(int *a, int *b) {
    for (int i = 0; i < N; i++)
        if (a[i] != b[i]) return 0;
    return 1;
}
/*  */
/* int comp2(int *a, int *b) { */
/*     if (a[0] != b[0]) return 0; */
/*     if (a[1] != b[1]) return 0; */
/*     return 1; */
/* } */
/*  */
/* void mu(int32_t *a) { // original version */
/*     int i; */
/*     int32_t b[3]; */
/*     b[0] = b[1] = b[2] = 0; */
/*     for (i=0; i<32; i++) { */
/*         b[0] <<= 1; b[1] <<= 1; b[2] <<= 1; */
/*         if(a[0]&1) b[2] |= 1; // leak */
/*         if(a[1]&1) b[1] |= 1; // leak */
/*         if(a[2]&1) b[0] |= 1; // leak */
/*         a[0] >>= 1; a[1] >>= 1; a[2] >>= 1; */
/*     } */
/*     a[0] = b[0]; a[1] = b[1]; a[2] = b[2]; */
/* } */

int main() {
    int a[N], b[N];
    for (int i = 0; i < N; i++) a[i] = b[i] = i;

    int r;

    clock_t start = clock();
    r = comp(a, b);
    clock_t end = clock();

    printf("%f\t", ((double) (end - start)) / CLOCKS_PER_SEC);
    /* printf("%d\t%d\n", comp2(a, b), comp(a, b)); */

    b[0] = 1;

    start = clock();
    r = comp(a, b);
    end = clock();

    printf("%f\n", ((double) (end - start)) / CLOCKS_PER_SEC);

    /* printf("%d\t%d\n", comp2(a, b), comp(a, b)); */

    /* int32_t c[3] = {0, 1, 2}; */
    /* mu(c); */
    /* printf("%d\t%d\t%d\n", c[0], c[1], c[2]); */

    return 0;
}
