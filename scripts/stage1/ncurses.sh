VERSION=5.9

function _fetch() {
	wget -P$SRC -c ftp://ftp.gnu.org/gnu/ncurses/ncurses-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/ncurses-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/ncurses-$VERSION
	./configure --prefix=/tools --with-shared --without-debug --without-ada --enable-overwrite
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/ncurses-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/ncurses-$VERSION
}