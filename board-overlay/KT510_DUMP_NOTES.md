# KT510 dump notes

## Requested board

- Model: KT510
- SoC: RTL8198
- 2.4 GHz: RTL8192ER
- 5 GHz: RTL8812AR
- SPI-NOR: 16 MiB (0x1000000)

## Uploaded dump

File: GD25Q128B@WSON8_20251203_145317(1).BIN

Observed size: 16,777,216 bytes (0x1000000), matching a 128-Mbit / 16-MiB SPI-NOR.

SHA-256: c12820ff9ed8c90bbe0ad6d21f59813171988b7a65f560786757d74e4bcdc955

Observed SquashFS signatures:
- 0x00411000
- 0x00811000

The dump also contains Realtek boot/decompression strings and SPI-NOR chip tables.

### Important validation note

The raw dump does not contain plain-text strings for KT510, RTL8198, RTL8192ER, or RTL8812AR. It does contain a boot-string fragment resembling RTL8196c. Therefore this dump is recorded as the KT510 candidate dump, but its board/SoC identity is not yet proven from the binary alone.

Do not flash an image generated from this metadata until the RTL8198 boot header, kernel burn address, GPIO map, PCIe radio reset/power GPIOs, and checksum format are verified against the original KT510 bootloader.

## Image constraint

The KT510 factory image must be limited to 16 MiB and must use the RTL8198-specific boot/header/LZMA-loader format. A generic modern mac80211 image is not sufficient for RTL8192ER + RTL8812AR; the Realtek vendor rtl8192cd/RTK wireless path needs to be carried into the final firmware.
