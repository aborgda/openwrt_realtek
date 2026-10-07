#!/usr/bin/env python3
import struct
import sys

def block(sig, start, burn, data):
    if len(data) & 1:
        data += b"\xff"
    words = sum(struct.unpack(">H", data[i:i+2])[0]
                for i in range(0, len(data), 2)) & 0xffff
    data += struct.pack(">H", (-words) & 0xffff)
    return struct.pack(">4sIII", sig.encode(), start, burn, len(data)) + data

if len(sys.argv) != 4:
    raise SystemExit("usage: rtk-cr6c.py <kernel> <rootfs> <output>")

with open(sys.argv[1], "rb") as f:
    kernel = f.read()
with open(sys.argv[2], "rb") as f:
    rootfs = f.read()

with open(sys.argv[3], "wb") as f:
    f.write(block("cr6c", 0x80500000, 0x00060000, kernel))
    f.write(block("r6cr", 0x00000000, 0x00200000, rootfs))
