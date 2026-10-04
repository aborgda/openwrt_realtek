# SPDX-License-Identifier: GPL-2.0-only
SUBTARGET:=rtl8198c
BOARDNAME:=RTL8198C based boards
ARCH_PACKAGES:=realtek_lx53
CPU_TYPE:=lx53

define Target/Description
        Build firmware images for Realtek RTL8198C based boards (GN866 AC).
endef
