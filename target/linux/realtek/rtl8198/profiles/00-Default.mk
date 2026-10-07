# SPDX-License-Identifier: GPL-2.0-only

define Profile/Default
  NAME:=Generic RTL8198
  PACKAGES:=-wpad-mini
endef

define Profile/Default/Description
  Realtek RTL8198 SoC. Board-specific flash/GPIO/PCIe data must be supplied
  by the board image definition before a factory image is generated.
endef

$(eval $(call Profile,Default))

define Profile/KT510
  NAME:=KT510 (RTL8198 + RTL8192ER + RTL8812AR, 16 MiB)
  PACKAGES:=-wpad-mini
endef

define Profile/KT510/Description
  KT510 board: Realtek RTL8198, RTL8192ER 2.4 GHz PCIe radio,
  RTL8812AR 5 GHz PCIe radio, 16 MiB SPI-NOR flash.
  Factory image support remains gated on the verified RTL8198 board
  loader/header/GPIO/PCIe definitions.
endef

$(eval $(call Profile,KT510))
