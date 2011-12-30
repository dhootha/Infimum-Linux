VERSION=5.0.3

function _fetch() {
	wget -P$SRC -c http://tukaani.org/xz/xz-$VERSION.tar.xz
}
function _prep() {
	tar -xvf $SRC/xz-$VERSION.tar.xz
}
function _build() {
	cd $BUILD/xz-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/xz-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/xz-$VERSION
}