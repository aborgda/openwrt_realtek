# RTL8198 / RTL8198C board port

This branch contains the target registration for the following boards:

| Board | SoC | 2.4 GHz | 5 GHz |
|---|---|---|---|
| SK337 | RTL8198C | RTL8192ER | RTL8812AR |
| GN866 AC | RTL8198C | RTL8192ER | RTL8812BRH / RTL8812AR |

## Safety rule

Do not generate a factory/sysupgrade image until the RTL8198/RTL8198C
kernel support and board-specific boot format have been verified.

The existing Realtek 5.4 tree in this repository supports RTL8196E,
RTL8197D and RTL8197F. Registering a new subtarget alone does not add:

- RTL8198/8198C CPU, IRQ and clock support
- SPI/NOR controller support and flash mapping
- Ethernet MAC/PHY setup
- PCIe host support for the two wireless cards
- board GPIO/LED/reset definitions
- the board-specific RTK/LZMA image header and loader addresses

The SK337 and GN866 dumps are the authoritative references for those values.
They must be parsed before writing the final factory image.

## Wireless

The board definitions identify the radios but do not pretend that generic
mac80211 support replaces the Realtek 8192ER/8812AR/8812BRH board integration.
Wireless calibration/EEPROM data must remain board-specific.

## Next build gate

A valid firmware build requires all of the following:

1. CONFIG_SOC_RTL8198 / CONFIG_SOC_RTL8198C
2. the corresponding MIPS platform code
3. board-specific GPIO/LED/reset definitions
4. the RTL8198 LZMA loader implementation
5. the exact dump-derived image header/checksum format
6. board image definitions for SK337 and GN866 AC

Only after those checks pass should factory.bin be emitted.
sysupgrade.bin must not be enabled until an existing OpenWrt installation
path is verified.
