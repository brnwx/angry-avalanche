#!/bin/bash

read -p "output prefix: " file_prefix

sudo systemctl stop wpa_supplicant.service
sudo systemctl stop NetworkManager.service

sudo hcxdumptool -i wlan0 -w $file_prefix.pcapng

sudo systemctl start NetworkManager.service
sudo systemctl start wpa_supplicant.service
