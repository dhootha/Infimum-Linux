VERSION=5.45

function _fetch() {
	# TODO ???
	wget -P$SRC -c http://prdownloads.sourceforge.net/expect/expect$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/expect$VERSION.tar.gz
	cd expect$VERSION
	cp -v configure{,.orig}
	sed 's:/usr/local/bin:/bin:' configure.orig > configure
}
function _build() {
	cd $BUILD/expect$VERSION
	./configure --prefix=/tools --with-tcl=/tools/lib --with-tclinclude=/tools/include
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/expect$VERSION
	make $MAKE_INSTALL_FLAGS SCRIPTS="" install
}
function _cleanup() {
	rm -Rf $BUILD/expect$VERSION
}