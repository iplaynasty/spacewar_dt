#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from Spacewar device
$(call inherit-product, device/nothing/Spacewar/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_Spacewar
PRODUCT_DEVICE := Spacewar
PRODUCT_BRAND := Nothing
PRODUCT_MODEL := A063
PRODUCT_MANUFACTURER := Nothing

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_GMS_CLIENTID_BASE := android-nothing

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=Spacewar \
    BuildFingerprint="Nothing/Spacewar/Spacewar:15/AQ3A.240929.001/2604161140:user/release-keys"

# Blur
TARGET_ENABLE_BLUR := true

# Boot Animation
TARGET_BOOT_ANIMATION_RES := 1080

#axion_flags
#Camera information (multiple sensors supported)
AXION_CAMERA_REAR_INFO := 50,50
AXION_CAMERA_FRONT_INFO := 16

# Maintainer name (underscores become spaces in the UI)
AXION_MAINTAINER := iplaynasty

# Processor name (underscores become spaces)
AXION_PROCESSOR := Snapdragon_778G+

TARGET_DISABLE_EPPE := true
TARGET_INCLUDE_AXFX := true
TARGET_DISABLES_LIBPERF ?= false

TARGET_NEEDS_DOZE_FIX := false
TARGET_DOZE_TAP_PULSE_SUPPORTED := true
TARGET_DOZE_DOUBLE_TAP_PULSE_SUPPORTED := true
TARGET_DOZE_PICKUP_PULSE_SUPPORTED := true
TARGET_DOZE_SIDE_FPS_PULSE_SUPPORTED := false

TARGET_OPTIMIZED_DEXOPT := true
TARGET_SUPPORTED_REFRESH_RATES := 60,90,120

WITH_BCR := true
TARGET_CUSTOM_UDFPS := true

$(call soong_config_set,surfaceflinger,frame_rate_category_high,120)
$(call soong_config_set,surfaceflinger,frame_rate_category_min,60)

SURFACE_FLINGER_BOOST := true

PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/axion/certs/releasekey

# 2. Bluetooth mainline module SEPolicy signed with your keys (CRITICAL)
PRODUCT_MAINLINE_BLUETOOTH_SEPOLICY_DEV_CERTIFICATES := $(dir $(PRODUCT_DEFAULT_DEV_CERTIFICATE))
