# Updater
# HeckerOS Official branding does not opt a device into PixelOS's OTA service.
ifeq ($(filter hecker_%,$(TARGET_PRODUCT)),)
ifeq ($(IS_OFFICIAL),true)
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/custom/config/permissions/privapp-permissions-custom.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-custom.xml

endif
endif
