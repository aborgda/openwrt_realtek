// SPDX-License-Identifier: GPL-2.0-only

define Device/sk337
  LOADADDR := 0x80000000
  LOADER_PLATFORM := rtl8198c
  LOADER_TYPE := bin
  LZMA_TEXT_START := 0x84000000
  SOC := rtl8198c
  DEVICE_VENDOR := SK
  DEVICE_MODEL := SK337
  IMAGE_SIZE := 32768k
  DEVICE_DTS := rtl8198c_SK337
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-kernel
endef
TARGET_DEVICES += sk337

define Device/gn866_ac
  LOADADDR := 0x80000000
  LOADER_PLATFORM := rtl8198c
  LOADER_TYPE := bin
  LZMA_TEXT_START := 0x84000000
  SOC := rtl8198c
  DEVICE_VENDOR := GN
  DEVICE_MODEL := GN866 AC
  IMAGE_SIZE := 16384k
  DEVICE_DTS := rtl8198c_GN866
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-kernel
endef
TARGET_DEVICES += gn866_ac
