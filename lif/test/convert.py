#!/usr/bin/env python3
import struct
import sys

input_file = sys.argv[1] + '.txt'
output_file = sys.argv[1] + '.bin'

binary = []
with open(input_file, 'r') as f:
    for line in f:
        binary += list(map(
            lambda x: struct.pack('i', int(x, 0)),
            line.strip().split()
            # lambda x: struct.pack('c', x.encode('ascii')),
            # line.strip()
        ))

with open(output_file, 'wb') as f:
    for x in binary: f.write(x)
