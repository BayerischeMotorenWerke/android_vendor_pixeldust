#
# Copyright (C) 2022 The PixelDust Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Bootanimation
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := Redmi Note 10 Pro
export TARGET_DEVICE := sweet


# Inherit common products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit device configurations
$(call inherit-product, device/xiaomi/sweet/device.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Don't include Google apex use the AOSP variant instead
TARGET_EXCLUDE_GOOGLE_APEX := true

PRODUCT_NAME := pixeldust_sweet
PRODUCT_DEVICE := sweet
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 10 Pro
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="dipper-user 8.1.0 OPM1.171019.011 V9.5.5.0.OEAMIFA release-keys"

BUILD_FINGERPRINT := Xiaomi/dipper/dipper:8.1.0/OPM1.171019.011/V9.5.5.0.OEAMIFA:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="BayerischeMotorenWerke" \
    ro.pixeldust.device="sweet"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(BUILD_DESCRIPTION)"

# Google Apps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
