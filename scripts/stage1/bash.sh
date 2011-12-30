VERSION=4.2

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/bash-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/bash-$VERSION
	./configure --prefix=/tools --without-bash-malloc
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/bash-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/bash-$VERSION
}