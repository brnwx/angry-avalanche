!/bin/bash

read -p "output prefix: " file_prefix

hcxpcapngtool -o $file_prefix.hashcat.22000 -E essidlist $file_prefix.pcapng
