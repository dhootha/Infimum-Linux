VERSION=4.0.0

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/gawk-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/gawk-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/gawk-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/gawk-$VERSION
}