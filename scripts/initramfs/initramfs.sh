#$SCRIPTS/build-steps.sh $SCRIPTS/initramfs/uClibc.sh build
#$SCRIPTS/build-steps.sh $SCRIPTS/initramfs/libtirpc.sh install
#$SCRIPTS/build-steps.sh $SCRIPTS/initramfs/busybox.sh build

install -dv $INFIMUM_HOME/initramfs
cd $INFIMUM_HOME/initramfs
install -dv bin dev etc lib mnt proc sys tools/bin tools/lib
ln -sv /lib lib64
ln -sv /tools/lib tools/lib64
cp -v $DEST/tools/bin/bash tools/bin
cp -v $DEST/tools/bin/mount tools/bin
cp -v $DEST/tools/bin/mkdir tools/bin
echo '/tools/lib
/tools/lib64' > etc/ld.so.conf
ln -sv /proc/mounts etc/mtab
cp -v $DEST/tools/lib64/ld-linux-x86-64.so.2 tools/lib
cp -v $DEST/tools/lib/libc.so.6 tools/lib
cp -v $DEST/tools/lib/libdl.so.2 tools/lib
cp -v $DEST/tools/lib/libblkid.so.1 tools/lib
cp -v $DEST/tools/lib/libgcc_s.so.1 tools/lib
cp -v $DEST/tools/lib/libncurses.so.5 tools/lib
cp -v $DEST/tools/lib/libuuid.so.1 tools/lib
cp -v $SCRIPTS/initramfs/init $INFIMUM_HOME/initramfs