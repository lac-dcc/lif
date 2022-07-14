#include "../include/curve25519_c64.h"
#include "../../../include/taint.h"

#include <string.h>

/* Load a little-endian 64-bit number  */
uint64_t load_limb(uint8_t *input) {
    return
        ((uint64_t)  input[0])        |
        (((uint64_t) input[1]) << 8)  |
        (((uint64_t) input[2]) << 16) |
        (((uint64_t) input[3]) << 24) |
        (((uint64_t) input[4]) << 32) |
        (((uint64_t) input[5]) << 40) |
        (((uint64_t) input[6]) << 48) |
        (((uint64_t)input[7]) << 56);
}

/* Take a little-endian, 32-byte number and expand it into polynomial form */
/* void fexpand(secret mut uint64[5] output, public uint8[32] input) { */
void fexpand(uint64_t *output, uint8_t *input) {
    uint8_t view[8];

    memcpy(view, input, 8);
    output[0] = load_limb(view) & 0x7ffffffffffff;

    memcpy(view, &input[6], 8);
    output[1] = (load_limb(view) >> 3) & 0x7ffffffffffff;

    memcpy(view, &input[12], 8);
    output[2] = (load_limb(view) >> 6) & 0x7ffffffffffff;

    memcpy(view, &input[19], 8);
    output[3] = (load_limb(view) >> 1) & 0x7ffffffffffff;

    memcpy(view, &input[24], 8);
    output[4] = (load_limb(view) >> 12) & 0x7ffffffffffff;
}

/* Sum two numbers: output += input */
void fsum(uint64_t *output, uint64_t *input) {
    output[0] += input[0];
    output[1] += input[1];
    output[2] += input[2];
    output[3] += input[3];
    output[4] += input[4];
}

/* Find the difference of two numbers: output = input - output
 * (note the order of the arguments!)
 *
 * Assumes that out[i] < 2**52
 * On return, out[i] < 2**55
 */
void fdifference_backwards(uint64_t *out, uint64_t *input) {
    /* 152 is 19 << 3 */
    uint64_t two54m152 = (1 << 54) - 152;
    uint64_t two54m8 = (1 << 54) - 8;

    out[0] = input[0] + two54m152 - out[0];
    out[1] = input[1] + two54m8 - out[1];
    out[2] = input[2] + two54m8 - out[2];
    out[3] = input[3] + two54m8 - out[3];
    out[4] = input[4] + two54m8 - out[4];
}

/* Multiply two numbers: output = input2 * input
 *
 * output must be distinct to both inputs. The inputs are reduced coefficient
 * form, the output is not.
 *
 * Assumes that input[i] < 2**55 and likewise for input2.
 * On return, output[i] < 2**52
 */
