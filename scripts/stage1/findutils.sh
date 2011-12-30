VERSION=4.4.2

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/findutils-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/findutils-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/findutils-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/findutils-$VERSION
}