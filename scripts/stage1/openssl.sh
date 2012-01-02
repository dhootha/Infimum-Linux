VERSION=1.0.0e

function _fetch() {
	wget -P$SRC -c http://www.openssl.org/source/openssl-1.0.0e.tar.gz
}
function _prep() {
	tar -xvf $SRC/openssl-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/openssl-$VERSION
	./config --prefix=/tools threads shared 
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/openssl-$VERSION
	# OpenSSL uses INSTALL_PREFIX instead of DESTDIR
	make INSTALL_PREFIX=$DEST install
}
function _cleanup() {
	# rm -Rf $BUILD/-$VERSION *** Commented out so we don't actually run this! ***
}