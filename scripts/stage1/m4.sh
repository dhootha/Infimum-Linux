VERSION=1.4.16

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/m4/m4-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/m4-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/m4-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/m4-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/m4-$VERSION
}