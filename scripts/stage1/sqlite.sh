VERSION=3070900

function _fetch() {
	wget -P$SRC -c http://www.sqlite.org/sqlite-autoconf-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/sqlite-autoconf-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/sqlite-autoconf-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/sqlite-autoconf-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/sqlite-autoconf-$VERSION
}