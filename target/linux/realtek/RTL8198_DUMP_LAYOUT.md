# SK337 / GN866 AC dump-derived layout notes

These values were read from the supplied raw SPI dumps. They are reference
values only until the RTK image header/checksum routine is implemented.

## SK337

- Dump size: 0x02000000 (32 MiB)
- Model strings: RUSH337AC / SK_WiFiGIGAC988
- Observed first boot stub: 0x00000000
- Observed second boot/decompressor copy: approximately 0x00280000
- Aligned SquashFS signatures:
  - 0x00210000, size field 0x0027de8f
  - 0x004d1000, size field 0x0032d31b
  - 0x010d1000, size field 0x00335b2d
- Radios identified from board information: RTL8192ER + RTL8812AR

## GN866 AC

- Dump size: 0x01000000 (16 MiB)
- Observed first boot stub: 0x00000000
- Observed second boot/decompressor copy: approximately 0x00800000
- Aligned SquashFS signatures:
  - 0x00260000, size field 0x00190040
  - 0x009f0000, size field 0x0021d434
- Radios: RTL8192ER + RTL8812BRH/RTL8812AR

## Important

The duplicate hsqs signatures at nearby unaligned addresses are inside
compressed data and are not treated as partition starts.

The dump contains enough evidence to derive board image placement, but it
does not by itself prove the OpenWrt factory header format. The loader must
be matched against the vendor checksum/length routine before a generated image
is considered flash-safe.

Do not use the generic RTL8197D image recipe for either board.
