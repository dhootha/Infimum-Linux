cd $BUILD
#tar xvf $SRC/uClibc-0.9.32.tar.xz
cd uClibc-0.9.32
#make defconfig
make -j3
make install