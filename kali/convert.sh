!/bin/bash

read -p "output prefix: " file_prefix

hcxpcapngtool -o $file_prefix.22000 -E essidlist $file_prefix.pcapng
