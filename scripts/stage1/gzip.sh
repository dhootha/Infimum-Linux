VERSION=1.4

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/gzip/gzip-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/gzip-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/gzip-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/gzip-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/gzip-$VERSION
}