#!/bin/bash

# SPDX-License-Identifier: BSD-3-Clause
# Copyright (c) 2023 Rene Wolf

export DEBIAN_FRONTEND=noninteractive 

apt update
apt install -y git cmake gcc-arm-none-eabi gcc g++ python3 zip

# maybe a bit overkill but we also directly cleanup some unneeded things to not waste space on ci runners
apt clean -y
# https://github.com/tianon/docker-brew-ubuntu-core/blob/f2f3f01ed67bab2e24b8c4fda60ef035a871b4c7/xenial/Dockerfile
rm -rf /var/lib/apt/lists/*
