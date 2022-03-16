#ifndef DES_H
#define DES_H

#define EN0 0 /* MODE == encrypt */
#define DE1 1 /* MODE == decrypt */

typedef struct {
    unsigned long ek[32];
    unsigned long dk[32];
} des_ctx;

void deskey(unsigned char *, short);
/* hexkey[8] MODE
 * Sets the internal key register according to the hexadecimal
 * key contained in the 8 bytes of hexkey, according to the DES,
 * for encryption or decryption according to MODE.
 */
void usekey(unsigned long *);
/* cookedkey[32]
 * Loads the internal key register with the data in cookedkey.
 */
void cpkey(unsigned long *);
/* cookedkey[32]
 * Copies the contents of the internal key register into the storage
 * located at &cookedkey[0].
 */
void des(unsigned char *, unsigned char *);
/* from[8] to[8]
 * Encrypts/Decrypts (according to the key currently loaded in the
 * internal key register) one block of eight bytes at address 鈥榝rom->* into
 * the block at address 鈥榯o-> They can be the same.
 */
void scrunch(unsigned char *, unsigned long *);
void unscrun(unsigned long *, unsigned char *);
void desfunc(unsigned long *, unsigned long *);
void cookey(unsigned long *);

#endif
