VERSION=1.16

function _fetch() {
	wget -P$SRC -c http://rpm5.org/files/popt/popt-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/popt-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/popt-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/popt-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/popt-$VERSION
}