#
# Copyright (C) 2022 Vaisakh Murali
# SPDX-License-Identifer: Apache-2.0
#

$(call inherit-product, vendor/bromite/bromite.mk)
$(call inherit-product, vendor/lawnchair/lawnchair.mk)

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

# Pixel Charger
## Build system
BUILD_BROKEN_DUP_RULES := true

## Charger
PRODUCT_COPY_FILES += \ $(call find-copy-subdir-files,*,$(LOCAL_PATH)/charger,$(TARGET_COPY_OUT_PRODUCT)/etc/res)