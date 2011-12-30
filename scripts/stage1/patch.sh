VERSION=2.6.1

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/patch/patch-2.6.1.tar.bz2
}
function _prep() {
	tar -xvf $SRC/patch-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/patch-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/patch-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/patch-$VERSION
}