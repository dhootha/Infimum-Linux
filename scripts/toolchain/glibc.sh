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
	cd glibc-build
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/glibc-$VERSION
	rm -Rf $BUILD/glibc-build
}