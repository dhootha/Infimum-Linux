#!/bin/bash

source config

# Clean
if [ $1 -a $1 == "clean" ]; then
	# TODO For now, assume these already exist, since they may need to be mounted by root.
	rm -Rf $BUILD/*
	rm -Rf $DEST/*
	exit
fi

# Strip
if [ $1 -a $1 == "strip" ]; then
	strip --strip-debug /tools/lib/*
	strip --strip-unneeded /tools/{,s}bin/*
	rm -rf /tools/{,share}/{info,man,doc}
	exit
fi

# Package
if [ $1 -a $1 == "package" ]; then
	mksquashfs $DEST/tools dest.img -all-root -noappend -no-xattrs
	exit
fi

# Utils
if [ $1 -a $1 == "utils" ]; then
	# TODO
	#scripts/build-steps.sh scripts/utils/squashfs.sh all
	exit
fi

# Build toolchain
source scripts/toolchain/toolchain-$LIBC.$ARCH.sh

# Build stage 1
source scripts/stage1/stage1-tools.sh
source scripts/stage1/stage1-rpm4.sh
#source scripts/stage1/stage1-rpm5.sh TODO Not working yet
source scripts/initramfs/initramfs.sh
source scripts/stage1/stage1-kernel.sh
