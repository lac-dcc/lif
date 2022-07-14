#include "../include/3way.h"
#include "../../../../include/taint.h"

#include <stdio.h>
#include <unistd.h>

#ifdef ENABLE_MEASURE_TIME
#include <stdint.h>
#include <time.h>

#define _NS_PER_SECO_ND 1000000000
#define INLINE __attribute__((__always_inline__)) inline
INLINE uint64_t nanoseconds(struct timespec t) {
    return t.tv_sec * _NS_PER_SECO_ND + t.tv_nsec;
}
#endif

/* void printvec(const char *chrs, int32_t *d) { */
/*     printf("%20s : %08x %08x %08x \n", chrs, d[2], d[1], d[0]); */
/* } */

int main() {
    /* twy_ctx gc; */
    /* int32_t a[9], k[3]; */

    /* for (int i = 0; i < 3; i++) scanf("%d", &k[i]); */
    /* for (int i = 0; i < 3; i++) scanf("%d", &a[i]); */

    /* twy_key(k, &gc); */
    /* printf("**********\n"); */
    /* printvec("KEY = ", k); */
    /* printvec("PLAIN = ",a); */
    /* encrypt(&gc, a); */
    /* printvec("CIPHER = ",a); */

    /* Enc/dec test: */
    /* for(int i = 0; i < 9; i++) a[i]=i; */
    /* twy_enc(&gc,a,3); */

    /* for(int i = 0; i < 9; i += 3) */
    /*     printf("Block %01d encrypts to %08x %08x %08x\n", */
    /*             i/3, a[i], a[i+1], a[i+2]); */

    /* twy_dec(&gc,a,2); */
    /* twy_dec(&gc,a+6,1); */

    /* for(int i = 0; i < 9; i += 3) */
    /*     printf("Block %01d decrypts to %08x %08x %08x\n", */
    /*             i/3, a[i], a[i+1], a[i+2]); */

    // Main from Constantine:
    twy_ctx gc;

    secret int32_t in_key[3];
    secret int32_t in[3];

    read(0, in_key, sizeof(int32_t) * 3);
    read(0, in, sizeof(int32_t) * 3);

    // Mark input as secret for ct_grind check:
    ct_secret(in_key, 3);
    ct_secret(in, 3);

#ifdef ENABLE_MEASURE_TIME
    struct timespec start, end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
#endif

    twy_key(in_key, &gc);
    encrypt(&gc, in);

#ifdef ENABLE_MEASURE_TIME
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    uint64_t delta = nanoseconds(end) - nanoseconds(start);
    printf("\nTime: %ld\n", delta);
#endif

    write(1, in, sizeof(int32_t) * 3);

    return 0;
}
