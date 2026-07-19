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
$(call inherit-product, vendor/yaap/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := yaap_Spacewar
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

TARGET_CUSTOM_UDFPS := true

WITH_GAPPS := true

WITH_BCR := true

$(call soong_config_set,surfaceflinger,frame_rate_category_high,120)
$(call soong_config_set,surfaceflinger,frame_rate_category_min,60)

SURFACE_FLINGER_BOOST := true

PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/yaap/certs/releasekey

# 2. Bluetooth mainline module SEPolicy signed with your keys (CRITICAL)
PRODUCT_MAINLINE_BLUETOOTH_SEPOLICY_DEV_CERTIFICATES := $(dir $(PRODUCT_DEFAULT_DEV_CERTIFICATE))

# 3. Recovery can verify OTA zips signed with your keys
#PRODUCT_EXTRA_RECOVERY_KEYS := vendor/aosp/keys/releasekey

# Lunaris flags
TARGET_OPTIMIZED_DEXOPT := true
TARGET_SUPPORTED_REFRESH_RATES := 60,90,120
