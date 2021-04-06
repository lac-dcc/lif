#include "../include/3way.h"
#include <stdio.h>

void printvec(char *chrs, word32 *d) {
    printf("%20s : %08lx %08lx %08lx \n",chrs,d[2],d[1],d[0]);
}

int main() {
    twy_ctx gc;
    word32 a[9],k[3];
    int i;
    /* Test vector 4. */
    k[2]=0xcab920cd;k[1]=0xd6144138;k[0]=0xd2f05b5e;
    a[2]=0xad21ecf7;a[1]=0x83ae9dc4;a[0]=0x4059c76e;
    twy_key(&gc,k);
    printf("**********\n");
    printvec("KEY = ",k);
    printvec("PLAIN = ",a);
    encrypt(&gc,a);
    printvec("CIPHER = ",a);
    /* TEST VALUES
    key : cab920cd d6144138 d2f05b5e
    plaintext : ad21ecf7 83ae9dc4 4059c76e
    ciphertext : 15b155ed 6b13f17c 478ea871
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