void fmul(uint64_t *output, uint64_t *input2, uint64_t *input) {
    uint64_t t[5] = {0};
    uint64_t r0 = 0;
    uint64_t r1 = 0;
    uint64_t r2 = 0;
    uint64_t r3 = 0;
    uint64_t r4 = 0;
    uint64_t s0 = 0;
    uint64_t s1 = 0;
    uint64_t s2 = 0;
    uint64_t s3 = 0;
    uint64_t s4 = 0;
    uint64_t c = 0;

    r0 = input[0];
    r1 = input[1];
    r2 = input[2];
    r3 = input[3];
    r4 = input[4];

    s0 = input2[0];
    s1 = input2[1];
    s2 = input2[2];
    s3 = input2[3];
    s4 = input2[4];

    t[0] = ((uint64_t) r0) * s0;
    t[1] = ((uint64_t) r0) * s1 + ((uint64_t) r1) * s0;
    t[2] = ((uint64_t) r0) * s2 + ((uint64_t) r2) * s0 + ((uint64_t) r1) * s1;
    t[3] = ((uint64_t) r0) * s3 + ((uint64_t) r3) * s0 +
        ((uint64_t) r1) * s2 + ((uint64_t) r2) * s1;
    t[4] = ((uint64_t) r0) * s4 + ((uint64_t) r4) * s0 +
        ((uint64_t) r3) * s1 + ((uint64_t) r1) * s3 + ((uint64_t) r2) * s2;

    r4 *= 19;
    r1 *= 19;
    r2 *= 19;
    r3 *= 19;

    t[0] += ((uint64_t) r4) * s1 + ((uint64_t) r1) * s4 + ((uint64_t) r2) * s3
        + ((uint64_t) r3) * s2;
    t[1] += ((uint64_t) r4) * s2 + ((uint64_t) r2) * s4 + ((uint64_t) r3) * s3;
    t[2] += ((uint64_t) r4) * s3 + ((uint64_t) r3) * s4;
    t[3] += ((uint64_t) r4) * s4;

    r0 = ((uint64_t) t[0]) & 0x7ffffffffffff;
    c = ((uint64_t) (t[0] >> 51));
    t[1] += c;
    r1 = ((uint64_t) t[1]) & 0x7ffffffffffff;
    c = ((uint64_t) t[1] >> 51);
    t[2] += c;
    r2 = ((uint64_t) t[2]) & 0x7ffffffffffff;
    c = ((uint64_t) t[2] >> 51);
    t[3] += c;
    r3 = ((uint64_t) t[3]) & 0x7ffffffffffff;
    c = ((uint64_t) t[3] >> 51);
    t[4] += c;
    r4 = ((uint64_t) t[4]) & 0x7ffffffffffff;
    c = ((uint64_t) t[4] >> 51);
    r0 += c * 19;
    c = r0 >> 51;
    r0 = r0 & 0x7ffffffffffff;
    r1 += c;
    c = r1 >> 51;
    r1 = r1 & 0x7ffffffffffff;
    r2 += c;

    output[0] = r0;
    output[1] = r1;
    output[2] = r2;
    output[3] = r3;
    output[4] = r4;
}

void fsquare_times(uint64_t *output, uint64_t *input, uint64_t count) {
    uint64_t t[5] = {0};
    uint64_t r0 = 0;
    uint64_t r1 = 0;
    uint64_t r2 = 0;
    uint64_t r3 = 0;
    uint64_t r4 = 0;
    uint64_t c = 0;
    uint64_t d0 = 0;
    uint64_t d1 = 0;
    uint64_t d2 = 0;
    uint64_t d4 = 0;
    uint64_t d419 = 0;

    r0 = input[0];
    r1 = input[1];
    r2 = input[2];
    r3 = input[3];
    r4 = input[4];

    for (uint64_t i = 0; i < count; i++) {
        d0 = r0 * 2;
        d1 = r1 * 2;
        d2 = r2 * 2 * 19;
        d419 = r4 * 19;
        d4 = d419 * 2;

        t[0] = ((uint64_t) r0) * r0 + ((uint64_t) d4) * r1 +
            (((uint64_t) d2) * (r3));
        t[1] = ((uint64_t) d0) * r1 + ((uint64_t) d4) * r2 +
            (((uint64_t) r3) * (r3 * 19));
        t[2] = ((uint64_t) d0) * r2 + ((uint64_t) r1) * r1 +
            (((uint64_t) d4) * (r3));
        t[3] = ((uint64_t) d0) * r3 + ((uint64_t) d1) * r2 +
            (((uint64_t) r4) * (d419));
        t[4] = ((uint64_t) d0) * r4 + ((uint64_t) d1) * r3 +
            (((uint64_t) r2) * (r2));

        r0 = ((uint64_t) t[0]) & 0x7ffffffffffff;
        c = ((uint64_t) t[0] >> 51);
        t[1] += c;
        r1 = ((uint64_t) t[1]) & 0x7ffffffffffff;
        c = ((uint64_t) t[1] >> 51);
        t[2] += c;
        r2 = ((uint64_t) t[2]) & 0x7ffffffffffff;
        c = ((uint64_t) t[2] >> 51);
        t[3] += c;
        r3 = ((uint64_t) t[3]) & 0x7ffffffffffff;
        c = ((uint64_t) t[3] >> 51);
        t[4] += c;
        r4 = ((uint64_t) t[4]) & 0x7ffffffffffff;
        c = ((uint64_t) t[4] >> 51);
        r0 += c * 19;
        c = r0 >> 51;
        r0 = r0 & 0x7ffffffffffff;
        r1 += c;
        c = r1 >> 51;
        r1 = r1 & 0x7ffffffffffff;
        r2 += c;
    }

    output[0] = r0;
    output[1] = r1;
    output[2] = r2;
    output[3] = r3;
    output[4] = r4;
}

