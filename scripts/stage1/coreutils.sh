VERSION=8.14

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/coreutils-$VERSION.tar.xz
}
function _build() {
	cd $BUILD/coreutils-$VERSION
	./configure --prefix=/tools --enable-install-program=hostname
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/coreutils-$VERSION
	make $MAKE_INSTALL_FLAGS install
	cp -v src/su $DEST/tools/bin/su-tools
}
function _cleanup() {
	rm -Rf $BUILD/coreutils-$VERSION
}