VERSION=4.8.9

function _fetch() {
	wget -P$SRC -c https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$VERSION/src/nspr-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/nspr-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/nspr-$VERSION/mozilla/nsprpub
	./configure --prefix=/tools --enable-64bit --enable-strip --with-pthreads
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/nspr-$VERSION/mozilla/nsprpub
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	# rm -Rf $BUILD/-$VERSION *** Commented out so we don't actually run this! ***
}