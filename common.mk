#
# Copyright (C) 2022 Vaisakh Murali
# Copyright (C) 2022 Aryan Sinha
# SPDX-License-Identifer: Apache-2.0
#

# Warn
$(warning Extra Flavour for build is inherited, if you dont want this stop including vendor/minati/common.mk)

# Build support for extras
PRODUCT_PACKAGES += \
	ThemePicker \
	AOSPDialerExtensions \
	AOSPKeyboardExtensions \
	FrameworkExtensions \
	SystemUIExtensions

# Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

# Set compiler filter "verify" and disable AOT-compilation in dexpreopt
RELAX_USES_LIBRARY_CHECK := true

# Preopt SystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += \
	SystemUI

# Flags
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
WITH_DEXPREOPT_DEBUG_INFO := false
PRODUCT_SYSTEM_SERVER_DEBUG_INFO := false

# Font
include vendor/extensions/fonts/fonts.mk

# Keyguard animation
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.wm.enable_remote_keyguard_animation=0

## Build system
BUILD_BROKEN_DUP_RULES := true

# Pixel Charger
ifeq ($(TARGET_USES_PIXEL_CHARGER), true)
## Charger
PRODUCT_COPY_FILES += \ $(call find-copy-subdir-files,*,$(LOCAL_PATH)/charger,$(TARGET_COPY_OUT_PRODUCT)/etc/res)
endif

# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/media,$(TARGET_COPY_OUT_PRODUCT)/media)

PRODUCT_PRODUCT_PROPERTIES := \
    ro.config.ringtone=Your_new_adventure.ogg \
    ro.config.notification_sound=Eureka.ogg \
    ro.config.alarm_alert=Fresh_start.ogg

PRODUCT_PACKAGES += \
    SoundPickerPrebuilt

# Blur
ifeq ($(TARGET_USES_BLUR), true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1
endif

# ADB
ifeq ($(TARGET_BUILD_VARIANT),user)
    PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif
