VERSION=0.9.8

function _fetch() {
	wget -P$SRC -c http://sourceforge.net/projects/check/files/check/$VERSION/check-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/check-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/check-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/check-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/check-$VERSION
}