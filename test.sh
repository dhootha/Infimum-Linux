#!/bin/bash

#qemu-kvm -kernel build/linux-3.0.12/arch/x86/boot/bzImage -initrd initramfs.img -net none -hda dest.img
qemu-kvm -kernel kernel/vmlinuz -initrd initramfs.img -net none -hda test.img -hdb dest.img

