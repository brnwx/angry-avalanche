#!/bin/bash

read -p "output filename: " file_name

sudo systemctl stop wpa_supplicant.service
sudo systemctl stop NetworkManager.service


sudo hcxdumptool -i wlan0 -o $file_name.pcapng --active_beacon --enable_status=15


hcxpcapngtool -o $file_name_hashcat.22000 -E essidlist $file_name.pcapng
