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

DEVICE_PACKAGE_OVERLAYS := device/htc/endeavoru/overlay

# NEED TO ADD acp_recvy and miniunz for some reason

# # This device is xhdpi.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += en_US xhdpi

# Init files
PRODUCT_COPY_FILES := \
        device/htc/endeavoru/init.usb.rc:root/init.usb.rc \
        device/htc/endeavoru/init.endeavoru.common.rc:root/init.endeavoru.common.rc \
        device/htc/endeavoru/init.endeavoru.rc:root/init.endeavoru.rc \
        device/htc/endeavoru/ueventd.rc:root/ueventd.rc \
        device/htc/endeavoru/ueventd.endeavoru.rc:root/ueventd.endeavoru.rc

PRODUCT_COPY_FILES += \
		device/htc/endeavoru/configs/gps.conf:system/etc/gps.conf \
		device/htc/endeavoru/configs/nvcamera.conf:system/etc/nvcamera.conf \
		device/htc/endeavoru/configs/asound.conf:system/etc/asound.conf \
		device/htc/endeavoru/configs/AIC3008_REG_DualMic_XC.csv:system/etc/AIC3008_REG_DualMic_XC.csv \
		device/htc/endeavoru/configs/AIC3008_REG_DualMic.csv:system/etc/AIC3008_REG_DualMic.csv \
		device/htc/endeavoru/configs/alsa.conf:system/usr/share/alsa/alsa.conf

# Wifi
PRODUCT_COPY_FILES += \
		device/htc/endeavoru/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
		device/htc/endeavoru/vold.fstab:system/etc/vold.fstab

# Lights
PRODUCT_PACKAGES += \
	lights.tegra

# Keyboard
PRODUCT_COPY_FILES += \
		device/htc/endeavoru/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# NFC
PRODUCT_PACKAGES += \
        libnfc \
        libnfc_jni \
        Nfc \
        Tag \
        nfc-extras

PRODUCT_COPY_FILES += \
		vendor/htc/endeavoru/proprietary/lib/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so

# Torch
PRODUCT_PACKAGES += \
    Torch		
		
# Permissions
PRODUCT_COPY_FILES += \
		device/htc/endeavoru/configs/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
		frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
		frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
		frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
		frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
		frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
		frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
		frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
		frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
		frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
		frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
		frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
		frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
		frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml


PRODUCT_COPY_FILES += \
		device/htc/endeavoru/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
	    device/htc/endeavoru/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
		device/htc/endeavoru/usr/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc

# Custom media config for HTC camera
PRODUCT_COPY_FILES += \
		device/htc/endeavoru/configs/media_profiles.xml:system/etc/media_profiles.xml
		
PRODUCT_PROPERTY_OVERRIDES += \
        ro.sf.lcd_density=320 \
		wifi.interface=wlan0 \
		wifi.softap.interface=wlan1 \
		wifi.softapconcurrent.interface=wlan1 \
		persist.sys.usb.config=mass_storage,adb


$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, vendor/htc/endeavoru/endeavoru-vendor.mk)
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
