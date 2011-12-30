VERSION=0.18.1.1

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/gettext/gettext-$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/gettext-$VERSION.tar.gz
}
function _build() {
	cd $BUILD/gettext-$VERSION/gettext-tools
	./configure --prefix=/tools --disable-shared
	make -C gnulib-lib $MAKE_FLAGS
	make -C src msgfmt $MAKE_FLAGS	
}
function _install() {
	cd $BUILD/gettext-$VERSION/gettext-tools
	cp -v src/msgfmt $DEST/tools/bin
}
function _cleanup() {
	rm -Rf $BUILD/gettext-$VERSION
}