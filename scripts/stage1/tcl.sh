VERSION=8.5.11

function _fetch() {
	wget -P$SRC -c http://prdownloads.sourceforge.net/tcl/tcl$VERSION-src.tar.gz
}
function _prep() {
	tar -xvf $SRC/tcl$VERSION-src.tar.gz
}
function _build() {
	cd $BUILD/tcl$VERSION/unix
	./configure --prefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/tcl$VERSION/unix
	make $MAKE_INSTALL_FLAGS install
	chmod -v u+w $DEST/tools/lib/libtcl8.5.so
	make install-private-headers
	ln -sv tclsh8.5 $DEST/tools/bin/tclsh
}
function _cleanup() {
	rm -Rf $BUILD/tcl$VERSION
}