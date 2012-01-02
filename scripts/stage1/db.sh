VERSION=5.3.15

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/db-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/db-$VERSION/build_unix
	../dist/configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/db-$VERSION/build_unix
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/db--$VERSION
}