/* Multiply a number by a scalar: output = input * scalar */
void
fscalar_product(uint64_t *output, uint64_t *input, uint64_t scalar) {
    uint64_t a = 0;

    a = ((uint64_t) input[0]) * scalar;
    output[0] = ((uint64_t) a) & 0x7ffffffffffff;

    a = ((uint64_t) input[1]) * scalar + ((uint64_t) (a >> 51));
    output[1] = ((uint64_t) a) & 0x7ffffffffffff;

    a = ((uint64_t) input[2]) * scalar + ((uint64_t) (a >> 51));
    output[2] = ((uint64_t) a) & 0x7ffffffffffff;

    a = ((uint64_t) input[3]) * scalar + ((uint64_t) (a >> 51));
    output[3] = ((uint64_t) a) & 0x7ffffffffffff;

    a = ((uint64_t) input[4]) * scalar + ((uint64_t) (a >> 51));
    output[4] = ((uint64_t) a) & 0x7ffffffffffff;

    output[0] += ((uint64_t) ((a >> 51) * 19));
}

/* Input: Q, Q', Q-Q'
 * Output: 2Q, Q+Q'
 *
 *   x2 z3: long form
 *   x3 z3: long form
 *   x z: short form, destroyed
 *   xprime zprime: short form, destroyed
 *   qmqp: short form, preserved
 */
void fmonty(
    uint64_t *x2,     uint64_t *z2, /* output 2Q */
    uint64_t *x3,     uint64_t *z3, /* output Q + Q' */
    uint64_t *x,      uint64_t *z,  /* input Q */
    uint64_t *xprime, uint64_t *zprime, /* input Q' */
    uint64_t *qmqp /* input Q - Q' */
) {
    uint64_t origx[5];
    memcpy(origx, x, 5);

    uint64_t origxprime[5];
    memcpy(origxprime, xprime, 5);

    uint64_t zzz[5] = {0};
    uint64_t xx[5] = {0};
    uint64_t zz[5] = {0};
    uint64_t xxprime[5] = {0};
    uint64_t zzprime[5] = {0};
    uint64_t zzzprime[5] = {0};

    fsum(x, z);
    fdifference_backwards(z, origx); // does x - z

    fsum(xprime, zprime);
    fdifference_backwards(zprime, origxprime);
    fmul(xxprime, xprime, z);
    fmul(zzprime, x, zprime);

    for (uint32_t i = 0; i < 5; i++) {
        origxprime[i] = xxprime[i];
    }

    fsum(xxprime, zzprime);
    fdifference_backwards(zzprime, origxprime);
    fsquare_times(x3, xxprime, 1);
    fsquare_times(zzzprime, zzprime, 1);
    fmul(z3, zzzprime, qmqp);

    fsquare_times(xx, x, 1);
    fsquare_times(zz, z, 1);
    fmul(x2, xx, zz);
    fdifference_backwards(zz, xx); // does zz = xx - zz
    fscalar_product(zzz, zz, 121665);
    fsum(zzz, xx);
    fmul(z2, zz, zzz);
}

// -----------------------------------------------------------------------------
// Maybe swap the contents of two uint64 arrays (@a and @b), each @len elements
// long. Perform the swap iff @swap is non-zero.
//
// This function performs the swap without leaking any side-channel
// information.
// -----------------------------------------------------------------------------
void swap_conditional(uint64_t *a, uint64_t *b, uint64_t swapi) {
    if (swapi == 1) {
        for (uint32_t i = 0; i < 5; i++) {
            uint64_t x = a[i];
            a[i] = b[i];
            b[i] = x;
        }
    }
}

/* Calculates nQ where Q is the x-coordinate of a point on the curve
 *
 *   resultx/resultz: the x coordinate of the resulting curve point (short form)
 *   n: a little endian, 32-byte number
 *   q: a point of the curve (short form)
 */
