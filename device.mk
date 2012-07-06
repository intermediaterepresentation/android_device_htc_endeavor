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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Set secure on user builds
ifeq ($(TARGET_BUILT_VARIANT),user)
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=1
else
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0
endif

# # This device is xhdpi.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += en_US xhdpi

# Init files
PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/ramdisk/init:root/init \
	$(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
	$(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.endeavoru.rc:root/init.endeavoru.rc \
	$(LOCAL_PATH)/ramdisk/init.endeavoru.common.rc:root/init.endeavoru.common.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.endeavoru.rc:root/ueventd.endeavoru.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/configs/hostapd.conf:system/etc/wifi/hostapd.conf \
	$(LOCAL_PATH)/configs/nvcamera.conf:system/etc/nvcamera.conf \
	$(LOCAL_PATH)/configs/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/configs/AIC3008_REG_DualMic_XC.csv:system/etc/AIC3008_REG_DualMic_XC.csv \
	$(LOCAL_PATH)/configs/AIC3008_REG_DualMic.csv:system/etc/AIC3008_REG_DualMic.csv \
	$(LOCAL_PATH)/configs/alsa.conf:system/usr/share/alsa/alsa.conf

# GPS Certificate
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/SuplRootCert:system/etc/SuplRootCert

# Wifi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	TQS_D_1.7.ini \
	calibrator

# Modules
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/modules/baseband_usb_chr.ko:system/lib/modules/baseband_usb_chr.ko \
	$(LOCAL_PATH)/prebuilt/modules/baseband-xmm-power2.ko:system/lib/modules/baseband-xmm-power2.ko \
	$(LOCAL_PATH)/prebuilt/modules/bluetooth.ko:system/lib/modules/bluetooth.ko \
	$(LOCAL_PATH)/prebuilt/modules/bnep.ko:system/lib/modules/bnep.ko \
	$(LOCAL_PATH)/prebuilt/modules/btwilink.ko:system/lib/modules/btwilink.ko \
	$(LOCAL_PATH)/prebuilt/modules/cavm_sqos_mod.ko:system/lib/modules/cavm_sqos_mod.ko \
	$(LOCAL_PATH)/prebuilt/modules/cdc-acm.ko:system/lib/modules/cdc-acm.ko \
	$(LOCAL_PATH)/prebuilt/modules/cfg80211.ko:system/lib/modules/cfg80211.ko \
	$(LOCAL_PATH)/prebuilt/modules/compat.ko:system/lib/modules/compat.ko \
	$(LOCAL_PATH)/prebuilt/modules/fm_drv.ko:system/lib/modules/fm_drv.ko \
	$(LOCAL_PATH)/prebuilt/modules/gps_drv.ko:system/lib/modules/gps_drv.ko \
	$(LOCAL_PATH)/prebuilt/modules/hci_uart.ko:system/lib/modules/hci_uart.ko \
	$(LOCAL_PATH)/prebuilt/modules/hid-magicmouse.ko:system/lib/modules/hid-magicmouse.ko \
	$(LOCAL_PATH)/prebuilt/modules/hidp.ko:system/lib/modules/hidp.ko \
	$(LOCAL_PATH)/prebuilt/modules/htc_sqos_ctrlmsg.ko:system/lib/modules/htc_sqos_ctrlmsg.ko \
	$(LOCAL_PATH)/prebuilt/modules/htc_sqos_encoder.ko:system/lib/modules/htc_sqos_encoder.ko \
	$(LOCAL_PATH)/prebuilt/modules/htc_sqos_wifi.ko:system/lib/modules/htc_sqos_wifi.ko \
	$(LOCAL_PATH)/prebuilt/modules/kineto_gan.ko:system/lib/modules/kineto_gan.ko \
	$(LOCAL_PATH)/prebuilt/modules/lib80211.ko:system/lib/modules/lib80211.ko \
	$(LOCAL_PATH)/prebuilt/modules/mac80211.ko:system/lib/modules/mac80211.ko \
	$(LOCAL_PATH)/prebuilt/modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
	$(LOCAL_PATH)/prebuilt/modules/rfcomm.ko:system/lib/modules/rfcomm.ko \
	$(LOCAL_PATH)/prebuilt/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
	$(LOCAL_PATH)/prebuilt/modules/st_drv.ko:system/lib/modules/st_drv.ko \
	$(LOCAL_PATH)/prebuilt/modules/tcrypt.ko:system/lib/modules/tcrypt.ko \
	$(LOCAL_PATH)/prebuilt/modules/ti_hci_drv.ko:system/lib/modules/ti_hci_drv.ko \
	$(LOCAL_PATH)/prebuilt/modules/wl12xx.ko:system/lib/modules/wl12xx.ko \
	$(LOCAL_PATH)/prebuilt/modules/wl12xx_sdio.ko:system/lib/modules/wl12xx_sdio.ko

# Vold
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# Lights
PRODUCT_PACKAGES += \
	lights.tegra

# Keyboard
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# NFC
PRODUCT_PACKAGES += \
	libnfc \
	libnfc_jni \
	Nfc \
	Tag \
	com.android.nfc_extras \
	com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

# a2dp
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	libaudioutils \
	libtinyalsa	

# NFC firmware
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/lib/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so

# TripNRaver's libmedia + libaudioflinger
# Part of the echo fix (stops camera from breaking)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/lib/libmedia.so:system/lib/libmedia.so \
	$(LOCAL_PATH)/prebuilt/lib/libaudioflinger.so:system/lib/libaudioflinger.so

# Modified libcamera_client (ignores invalid face recognition parcels)
# see https://github.com/tgascoigne/android_frameworks_base/commit/3f0067e
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/lib/libcamera_client.so:system/lib/libcamera_client.so

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# Torch
PRODUCT_PACKAGES += \
	Torch		
		
# Permissions
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml


PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc

# Custom media config for HTC camera
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320 \
	wifi.interface=wlan0 \
	wifi.softap.interface=wlan1 \
	wifi.softapconcurrent.interface=wlan1 \
	persist.sys.usb.config=mass_storage,adb

$(call inherit-product-if-exists, hardware/ti/wan/mac80211/Android.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, vendor/htc/endeavoru/endeavoru-vendor.mk)
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
