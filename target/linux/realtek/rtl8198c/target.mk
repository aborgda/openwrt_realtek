# SPDX-License-Identifier: GPL-2.0-only
# GN866 AC legacy build integration
# GN866 build verification requested 2026-10-06
ARCH:=mips
SUBTARGET:=rtl8198c
CPU_TYPE:=lx53
BOARD:=realtek
BOARDNAME:=Realtek MIPS RTL8198C

define Target/Description
  Build firmware images for Realtek RTL8198C + RTL8192ER + RTL8812BRH legacy boards.
endef
