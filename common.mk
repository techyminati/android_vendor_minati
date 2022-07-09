#
# Copyright (C) 2022 Vaisakh Murali
# Copyright (C) 2022 Aryan Sinha
# SPDX-License-Identifer: Apache-2.0
#


# Build support for extras
PRODUCT_PACKAGES += \
	Camera \
	ThemePicker \
	AOSPDialerExtensions \
	AOSPKeyboardExtensions \
	FrameworkExtensions \
	SystemUIExtensions

# Preopt SystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += \
	SystemUI

# Flags
ifeq ($(TARGET_BUILD_VARIANT), user)
	PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
	PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
	WITH_DEXPREOPT_DEBUG_INFO := false
	PRODUCT_SYSTEM_SERVER_DEBUG_INFO := false
endif

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
