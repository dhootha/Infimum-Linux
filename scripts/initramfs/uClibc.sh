VERSION=0.9.32

function _fetch() {
	wget -P$SRC -c http://uclibc.org/downloads/uClibc-$VERSION.tar.xz
}
function _prep() {
	tar -xvf $SRC/uClibc-$VERSION.tar.xz
}
function _build() {
	cd $BUILD/uClibc-$VERSION
	make defconfig
	make $MAKE_FLAGS
	#./configure --prefix=/tools
	#make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/uClibc-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/uClibc-$VERSION
}