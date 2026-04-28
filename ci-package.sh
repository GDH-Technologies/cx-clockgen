#!/bin/bash

# SPDX-License-Identifier: BSD-3-Clause
# Copyright (c) 2023 Rene Wolf

source source-common.sh
source source-pi.sh

cd "$DIR_FIRMWARE" || die "can't cd to '$DIR_FIRMWARE'"

output_name="cxadc-clock-generator-audio-adc-firmware-${SEMVER}"
output_dir="$DIR_FIRMWARE/$output_name"
mkdir -p "$output_dir"


cmake_exe_name=firmware
mv_or_die "$DIR_FIRMWARE_BUILD/${cmake_exe_name}.uf2" "$output_dir/firmware-${SEMVER}.uf2"
cp_or_die "$FILE_BUILD_INFO_TXT" "$output_dir/"
cp_or_die "$FILE_BUILD_LOG" "$output_dir/"
cp_or_die "$DIR_FIRMWARE/LICENSE" "$output_dir/LICENSE-firmware.txt"
cp_or_die "$DIR_FIRMWARE/src/libsi5351/LICENSE" "$output_dir/LICENSE-libsi5351.txt"
cp_or_die "$DIR_FIRMWARE/src/libsi5351/README.md" "$output_dir/NOTE-libsi5351.md"
cp_or_die "$DIR_FIRMWARE/pico-sdk/LICENSE.TXT" "$output_dir/LICENSE-pico-sdk.txt"
cp_or_die "$DIR_FIRMWARE/pico-sdk/lib/tinyusb/LICENSE" "$output_dir/LICENSE-tinyusb.txt"

zip -r "${output_name}.zip" "$output_name"
