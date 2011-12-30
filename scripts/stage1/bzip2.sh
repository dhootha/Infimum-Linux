VERSION=1.0.6

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/bzip2-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/bzip2-$VERSION
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/bzip2-$VERSION
	make $MAKE_INSTALL_FLAGS PREFIX=/tools install
}
function _cleanup() {
	rm -Rf $BUILD/bzip2-$VERSION
}