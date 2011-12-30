VERSION=$BINUTILS_VERSION
DIR_VERSION=$BINUTILS_VERSION

# If we're in pass 2, I think we can safely assume we have the source tarballs.
function _fetch() {
	echo "Nothing to fetch."
}

function _prep() {
	tar -xvf $SRC/binutils-$VERSION.tar.bz2
}

function _build() {
	if [ -d binutils-build ]; then
		rm -Rf binutils-build
	fi
	mkdir -v binutils-build
	cd binutils-build
	CC="$TARGET-gcc -B/tools/lib" AR=$TARGET-ar RANLIB=$TARGET-ranlib ../binutils-$DIR_VERSION/configure --prefix=/tools --disable-nls --with-lib-path=/tools/lib
	make $MAKE_FLAGS
}

function _install() {
	cd $BUILD/binutils-build
	make $MAKE_INSTALL_FLAGS install
	make -C ld clean
	make -C ld LIB_PATH=/usr/lib:/lib
	cp -v ld/ld-new $DEST/tools/bin
}

function _cleanup() {
	rm -Rf $BUILD/binutils-$DIR_VERSION
	rm -Rf $BUILD/binutils-build
}