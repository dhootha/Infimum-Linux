#!/bin/bash

cd initramfs
find . | cpio -c -o | gzip -9 > ../initramfs.img
