VERSION=4.2.1

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/sed/sed-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/sed-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/sed-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/sed-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/sed-$VERSION
}