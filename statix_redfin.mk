#
# Copyright (C) 2026 StatiXOS
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_BOARD_PLATFORM := lito
INCLUDE_PIXEL_LAUNCHER := true

# Inherit device configuration before the common GMS package set.
$(call inherit-product, device/google/redfin/aosp_redfin.mk)
$(call inherit-product, device/google/redbull/lineage_common.mk)
include device/google/redfin/device-lineage.mk

$(call inherit-product, vendor/gms/products/gms.mk)
$(call inherit-product, vendor/statix/config/common.mk)
$(call inherit-product, vendor/statix/config/gsm.mk)
$(call inherit-product, vendor/google/redfin/redfin-vendor.mk)

# StatiX and GMS customize the system image inherited from generic_system.
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := false

PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 5
PRODUCT_NAME := statix_redfin

TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="redfin-user 14 UP1A.231105.001.B2 11260668 release-keys" \
    BuildFingerprint=google/redfin/redfin:14/UP1A.231105.001.B2/11260668:user/release-keys \
    DeviceProduct=redfin

# The 4.19 kernel provides the backported BPF features used by Android 17.
PRODUCT_PRODUCT_PROPERTIES += ro.bpf.kver_override=5.10.239
