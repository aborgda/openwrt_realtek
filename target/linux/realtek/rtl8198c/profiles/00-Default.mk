# SPDX-License-Identifier: GPL-2.0-only

define Profile/Default
  NAME:=Generic RTL8198C
  PACKAGES:=-wpad-mini
endef

define Profile/Default/Description
  Realtek RTL8198C SoC. Board-specific flash/GPIO/PCIe data must be supplied
  by the board image definition before a factory image is generated.
endef

$(eval $(call Profile,Default))
