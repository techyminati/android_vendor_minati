#
# Copyright (C) 2022 Vaisakh Murali
# SPDX-License-Identifer: Apache-2.0
#
LOCAL_PATH := vendor/minati/fonts

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/ttf,$(TARGET_COPY_OUT_PRODUCT)/fonts)
