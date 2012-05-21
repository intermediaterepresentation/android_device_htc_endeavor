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


# NEED TO ADD acp_recvy and miniunz for some reason

# # This device is xhdpi.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += xhdpi

# Init files
PRODUCT_COPY_FILES := \
        device/htc/endeavor/init.usb.rc:root/init.usb.rc \
        device/htc/endeavor/init.endeavoru.common.rc:root/init.endeavoru.common.rc \
        device/htc/endeavor/init.endeavoru.rc:root/init.endeavoru.rc \
        device/htc/endeavor/ueventd.rc:root/ueventd.rc \
        device/htc/endeavor/ueventd.endeavoru.rc:root/ueventd.endeavoru.rc

PRODUCT_COPY_FILES += \
		device/htc/endeavor/configs/gps.conf:system/etc/gps.conf \
		device/htc/endeavor/configs/nvcamera.conf:system/etc/nvcamera.conf \
		device/htc/endeavor/configs/asound.conf:system/etc/asound.conf \
		device/htc/endeavor/configs/AIC3008_REG_DualMic_XC.csv:system/etc/AIC3008_REG_DualMic_XC.csv \
		device/htc/endeavor/configs/AIC3008_REG_DualMic.csv:system/etc/AIC3008_REG_DualMic.csv \
		device/htc/endeavor/configs/alsa.conf:system/usr/share/alsa/alsa.conf

# Wifi
PRODUCT_COPY_FILES += \
		device/htc/endeavor/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
		device/htc/endeavor/vold.fstab:system/etc/vold.fstab

# Permissions
PRODUCT_COPY_FILES += \
		device/htc/endeavor/configs/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
		frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
		frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
		frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
		frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
		frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
		frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
		frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
		frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
		frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
		frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml


PRODUCT_COPY_FILES += \
		device/htc/endeavor/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
	    device/htc/endeavor/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
		device/htc/endeavor/usr/idc/tv-touchscreen.idc:system/usr/idc/tv-touchscreen.idc

PRODUCT_PROPERTY_OVERRIDES += \
        ro.sf.lcd_density=320 \
		wifi.interface=wlan0 \
		wifi.softap.interface=wlan1 \
		wifi.softapconcurrent.interface=wlan1

PRODUCT_LOCALES += en


$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, vendor/htc/endeavor/endeavor-vendor.mk)
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
