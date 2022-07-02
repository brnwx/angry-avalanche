#!/bin/bash

read -p "output prefix: " file_prefix

sudo systemctl stop wpa_supplicant.service
sudo systemctl stop NetworkManager.service

sudo hcxdumptool -i wlan0 -o $file_prefix.pcapng --active_beacon --enable_status=15

hcxpcapngtool -o $file_prefix_hashcat.22000 -E essidlist $file_prefix.pcapng
