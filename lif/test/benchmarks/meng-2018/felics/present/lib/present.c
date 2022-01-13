/*
 *
 * University of Luxembourg
 * Laboratory of Algorithmics, Cryptology and Security (LACS)
 *
 * FELICS - Fair Evaluation of Lightweight Cryptographic Systems
 *
 * Copyright (C) 2015 University of Luxembourg
 *
 * Written in 2015 by Dmitry Khovratovich <dmitry.khovratovich@uni.lu>
 *
 * This file is part of FELICS.
 *
 * FELICS is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * FELICS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 */
#include <stdint.h>
#include <stdio.h>
#include "../include/present.h"

uint32_t spBox0_lo[16] __attribute__((aligned(64))) = {
    0x0,     0x1,     0x10000, 0x10001, 0x1, 0x0,     0x10000, 0x1,
    0x10001, 0x10000, 0x10001, 0x0,     0x0, 0x10001, 0x1,     0x10000};
uint32_t spBox0_hi[16] __attribute__((aligned(64))) = {
    0x10001, 0x1,     0x1,     0x10000, 0x10000, 0x0, 0x10000, 0x10001,
    0x0,     0x10001, 0x10001, 0x10000, 0x1,     0x1, 0x0,     0x0};
uint32_t spBox1_lo[16] __attribute__((aligned(64))) = {
    0x0,     0x2,     0x20000, 0x20002, 0x2, 0x0,     0x20000, 0x2,
    0x20002, 0x20000, 0x20002, 0x0,     0x0, 0x20002, 0x2,     0x20000};
uint32_t spBox1_hi[16] __attribute__((aligned(64))) = {
    0x20002, 0x2,     0x2,     0x20000, 0x20000, 0x0, 0x20000, 0x20002,
    0x0,     0x20002, 0x20002, 0x20000, 0x2,     0x2, 0x0,     0x0};
uint32_t spBox2_lo[16] __attribute__((aligned(64))) = {
    0x0,     0x4,     0x40000, 0x40004, 0x4, 0x0,     0x40000, 0x4,
    0x40004, 0x40000, 0x40004, 0x0,     0x0, 0x40004, 0x4,     0x40000};
uint32_t spBox2_hi[16] __attribute__((aligned(64))) = {
    0x40004, 0x4,     0x4,     0x40000, 0x40000, 0x0, 0x40000, 0x40004,
    0x0,     0x40004, 0x40004, 0x40000, 0x4,     0x4, 0x0,     0x0};
uint32_t spBox3_lo[16] __attribute__((aligned(64))) = {
    0x0,     0x8,     0x80000, 0x80008, 0x8, 0x0,     0x80000, 0x8,
    0x80008, 0x80000, 0x80008, 0x0,     0x0, 0x80008, 0x8,     0x80000};
uint32_t spBox3_hi[16] __attribute__((aligned(64))) = {
    0x80008, 0x8,     0x8,     0x80000, 0x80000, 0x0, 0x80000, 0x80008,
    0x0,     0x80008, 0x80008, 0x80000, 0x8,     0x8, 0x0,     0x0};
uint32_t spBox4_lo[16] __attribute__((aligned(64))) = {
    0x0,      0x10,     0x100000, 0x100010, 0x10, 0x0,      0x100000, 0x10,
    0x100010, 0x100000, 0x100010, 0x0,      0x0,  0x100010, 0x10,     0x100000};
uint32_t spBox4_hi[16] __attribute__((aligned(64))) = {
    0x100010, 0x10,     0x10,     0x100000, 0x100000, 0x0,  0x100000, 0x100010,
    0x0,      0x100010, 0x100010, 0x100000, 0x10,     0x10, 0x0,      0x0};
uint32_t spBox5_lo[16] __attribute__((aligned(64))) = {
    0x0,      0x20,     0x200000, 0x200020, 0x20, 0x0,      0x200000, 0x20,
    0x200020, 0x200000, 0x200020, 0x0,      0x0,  0x200020, 0x20,     0x200000};
