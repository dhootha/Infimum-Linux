VERSION=1.0.6

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/bzip2-$VERSION.tar.gz
}
function _build() {
	# bzip2 doesn't build the libbz2.so.1.0.6 sometimes on parallel builds, so not relying on possible -j flag from $MAKE_FLAGS
	cd $BUILD/bzip2-$VERSION
	sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
	make -f Makefile-libbz2_so
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/bzip2-$VERSION
	make $MAKE_INSTALL_FLAGS PREFIX=/tools install
	cp -v bzip2-shared $DEST/tools/bin/bzip2
	cp -av libbz2.so* $DEST/tools/lib
	ln -sv libbz2.so.1.0 $DEST/tools/lib/libbz2.so
	
}
function _cleanup() {
	rm -Rf $BUILD/bzip2-$VERSION
}