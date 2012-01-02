VERSION=2.14.1

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/glibc/glibc-$VERSION.tar.xz
}
function _prep() {
	tar -xvf $SRC/glibc-$VERSION.tar.xz
	cd glibc-$VERSION
	patch -Np1 -i $SRC/glibc-2.14.1-gcc_fix-1.patch
	patch -Np1 -i $SRC/glibc-2.14.1-cpuid-1.patch
}
function _build() {
	cd $BUILD
	if [ -d glibc-build ]; then
		rm -Rf glibc-build
	fi
	mkdir -v glibc-build
	cd glibc-build
	../glibc-$VERSION/configure --prefix=/tools --host=$TARGET --build=$(../glibc-$VERSION/scripts/config.guess) --disable-profile --enable-add-ons --enable-kernel=2.6.25 --with-headers=/tools/include libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/glibc-build
	make $MAKE_INSTALL_FLAGS install
	mkdir -v $DEST/tools/include/rpc
	mkdir -v $DEST/tools/include/rpcsvc
	#cp -v $BUILD/glibc-$VERSION/sunrpc/rpc/*.h $DEST/tools/include/rpc
	#cp -v $BUILD/glibc-$VERSION/sunrpc/rpcsvc/*.h $DEST/tools/include/rpcsvc
	#cp -v $BUILD/glibc-$VERSION/nis/rpcsvc/*.h $DEST/tools/include/rpcsvc
}
function _cleanup() {
	rm -Rf $BUILD/glibc-$VERSION
	rm -Rf $BUILD/glibc-build
}