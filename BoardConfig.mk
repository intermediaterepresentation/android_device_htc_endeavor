#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := 
TARGET_NO_BOOTLOADER := true

# cpu info
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# use endeavor init script
TARGET_PROVIDES_INIT_TARGET_RC := true

# vold
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/fsl-tegra-udc/gadget/lun0/file

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896
BOARD_FLASH_BLOCK_SIZE := 4096

# tegra platform
TARGET_BOARD_PLATFORM := tegra

# graphics
BOARD_EGL_CFG := device/htc/endeavoru/configs/egl.cfg
USE_OPENGL_RENDERER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WLAN_DEVICE := wl12xx_mac80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME     :=  "wl12xx_sdio"

# Kernel building
TIWLAN_MODULES:
	cp device/htc/endeavoru/modules/cfg80211.ko $(KERNEL_MODULES_OUT)
	cp device/htc/endeavoru/modules/mac80211.ko $(KERNEL_MODULES_OUT)
	cp device/htc/endeavoru/modules/wl12xx_sdio.ko $(KERNEL_MODULES_OUT)
	cp device/htc/endeavoru/modules/wl12xx.ko $(KERNEL_MODULES_OUT)
	cp device/htc/endeavoru/modules/compat.ko $(KERNEL_MODULES_OUT)

TARGET_KERNEL_MODULES := TIWLAN_MODULES
TARGET_KERNEL_SOURCE := kernel/htc/endeavor
TARGET_KERNEL_CONFIG :=  endeavoru_android_defconfig
