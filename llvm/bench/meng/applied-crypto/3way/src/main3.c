#include "../include/3way.h"
#include <stdio.h>

void printvec(char *chrs, word32 *d) {
    printf("%20s : %08lx %08lx %08lx \n",chrs,d[2],d[1],d[0]);
}

int main() {
    twy_ctx gc;
    word32 a[9],k[3];
    int i;
    /* Test vector 3. */
    k[2]=0xbcdef012;k[1]=0x456789ab;k[0]=0xdef01234;
    a[2]=0x01234567;a[1]=0x9abcdef0;a[0]=0x23456789;
    twy_key(&gc,k);
    printf("**********\n");
    printvec("KEY = ",k);
    printvec("PLAIN = ",a);
    encrypt(&gc,a);
    printvec("CIPHER = ",a);
    /* TEST VALUES
    key : bcdef012 456789ab def01234
    plaintext : 01234567 9abcdef0 23456789
    ciphertext : 7cdb76b2 9cdddb6d 0aa55dbb
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
