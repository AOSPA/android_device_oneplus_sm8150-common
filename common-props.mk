# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.deep_buffer.media=true \
    audio.offload.buffer.size.kb=32 \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=true \
    av.offload.enable=true \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.vendor.audio.hac.enable=false \
    persist.vendor.audio_hal.dsp_bit_width_enforce_mode=24 \
    ro.af.client_heap_size_kbyte=7168 \
    ro.qc.sdk.audio.fluencetype=none \
    ro.qc.sdk.audio.ssr=false \
    use.voice.path.for.pcm.voip=true \
    ro.audio.monitorRotation=true \
    persist.vendor.audio.hac.enable=false

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bt.max.hfpclient.connections=1 \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    persist.vendor.btstack.enable.splita2dp=true \
    ro.bluetooth.library_name=libbluetooth_qti.so \
    vendor.bluetooth.soc=cherokee \
    persist.vendor.btstack.enable.twsplus=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.oissr.debug=0 \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.oneplus.factorymode,com.oneplus.camera,com.oneplus.healthcheck \
    persist.vendor.camera.privapp.list=com.oneplus.camera

# CNE / DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1 \
    persist.vendor.dpm.feature=9

# Data modules
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.df.dev_name=rmnet_usb0 \
    persist.data.iwlan.enable=true \
    persist.vendor.data.mode=concurrent \
    persist.vendor.data.iwlan.enable=true \
    ro.vendor.use_data_netmgrd=true

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.enable_rotator_ui=1 \
    ro.sensor.not_support_rbg=1 \
    ro.vendor.sensor.not_support_rbg=1

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.enable_hwc_vds=1 \
    persist.sys.force_sw_gles=1 \
    ro.kernel.qemu.gles=0 \
    persist.vendor.color.matrix=2

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    media.settings.xml=/vendor/etc/media_profiles_vendor.xml \
    media.stagefright.audio.deep=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mm.enable.smoothstreaming=true \
    mmp.enable.3g2=true \
    persist.mm.enable.prefetch=true \
    vendor.mm.enable.qcom_parser=67092479 \
    vendor.vidc.debug.level=1 \
    vendor.swvdec.log.level=1

# Netflix
ro.netflix.bsp_rev=Q855-16947-1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.at_library=libqti-at.so \
    ro.vendor.qti.core_ctl_max_cpu=4 \
    ro.vendor.qti.core_ctl_min_cpu=2 \
    ro.vendor.qti.sys.fw.bservice_age=5000 \
    ro.vendor.qti.sys.fw.bservice_enable=true \
    ro.vendor.qti.sys.fw.bservice_limit=8

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    persist.data.iwlan.enable=true \
    persist.radio.multisim.config=dsds \
    persist.vendor.data.iwlan.enable=true \
    persist.vendor.data.mode=concurrent \
    persist.vendor.radio.5g_mode_pref=0 \
    persist.vendor.radio.bar_fake_gcell=1 \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.ignore_dom_time=10 \
    ril.subscription.types=NV,RUIM \
    rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    ro.telephony.default_network=22,22 \
    ro.vendor.use_data_netmgrd=true \
    telephony.lteOnCdmaDevice=1,1 \
    persist.radio.efssync=true \
    persist.vendor.radio.arfcn_test_mode=3 \
    persist.radio.enhance_ecall=true \
    persist.netmon.linger=5000 \
    persist.rcs.supported=1 \
    persist.vendor.radio.apm_sim_not_pwdn=1

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.naruto.light.support=false

# Time
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# WiFi / WFD
PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_rtt=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \

# Wipower
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.emb_wp_mode=false \
    ro.bluetooth.wipower=false

# OnePlus sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sensor.pickup=oneplus.sensor.pickup \
    ro.sensor.pocket=oneplus.sensor.pocket
