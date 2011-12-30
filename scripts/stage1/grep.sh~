VERSION=2.9

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/grep/grep-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/grep-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/grep-$VERSION
	./configure --prefix=/tools --disable-perl-regexp
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/grep-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/grep-$VERSION
}