void cmult(uint64_t *resultx, uint64_t *resultz, uint8_t *n, uint64_t *q) {
    uint64_t a[5] = {0};
    uint64_t b[5] = {0};
    uint64_t c[5] = {0};
    uint64_t d[5] = {0};
    uint64_t e[5] = {0};
    uint64_t f[5] = {0};
    uint64_t g[5] = {0};
    uint64_t h[5] = {0};

    b[0] = 1;
    c[0] = 1;
    f[0] = 1;
    h[0] = 1;

    // uint64 *nqpqx = a, *nqpqz = b, *nqx = c, *nqz = d, *t;
    // uint64 *nqpqx2 = e, *nqpqz2 = f, *nqx2 = g, *nqz2 = h;

    for (uint32_t i = 0; i < 5; i++) a[i] = q[i];
    for (uint32_t i = 0; i < 32; i++) {
        uint8_t byte = n[31 - i];
        for (uint32_t j = 0; j < 8; j++) {
            uint64_t bit = byte >> 7;

            if ((j & 1) == 0) {
                swap_conditional(c, a, bit);
                swap_conditional(d, b, bit);
                fmonty(g, h, e, f, c, d, a, b, q);
                swap_conditional(g, e, bit);
                swap_conditional(h, f, bit);
            } else {
                swap_conditional(g, e, bit);
                swap_conditional(h, f, bit);
                fmonty(c, d, a, b, g, h, e, f, q);
                swap_conditional(c, a, bit);
                swap_conditional(d, b, bit);
            }

            byte <<= 1;
        }
    }

    for (uint32_t i = 0; i < 5; i++) {
        resultx[i] = c[i];
        resultz[i] = d[i];
    }
}

// -----------------------------------------------------------------------------
// Shamelessly copied from djb's code, tightened a little
// -----------------------------------------------------------------------------
void crecip(uint64_t *out, uint64_t *z) {
    uint64_t a[5]  = {0};
    uint64_t t0[5] = {0};
    uint64_t b[5]  = {0};
    uint64_t c[5]  = {0};

    /* 2 */ fsquare_times(a, z, 1); // a = 2
    /* 8 */ fsquare_times(t0, a, 2);
    /* 9 */ fmul(b, t0, z); // b = 9
    /* 11 */ fmul(a, b, a); // a = 11
    /* 22 */ fsquare_times(t0, a, 1);
    /* 2^5 - 2^0 = 31 */ fmul(b, t0, b);
    /* 2^10 - 2^5 */ fsquare_times(t0, b, 5);
    /* 2^10 - 2^0 */ fmul(b, t0, b);
    /* 2^20 - 2^10 */ fsquare_times(t0, b, 10);
    /* 2^20 - 2^0 */ fmul(c, t0, b);
    /* 2^40 - 2^20 */ fsquare_times(t0, c, 20);
    /* 2^40 - 2^0 */ fmul(t0, t0, c);
    /* 2^50 - 2^10 */ fsquare_times(t0, t0, 10);
    /* 2^50 - 2^0 */ fmul(b, t0, b);
    /* 2^100 - 2^50 */ fsquare_times(t0, b, 50);
    /* 2^100 - 2^0 */ fmul(c, t0, b);
    /* 2^200 - 2^100 */ fsquare_times(t0, c, 100);
    /* 2^200 - 2^0 */ fmul(t0, t0, c);
    /* 2^250 - 2^50 */ fsquare_times(t0, t0, 50);
    /* 2^250 - 2^0 */ fmul(t0, t0, b);
    /* 2^255 - 2^5 */ fsquare_times(t0, t0, 5);
    /* 2^255 - 21 */ fmul(out, t0, a);
}

void store_limb(uint8_t *out, uint64_t input) {
    out[0] = input & ((uint8_t) (0xff));
    out[1] = (input >> 8) & ((uint8_t) (0xff));
    out[2] = (input >> 16) & ((uint8_t) (0xff));
    out[3] = (input >> 24) & ((uint8_t) (0xff));
    out[4] = (input >> 32) & ((uint8_t) (0xff));
    out[5] = (input >> 40) & ((uint8_t) (0xff));
    out[6] = (input >> 48) & ((uint8_t) (0xff));
    out[7] = (input >> 56) & ((uint8_t) (0xff));
}

