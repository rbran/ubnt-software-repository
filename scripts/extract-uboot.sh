#!/bin/sh

file=$1
init=$(binwalk ${file} | grep 'Squashfs filesystem' | cut -d ' ' -f 1)
dd if=${file} of=${file}.squashfs skip=${init} iflag=skip_bytes
unsquashfs -d "${file%.bin}-root" "${file}.squashfs"
rm "${file}.squashfs"

