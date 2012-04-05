#!/bin/sh

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

mkdir -p ../../../vendor/$MANUFACTURER/$DEVICE

(cat << EOF) | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/$MANUFACTURER/$DEVICE/$DEVICE-vendor.mk
# Live wallpaper packages
PRODUCT_PACKAGES := \\
    LiveWallpapers \\
    LiveWallpapersPicker \\
    MagicSmokeWallpapers \\
    VisualizationWallpapers \\
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES := \\
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

\$(call inherit-product, vendor/__MANUFACTURER__/__DEVICE__/__DEVICE__-vendor-blobs.mk)
EOF


(cat << EOF) | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/$MANUFACTURER/$DEVICE/BoardConfigVendor.mk
USE_CAMERA_STUB := false
EOF
