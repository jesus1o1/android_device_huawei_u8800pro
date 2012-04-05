#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

MANUFACTURER=huawei
DEVICE=u8800pro

rm -rf ../../../vendor/$MANUFACTURER

mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/data/cdrom
mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/app
mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/bin
mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/etc
mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib/egl

adb pull /data/cdrom/autorun.iso ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/data/cdrom

adb pull /system/bin/rmt_storage ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/bin
adb pull /system/bin/rmt_oeminfo ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/bin
adb pull /system/bin/hw_diag_app ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/bin
adb pull /system/bin/oem_rpc_svc ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/bin

adb pull /system/etc/firmware ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/etc/firmware

adb pull /system/etc/media_profiles.xml ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/etc

adb pull /system/lib/libaudio.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib
adb pull /system/lib/libaudioalsa.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib
adb pull /system/lib/libaudioeq.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib
adb pull /system/lib/libcamera.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib
adb pull /system/lib/libgemini.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib
adb pull /system/lib/libgsl.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib

adb pull /system/lib/egl/libEGL_adreno200.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib/egl
adb pull /system/lib/egl/libGLESv1_CM_adreno200.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib/egl
adb pull /system/lib/egl/libGLESv2_adreno200.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib/egl
adb pull /system/lib/egl/libq3dtools_adreno200.so ../../../vendor/$MANUFACTURER/$DEVICE/proprietary/system/lib/egl

(cat << EOF) | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/$MANUFACTURER/$DEVICE/$DEVICE-vendor-blobs.mk
# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/libcamera.so:obj/lib/libcamera.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/libaudioalsa.so:obj/lib/libaudioalsa.so

# All the blobs necessary for u8800

# data/cdrom from u8800
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/data/cdrom/autorun.iso:/data/cdrom/autorun.iso

# system/bin from U8800
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/bin/rmt_storage:/system/bin/rmt_storage \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/bin/rmt_oeminfo:/system/bin/rmt_oeminfo \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/bin/hw_diag_app:/system/bin/hw_diag_app \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/bin/oem_rpc_svc:/system/bin/oem_rpc_svc

# system/etc from U8800
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/media_profiles.xml:/system/etc/media_profiles.xml

# system/etc/firmware from U8800
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/vidc_720p_command_control.fw:/system/etc/firmware/vidc_720p_command_control.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/vidc_720p_h263_dec_mc.fw:/system/etc/firmware/vidc_720p_h263_dec_mc.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/vidc_720p_h264_dec_mc.fw:/system/etc/firmware/vidc_720p_h264_dec_mc.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/vidc_720p_h264_enc_mc.fw:/system/etc/firmware/vidc_720p_h264_enc_mc.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/vidc_720p_mp4_dec_mc.fw:/system/etc/firmware/vidc_720p_mp4_dec_mc.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/vidc_720p_mp4_enc_mc.fw:/system/etc/firmware/vidc_720p_mp4_enc_mc.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/vidc_720p_vc1_dec_mc.fw:/system/etc/firmware/vidc_720p_vc1_dec_mc.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw

# system/etc/firmware/wlan from U8800
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/wlan/cfg.dat:/system/etc/firmware/wlan/cfg.dat \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/wlan/hostapd_default.conf:/system/etc/firmware/wlan/hostapd_default.conf \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/wlan/qcom_cfg.ini:/system/etc/firmware/wlan/qcom_cfg.ini \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/wlan/qcom_fw.bin:/system/etc/firmware/wlan/qcom_fw.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/wlan/qcom_wapi_fw.bin:/system/etc/firmware/wlan/qcom_wapi_fw.bin \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/etc/firmware/wlan/qcom_wlan_nv.bin:/system/etc/firmware/wlan/qcom_wlan_nv.bin

# system/lib from U8800
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/libaudio.so:/system/lib/libaudio.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/libaudioalsa.so:/system/lib/libaudioalsa.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/libaudioeq.so:/system/lib/libaudioeq.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/libcamera.so:/system/lib/libcamera.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/libgemini.so:/system/lib/libgemini.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/libgsl.so:/system/lib/libgsl.so \\

# system/lib/egl from U8800
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/egl/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/egl/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/egl/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/system/lib/egl/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so
EOF

./setup-makefiles.sh
