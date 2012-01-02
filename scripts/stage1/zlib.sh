VERSION=1.2.5

function _fetch() {
	wget -P$SRC -c http://zlib.net/zlib-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/zlib-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/zlib-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/zlib-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/zlib-$VERSION
}