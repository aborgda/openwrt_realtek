# RTL8198 / RTL8198C port status

Branch: kt510-gn866-realtek8198

Targets:
- KT510: RTL8198 + RTL8192E + RTL8812AR
- GN866 AC: RTL8198C + RTL8192ER + RTL8812BRH

Important: target registration alone is NOT a bootable port.
The current Linux 5.4 Realtek tree has SoC support for RTL8196E/RTL8197D/RTL8197F, not RTL8198/RTL8198C.
Do not flash an image until the RTL8198/RTL8198C kernel/clock/IRQ/GPIO/SPI/PCIe support and board-specific flash layout are verified.

Reference RTK SDK build information documents an rtl8198c defconfig and rtkmips firmware output.
The next porting step is importing/adapting RTL8198/RTL8198C SoC support, then adding verified DTS/image definitions for KT510 and GN866 AC.
