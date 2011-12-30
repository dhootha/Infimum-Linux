#!/bin/bash

qemu-kvm -kernel kernels/linux-3.0.12-rt30/arch/x86/boot/bzImage -initrd initramfs.img -net none -hda dest.img
