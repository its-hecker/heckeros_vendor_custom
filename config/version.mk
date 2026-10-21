CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

CUSTOM_PLATFORM_VERSION := 17.0

CUSTOM_VERSION := $(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)
CUSTOM_VERSION_PROP := seventeen

# Preserve upstream identity for PixelOS products; HeckerOS owns its release name.
CUSTOM_VERSION_PREFIX := PixelOS
ifneq ($(filter hecker_%,$(TARGET_PRODUCT)),)
CUSTOM_VERSION_PREFIX := HeckerOS
endif

# Platform version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.version=$(CUSTOM_VERSION_PREFIX)_$(CUSTOM_VERSION) \
    net.pixelos.version=$(CUSTOM_VERSION_PROP)

# Updater
ifeq ($(IS_OFFICIAL),true)
ifeq ($(filter hecker_%,$(TARGET_PRODUCT)),)
    PRODUCT_PRODUCT_PROPERTIES += \
        net.pixelos.build_type=ci
endif
endif