uint32_t spBox5_hi[16] __attribute__((aligned(64))) = {
    0x200020, 0x20,     0x20,     0x200000, 0x200000, 0x0,  0x200000, 0x200020,
    0x0,      0x200020, 0x200020, 0x200000, 0x20,     0x20, 0x0,      0x0};
uint32_t spBox6_lo[16] __attribute__((aligned(64))) = {
    0x0,      0x40,     0x400000, 0x400040, 0x40, 0x0,      0x400000, 0x40,
    0x400040, 0x400000, 0x400040, 0x0,      0x0,  0x400040, 0x40,     0x400000};
uint32_t spBox6_hi[16] __attribute__((aligned(64))) = {
    0x400040, 0x40,     0x40,     0x400000, 0x400000, 0x0,  0x400000, 0x400040,
    0x0,      0x400040, 0x400040, 0x400000, 0x40,     0x40, 0x0,      0x0};
uint32_t spBox7_lo[16] __attribute__((aligned(64))) = {
    0x0,      0x80,     0x800000, 0x800080, 0x80, 0x0,      0x800000, 0x80,
    0x800080, 0x800000, 0x800080, 0x0,      0x0,  0x800080, 0x80,     0x800000};
uint32_t spBox7_hi[16] __attribute__((aligned(64))) = {
    0x800080, 0x80,     0x80,     0x800000, 0x800000, 0x0,  0x800000, 0x800080,
    0x0,      0x800080, 0x800080, 0x800000, 0x80,     0x80, 0x0,      0x0};
uint32_t spBox8_lo[16] __attribute__((aligned(64))) = {
    0x0,       0x100,     0x1000000, 0x1000100, 0x100,     0x0,
    0x1000000, 0x100,     0x1000100, 0x1000000, 0x1000100, 0x0,
    0x0,       0x1000100, 0x100,     0x1000000};
uint32_t spBox8_hi[16] __attribute__((aligned(64))) = {
    0x1000100, 0x100,     0x100, 0x100000,  0x1000000, 0x0,
    0x1000000, 0x1000100, 0x0,   0x1000100, 0x1000100, 0x1000000,
    0x100,     0x100,     0x0,   0x0};
uint32_t spBox9_lo[16] __attribute__((aligned(64))) = {
    0x0,       0x200,     0x2000000, 0x2000200, 0x200,     0x0,
    0x2000000, 0x200,     0x2000200, 0x2000000, 0x2000200, 0x0,
    0x0,       0x2000200, 0x200,     0x2000000};
uint32_t spBox9_hi[16] __attribute__((aligned(64))) = {
    0x2000200, 0x200,     0x200, 0x2000000, 0x2000000, 0x0,
    0x2000000, 0x2000200, 0x0,   0x2000200, 0x2000200, 0x2000000,
    0x200,     0x200,     0x0,   0x0};
uint32_t spBox10_lo[16] __attribute__((aligned(64))) = {
    0x0,       0x400,     0x4000000, 0x4000400, 0x400,     0x0,
    0x4000000, 0x400,     0x4000400, 0x4000000, 0x4000400, 0x0,
    0x0,       0x4000400, 0x400,     0x4000000};
uint32_t spBox10_hi[16] __attribute__((aligned(64))) = {
    0x4000400, 0x400,     0x400, 0x4000000, 0x4000000, 0x0,
    0x4000000, 0x4000400, 0x0,   0x4000400, 0x4000400, 0x4000000,
    0x400,     0x400,     0x0,   0x0};
uint32_t spBox11_lo[16] __attribute__((aligned(64))) = {
    0x0,       0x800,     0x8000000, 0x8000800, 0x800,     0x0,
    0x8000000, 0x800,     0x8000800, 0x8000000, 0x8000800, 0x0,
    0x0,       0x8000800, 0x800,     0x8000000};
