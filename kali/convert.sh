!/bin/bash

read -p "output filename: " file_name

sudo systemctl start wpa_supplicant.service
sudo systemctl start NetworkManager.service

hcxpcapngtool -o $file_name.hashcat.22000 -E essidlist $file_name.pcapng
