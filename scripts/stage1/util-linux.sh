VERSION=2.20

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/util-linux-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/util-linux-$VERSION
	./configure --prefix=/tools --disable-nls
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/util-linux-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/util-linux-$VERSION
}