uint32_t spBox11_hi[16] __attribute__((aligned(64))) = {
    0x8000800, 0x800,     0x800, 0x8000000, 0x8000000, 0x0,
    0x8000000, 0x8000800, 0x0,   0x8000800, 0x8000800, 0x8000000,
    0x800,     0x800,     0x0,   0x0};
uint32_t spBox12_lo[16] __attribute__((aligned(64))) = {
    0x0,        0x1000,     0x10000000, 0x10001000, 0x1000,     0x0,
    0x10000000, 0x1000,     0x10001000, 0x10000000, 0x10001000, 0x0,
    0x0,        0x10001000, 0x1000,     0x10000000};
uint32_t spBox12_hi[16] __attribute__((aligned(64))) = {
    0x10001000, 0x1000,     0x1000, 0x10000000, 0x10000000, 0x0,
    0x10000000, 0x10001000, 0x0,    0x10001000, 0x10001000, 0x10000000,
    0x1000,     0x1000,     0x0,    0x0};
uint32_t spBox13_lo[16] __attribute__((aligned(64))) = {
    0x0,        0x2000,     0x20000000, 0x20002000, 0x2000,     0x0,
    0x20000000, 0x2000,     0x20002000, 0x20000000, 0x20002000, 0x0,
    0x0,        0x20002000, 0x2000,     0x20000000};
uint32_t spBox13_hi[16] __attribute__((aligned(64))) = {
    0x20002000, 0x2000,     0x2000, 0x20000000, 0x20000000, 0x0,
    0x20000000, 0x20002000, 0x0,    0x20002000, 0x20002000, 0x20000000,
    0x2000,     0x2000,     0x0,    0x0};
uint32_t spBox14_lo[16] __attribute__((aligned(64))) = {
    0x0,        0x4000,     0x40000000, 0x40004000, 0x4000,     0x0,
    0x40000000, 0x4000,     0x40004000, 0x40000000, 0x40004000, 0x0,
    0x0,        0x40004000, 0x4000,     0x40000000};
uint32_t spBox14_hi[16] __attribute__((aligned(64))) = {
    0x40004000, 0x4000,     0x4000, 0x40000000, 0x40000000, 0x0,
    0x40000000, 0x40004000, 0x0,    0x40004000, 0x40004000, 0x40000000,
    0x4000,     0x4000,     0x0,    0x0};
uint32_t spBox15_lo[16] __attribute__((aligned(64))) = {
    0x0,        0x8000,     0x80000000, 0x80008000, 0x8000,     0x0,
    0x80000000, 0x8000,     0x80008000, 0x80000000, 0x80008000, 0x0,
    0x0,        0x80008000, 0x8000,     0x80000000};
uint32_t spBox15_hi[16] __attribute__((aligned(64))) = {
    0x80008000, 0x8000,     0x8000, 0x80000000, 0x80000000, 0x0,
    0x80000000, 0x80008000, 0x0,    0x80008000, 0x80008000, 0x80000000,
    0x8000,     0x8000,     0x0,    0x0};
uint8_t sBox4[16]
    __attribute__((aligned(64))) = {0xc, 0x5, 0x6, 0xb, 0x9, 0x0, 0xa, 0xd,
                                    0x3, 0xe, 0xf, 0x8, 0x4, 0x7, 0x1, 0x2};

#define SPLayer(SPtable_lo, SPtable_hi, index)                                 \
    {                                                                          \
        sboxvalue = (state >> index) & 0xF;                                    \
        state_lo ^= (SPtable_lo[sboxvalue]);                                   \
        state_hi ^= (SPtable_hi[sboxvalue]);                                   \
    }

