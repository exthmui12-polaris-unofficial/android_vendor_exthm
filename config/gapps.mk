ifneq ($(wildcard vendor/gapps/common/Android.bp),vendor/gapps/common/Android.bp)
$(error EXTHM_GAPPS=true requires the pinned vendor/gapps source)
endif

EXTHM_GAPPS_REQUIRED_FILES := \
    vendor/gapps/common/proprietary/product/priv-app/GmsCore/GmsCore.apk \
    vendor/gapps/common/proprietary/system_ext/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk \
    vendor/gapps/common/proprietary/product/priv-app/Phonesky/Phonesky.apk \
    vendor/gapps/common/proprietary/system_ext/priv-app/SetupWizard/SetupWizard.apk \
    vendor/gapps/common/proprietary/system_ext/priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk \
    vendor/gapps/common/proprietary/product/priv-app/GooglePartnerSetup/GooglePartnerSetup.apk \
    vendor/gapps/common/proprietary/product/priv-app/GoogleRestore/GoogleRestore.apk \
    vendor/gapps/common/proprietary/product/priv-app/ConfigUpdater/ConfigUpdater.apk \
    vendor/gapps/common/proprietary/product/priv-app/AndroidPlatformServices/AndroidPlatformServices.apk \
    vendor/gapps/common/proprietary/product/priv-app/SearchSelector/SearchSelector.apk \
    vendor/gapps/common/proprietary/product/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk \
    vendor/gapps/common/proprietary/product/app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk
$(foreach f,$(EXTHM_GAPPS_REQUIRED_FILES),$(if $(wildcard $(f)),,$(error EXTHM_GAPPS=true missing required file: $(f))))

PRODUCT_SOONG_NAMESPACES += \
    vendor/gapps/common

PRODUCT_COPY_FILES += \
    vendor/exthm/config/gapps/privapp-permissions-google-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-product.xml \
    vendor/exthm/config/gapps/privapp-permissions-google-system-ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-google-system-ext.xml \
    vendor/exthm/config/gapps/default-permissions-google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-google.xml \
    vendor/exthm/config/gapps/split-permissions-google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/split-permissions-google.xml \
    vendor/exthm/config/gapps/google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google.xml \
    vendor/exthm/config/gapps/google-hiddenapi-package-allowlist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google-hiddenapi-package-allowlist.xml \
    vendor/gapps/common/proprietary/product/etc/security/fsverity/gms_fsverity_cert.der:$(TARGET_COPY_OUT_PRODUCT)/etc/security/fsverity/gms_fsverity_cert.der \
    vendor/gapps/common/proprietary/product/etc/security/fsverity/play_store_fsi_cert.der:$(TARGET_COPY_OUT_PRODUCT)/etc/security/fsverity/play_store_fsi_cert.der

PRODUCT_PACKAGES += \
    AndroidPlatformServices \
    ConfigUpdater \
    GmsCore \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    GoogleRestore \
    GoogleServicesFramework \
    Phonesky \
    SearchSelector \
    SetupWizard

PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.gmsversion=12_beta \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    ro.setupwizard.rotation_locked=true \
    setupwizard.theme=glif_v3_light \
    ro.opa.eligible_device=true \
    ro.com.google.clientidbase=android-xiaomi \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent
