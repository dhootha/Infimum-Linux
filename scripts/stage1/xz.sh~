VERSION=

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/-$VERSION.tar.
}
function _build() {
	cd $BUILD/-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	# rm -Rf $BUILD/-$VERSION *** Commented out so we don't actually run this! ***
}