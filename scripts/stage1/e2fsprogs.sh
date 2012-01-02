VERSION=1.42

function _fetch() {
	wget -P$SRC -c http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/e2fsprogs-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/e2fsprogs-$VERSION
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/e2fsprogs-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/e2fsprogs-$VERSION
}