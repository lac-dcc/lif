#include "../include/3way.h"
#include <stdio.h>

void printvec(char *chrs, word32 *d) {
    printf("%20s : %08lx %08lx %08lx \n",chrs,d[2],d[1],d[0]);
}

int main() {
    twy_ctx gc;
    word32 a[9],k[3];
    int i;
    /* Test vector 1. */
    k[0]=k[1]=k[2]=0;
    a[0]=a[1]=a[2]=1;
    twy_key(&gc,k);
    printf("**********\n");
    printvec("KEY = ",k);
    printvec("PLAIN = ",a);
    encrypt(&gc,a);
    printvec("CIPHER = ",a);
    /* TEST VALUES
    key : 00000000 00000000 00000000
    plaintext : 00000001 00000001 00000001
    ciphertext : ad21ecf7 83ae9dc4 4059c76e
    */
    /* Enc/dec test: */
    for(i=0;i<9;i++) a[i]=i;
    twy_enc(&gc,a,3);
    for(i=0;i<9;i+=3) printf("Block %01d encrypts to %08lx %08lx %08lx\n", i/3,a[i],a[i+1],a[i+2]);
    twy_dec(&gc,a,2);
    twy_dec(&gc,a+6,1);
    for(i=0;i<9;i+=3) printf("Block %01d decrypts to %08lx %08lx %08lx\n",
    i/3,a[i],a[i+1],a[i+2]);
    return 0;
} 
