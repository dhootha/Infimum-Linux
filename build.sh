#!/bin/bash

source config

if [ $1 -a $1 == "clean" ]; then
	# TODO For now, assume these already exist, since they may need to be mounted by root.
	rm -Rf $BUILD/*
	rm -Rf $DEST/*
	exit
fi

#source scripts/prep.sh

# Build toolchain
#source scripts/toolchain/toolchain-$LIBC.$ARCH.sh

# Build stage 1 tools
#source scripts/stage1/stage1-tools.sh

# Strip
if [ $1 -a $1 == "strip" ]; then
	strip --strip-debug /tools/lib/*
	strip --strip-unneeded /tools/{,s}bin/*
	rm -rf /tools/{,share}/{info,man,doc}
fi

# Package
if [ $1 -a $1 == "package" ]; then
	mksquashfs $DEST/tools dest.img -all-root -noappend
fi