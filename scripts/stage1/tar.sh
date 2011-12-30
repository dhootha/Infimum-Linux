VERSION=1.26

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/tar/tar-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/tar-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/tar-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/tar-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/tar-$VERSION
}