VERSION=0.2.2

function _fetch() {
	wget -P$SRC -c http://download.sourceforge.net/project/libtirpc/libtirpc/$VERSION/libtirpc-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/libtirpc-$VERSION.tar.bz2
	cd libtirpc-$VERSION
	patch -Np1 -i $SRC/libtirpc-0.2.2-remove-nis-2.patch
}
function _build() {
	cd $BUILD/libtirpc-$VERSION
	autoreconf
	./configure --prefix=/tools --libdir=/tools/lib
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/libtirpc-$VERSION
	make $MAKE_INSTALL_FLAGS install
	
}
function _cleanup() {
	rm -Rf $BUILD/libtirpc-$VERSION
}