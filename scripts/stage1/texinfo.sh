VERSION=4.13a
DIR_VERSION=4.13

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/texinfo/texinfo-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/texinfo-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/texinfo-$DIR_VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/texinfo-$DIR_VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/texinfo-$DIR_VERSION
}