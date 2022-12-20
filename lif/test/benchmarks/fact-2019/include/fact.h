#ifndef FACT_H_
#define FACT_H_

#include <stdint.h>
#include <string.h>

/****************************************************************
 ********************** Help porting to C ***********************
 ****************************************************************/
typedef struct uint8ptr_wrapped_ty {
    uint8_t *buf;
    uint64_t len;
} uint8ptr_wrapped_ty;

/****************************************************************
 ************************** FaCT stuff **************************
 ****************************************************************/

#define view(dest, src, offset, len) memcpy(dest, src + offset, len)

static inline uint32_t load32_le(const uint8_t src[4]) {
#ifdef NATIVE_LITTLE_ENDIAN
    uint32_t w;
    memcpy(&w, src, sizeof w);
    return w;
#else
    uint32_t w = (uint32_t) src[0];
    w |= (uint32_t) src[1] <<  8;
    w |= (uint32_t) src[2] << 16;
    w |= (uint32_t) src[3] << 24;
    return w;
#endif
}

static inline uint64_t load64_le(const uint8_t src[8]) {
#ifdef NATIVE_LITTLE_ENDIAN
    uint64_t w;
    memcpy(&w, src, sizeof w);
    return w;
#else
    uint64_t w = (uint64_t) src[0];
    w |= (uint64_t) src[1] <<  8;
    w |= (uint64_t) src[2] << 16;
    w |= (uint64_t) src[3] << 24;
    w |= (uint64_t) src[4] << 32;
    w |= (uint64_t) src[5] << 40;
    w |= (uint64_t) src[6] << 48;
    w |= (uint64_t) src[7] << 56;
    return w;
#endif
}

static inline void store32_le(uint8_t dst[4], uint32_t w) {
#ifdef NATIVE_LITTLE_ENDIAN
    memcpy(dst, &w, sizeof w);
#else
    dst[0] = (uint8_t) w; w >>= 8;
    dst[1] = (uint8_t) w; w >>= 8;
    dst[2] = (uint8_t) w; w >>= 8;
    dst[3] = (uint8_t) w;
#endif
}

static inline void store64_le(uint8_t dst[8], uint64_t w) {
#ifdef NATIVE_LITTLE_ENDIAN
    memcpy(dst, &w, sizeof w);
#else
    dst[0] = (uint8_t) w; w >>= 8;
    dst[1] = (uint8_t) w; w >>= 8;
    dst[2] = (uint8_t) w; w >>= 8;
    dst[3] = (uint8_t) w; w >>= 8;
    dst[4] = (uint8_t) w; w >>= 8;
    dst[5] = (uint8_t) w; w >>= 8;
    dst[6] = (uint8_t) w; w >>= 8;
    dst[7] = (uint8_t) w;
#endif
}

static inline uint32_t rotl32(const uint32_t x, const int b) {
    return (x << b) | (x >> (32 - b));
}
#endif // FACT_H_
