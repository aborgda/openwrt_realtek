#!/usr/bin/env python3
"""Pack a KT510 RTL8198 factory image from the verified 16 MiB dump layout.

Layout:
  0x000000-0x010fff : reserved/bootloader area
  0x011000          : cr6c kernel header
  0x011000+         : kernel payload + 16-bit checksum
  0x411000          : raw SquashFS rootfs (hsqs)
  0x1000000         : end of 16 MiB SPI-NOR
"""
import struct
import sys

FLASH_SIZE = 0x1000000
KERNEL_BURN = 0x11000
ROOTFS_BURN = 0x411000
KERNEL_START = 0x80A00000

if len(sys.argv) != 4:
    raise SystemExit("usage: kt510-pack.py <kernel> <rootfs> <output>")

kernel = open(sys.argv[1], "rb").read()
rootfs = open(sys.argv[2], "rb").read()

def checksum_payload(data):
    if len(data) & 1:
        data += b"\xff"
    total = sum(struct.unpack(">H", data[i:i+2])[0]
                for i in range(0, len(data), 2)) & 0xffff
    data += struct.pack(">H", (-total) & 0xffff)
    return data

payload = checksum_payload(kernel)
block = struct.pack(">4sIII", b"cr6c", KERNEL_START, KERNEL_BURN, len(payload)) + payload

if len(block) + KERNEL_BURN > ROOTFS_BURN:
    raise SystemExit("kernel image overlaps KT510 rootfs offset 0x411000")
if ROOTFS_BURN + len(rootfs) > FLASH_SIZE:
    raise SystemExit("rootfs does not fit in 16 MiB KT510 flash")

out = bytearray(b"\xff" * FLASH_SIZE)
out[KERNEL_BURN:KERNEL_BURN + len(block)] = block
out[ROOTFS_BURN:ROOTFS_BURN + len(rootfs)] = rootfs
open(sys.argv[3], "wb").write(out)
