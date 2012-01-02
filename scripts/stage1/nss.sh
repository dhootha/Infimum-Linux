VERSION=3.12.4
NSS_MAKE_FLAGS="BUILD_OPT=1 USE_64=1"
function _fetch() {
	# TODO Modularize URL fetching
	wget -P$SRC -c ftp://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_13_1_RTM/src/nss-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/nss-$VERSION.tar.gz
}
function _build() {
	# Adapted from Fedora 15 nss rpm specs
	cd $BUILD/nss-$VERSION/
	BUILD_OPT=1 USE_64=1 make -C mozilla/security/coreconf
	BUILD_OPT=1 USE_64=1 make -C mozilla/security/dbm
	BUILD_OPT=1 USE_64=1 make -C mozilla/security/nss
	#cd $BUILD/nss-$VERSION/mozilla/security/nss
	#./configure --prefix=/tools
	#make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/nss-$VERSION
	#make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/nss-$VERSION
}