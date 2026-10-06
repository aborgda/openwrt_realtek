# SPDX-License-Identifier: GPL-2.0-only
ARCH:=mips
SUBTARGET:=rtl8198c
CPU_TYPE:=24kc
BOARD:=realtek
BOARDNAME:=Realtek MIPS RTL8198C
KERNEL_PATCHVER:=3.10.24

define Target/Description
  Build firmware images for Realtek RTL8198C + RTL8192ER + RTL8812BRH legacy boards.
endef
