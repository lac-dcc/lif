#!/usr/bin/env python3
import struct
import sys

input_file = sys.argv[1] + '.txt'
output_file = sys.argv[1] + '.bin'

numbers = []
with open(input_file, 'r') as f:
    for line in f:
        numbers += map(lambda x: int(x, 0), line.split())

numbers = list(map(lambda x: struct.pack('i', x), numbers))
with open(output_file, 'wb') as f:
    for x in numbers:
        f.write(x)
