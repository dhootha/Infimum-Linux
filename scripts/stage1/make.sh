VERSION=3.82

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/make/make-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/make-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/make-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/make-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/make-$VERSION
}