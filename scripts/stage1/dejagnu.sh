VERSION=1.5

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/dejagnu/dejagnu-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/dejagnu-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/dejagnu-$VERSION
	./configure --prefix=/tools
}
function _install() {
	cd $BUILD/dejagnu-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/dejagnu-$VERSION
}