void PRESENT_encrypt(uint8_t *roundKeys, uint8_t *block) {
    uint8_t round = 0;
    uint64_t state = *(uint64_t *)block;

    /* Encryption */
    for (round = 0; round < 32; round++) {
        /* addRoundkey */
        uint32_t subkey_lo = (((uint32_t *)roundKeys)[2 * round]);
        uint32_t subkey_hi = (((uint32_t *)roundKeys)[2 * round + 1]);
        state ^= (uint64_t)subkey_lo ^ (((uint64_t)subkey_hi) << 32);

        /* sBoxLayer */
        uint8_t sboxvalue;
        uint64_t state_lo = 0;
        uint64_t state_hi = 0;
        SPLayer(spBox0_lo, spBox0_hi, 0);
        SPLayer(spBox1_lo, spBox1_hi, 4);
        SPLayer(spBox2_lo, spBox2_hi, 8);
        SPLayer(spBox3_lo, spBox3_hi, 12);
        SPLayer(spBox4_lo, spBox4_hi, 16);
        SPLayer(spBox5_lo, spBox5_hi, 20);
        SPLayer(spBox6_lo, spBox6_hi, 24);
        SPLayer(spBox7_lo, spBox7_hi, 28);
        SPLayer(spBox8_lo, spBox8_hi, 32);
        SPLayer(spBox9_lo, spBox9_hi, 36);
        SPLayer(spBox10_lo, spBox10_hi, 40);
        SPLayer(spBox11_lo, spBox11_hi, 44);
        SPLayer(spBox12_lo, spBox12_hi, 48);
        SPLayer(spBox13_lo, spBox13_hi, 52);
        SPLayer(spBox14_lo, spBox14_hi, 56);
        SPLayer(spBox15_lo, spBox15_hi, 60);

        state = (state_hi << 32) ^ state_lo;
    }

    /* addRoundkey (Round 31) */
    uint32_t subkey_lo = (((uint32_t *)roundKeys)[62]);
    uint32_t subkey_hi = (((uint32_t *)roundKeys)[63]);
    state ^= (uint64_t)subkey_lo ^ (((uint64_t)subkey_hi) << 32);

    *(uint64_t *)block = state;
}

void RunEncryptionKeySchedule(uint8_t *key, uint8_t *roundKeys) {
    /*
     * 	The following instructions are failing on ARMv7-M using the
     * arm-none-eabi-g++ (Sourcery CodeBench Lite 2014.05-28) 4.8.3 20140320
     * (prerelease) compiler because of the optimizer is grouping the 2 memory
     * accesses in one LDRD instruction. However the 2 memory addresses are not
     * aligned on 64-bit boundaries and the instruction causes an UNALIGN_TRAP
     * (which can not be disabled for LDRD instruction):
     * 		uint64_t keylow = *(uint64_t *)key;
     * 		uint64_t keyhigh = *(uint64_t*)(key + 2);
     *
     *	The next 3 lines replace the wrong instruction sequence:
     * 		uint64_t keylow = *(uint64_t *)key;
     * 		uint16_t highBytes = *(uint16_t *)(key + 8);
     * 		uint64_t keyhigh = ((uint64_t)(highBytes) << 48) | (keylow >>
     *16);
     *
     */
    uint64_t keylow = *(uint64_t *)key;
    uint16_t highBytes = *(uint16_t *)(key + 8);
    uint64_t keyhigh = ((uint64_t)(highBytes) << 48) | (keylow >> 16);

    uint64_t temp;
    uint8_t round;

#pragma unroll
    for (round = 0; round < 32; round++) {
        /* 61-bit left shift */
        ((uint64_t *)roundKeys)[round] = keyhigh;
        temp = keyhigh;
        keyhigh <<= 61;
        keyhigh |= (keylow << 45);
        keyhigh |= (temp >> 19);
        keylow = (temp >> 3) & 0xFFFF;

        /* S-Box application */
        temp = keyhigh >> 60;
        keyhigh &= 0x0FFFFFFFFFFFFFFF;
        temp = (sBox4[temp]);
        keyhigh |= temp << 60;

        /* round counter addition */
        keylow ^= (((uint64_t)(round + 1) & 0x01) << 15);
        keyhigh ^= ((uint64_t)(round + 1) >> 1);
    }
}