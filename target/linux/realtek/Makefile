#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=mips
BOARD:=realtek
BOARDNAME:=Realtek
SUBTARGETS:=rtl8197d rtl8196e rtl8197f rtl8198 rtl8198c
FEATURES:=squashfs gpio
MAINTAINER:=Anlix <contato@anlix.io>

KERNEL_PATCHVER:=5.4
ifeq ($(CONFIG_TARGET_realtek_rtl8198c),y)
KERNEL_PATCHVER:=3.10.24
endif

define Target/Description
	Build firmware images for Realtek based boards.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += \
        kmod-gpio-button-hotplug swconfig

$(eval $(call BuildTarget))
