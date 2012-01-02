cd $BUILD
tar -xvf $SRC/linux-$KERNEL_VERSION.tar.xz
cd $BUILD/linux-$KERNEL_VERSION
make mrproper
cp -v $INFIMUM_HOME/kernel/linux-$KERNEL_VERSION.$ARCH.qemu.config .config
make $MAKE_FLAGS
cp -v arch/x86/boot/bzImage $INFIMUM_HOME/kernel/vmlinuz-$KERNEL_VERSION
rm -fv $INFIMUM_HOME/kernel/vmlinuz
ln -sv vmlinuz-$KERNEL_VERSION $INFIMUM_HOME/kernel/vmlinuz