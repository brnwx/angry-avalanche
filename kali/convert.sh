!/bin/bash

read -p "output prefix: " file_prefix

sudo systemctl start wpa_supplicant.service
sudo systemctl start NetworkManager.service

hcxpcapngtool -o $file_prefix.hashcat.22000 -E essidlist $file_prefix.pcapng