/* Take a fully reduced polynomial form number and contract it into a
 * little-endian, 32-byte array
 */
void fcontract(uint8_t *output, uint64_t *input) {
    uint64_t t[5] = {0};

    t[0] = input[0];
    t[1] = input[1];
    t[2] = input[2];
    t[3] = input[3];
    t[4] = input[4];

    t[1] += t[0] >> 51;
    t[0] &= 0x7ffffffffffff;
    t[2] += t[1] >> 51;
    t[1] &= 0x7ffffffffffff;
    t[3] += t[2] >> 51;
    t[2] &= 0x7ffffffffffff;
    t[4] += t[3] >> 51;
    t[3] &= 0x7ffffffffffff;
    t[0] += 19 * (t[4] >> 51);
    t[4] &= 0x7ffffffffffff;

    t[1] += t[0] >> 51;
    t[0] &= 0x7ffffffffffff;
    t[2] += t[1] >> 51;
    t[1] &= 0x7ffffffffffff;
    t[3] += t[2] >> 51;
    t[2] &= 0x7ffffffffffff;
    t[4] += t[3] >> 51;
    t[3] &= 0x7ffffffffffff;
    t[0] += 19 * (t[4] >> 51);
    t[4] &= 0x7ffffffffffff;

    /* now t is between 0 and 2^255-1, properly carried. */
    /* case 1: between 0 and 2^255-20. case 2: between 2^255-19 and 2^255-1. */

    t[0] += 19;

    t[1] += t[0] >> 51;
    t[0] &= 0x7ffffffffffff;
    t[2] += t[1] >> 51;
    t[1] &= 0x7ffffffffffff;
    t[3] += t[2] >> 51;
    t[2] &= 0x7ffffffffffff;
    t[4] += t[3] >> 51;
    t[3] &= 0x7ffffffffffff;
    t[0] += 19 * (t[4] >> 51);
    t[4] &= 0x7ffffffffffff;

    /* now between 19 and 2^255-1 input both cases, and offset by 19. */

    t[0] += 0x8000000000000 - 19;
    t[1] += 0x8000000000000 - 1;
    t[2] += 0x8000000000000 - 1;
    t[3] += 0x8000000000000 - 1;
    t[4] += 0x8000000000000 - 1;

    /* now between 2^255 and 2^256-20, and offset by 2^255. */

    t[1] += t[0] >> 51;
    t[0] &= 0x7ffffffffffff;
    t[2] += t[1] >> 51;
    t[1] &= 0x7ffffffffffff;
    t[3] += t[2] >> 51;
    t[2] &= 0x7ffffffffffff;
    t[4] += t[3] >> 51;
    t[3] &= 0x7ffffffffffff;
    t[4] &= 0x7ffffffffffff;

    uint8_t view[8];

    memcpy(view, input, 8);
    store_limb(view, ((uint64_t) (t[0] | (t[1] << 51))));

    memcpy(view, &input[8], 8);
    store_limb(view, ((uint64_t) ((t[1] >> 13) | (t[2] << 38))));

    memcpy(view, &input[16], 8);
    store_limb(view, ((uint64_t) ((t[2] >> 26) | (t[3] << 25))));

    memcpy(view, &input[24], 8);
    store_limb(view, ((uint64_t) ((t[3] >> 39) | (t[4] << 12))));
}

int32_t curve25519_donna(
    uint8_t *mypublic, uint8_t *_secret, uint8_t *basepoint
) {
    uint64_t bp[5] = {0};
    uint64_t x[5] = {0};
    uint64_t z[5] = {0};
    uint64_t zmone[5] = {0};
    secret uint8_t e[32];

    memcpy(e, _secret, 32);

    e[0] &= 248;
    e[31] &= 127;
    e[31] |= 64;

    fexpand(bp, basepoint);
    cmult(x, z, e, bp);
    crecip(zmone, z);
    fmul(z, x, zmone);
    fcontract(mypublic, z);

    return 0;
}
