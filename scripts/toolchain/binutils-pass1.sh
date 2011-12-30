VERSION=2.22
DIR_VERSION=2.22

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/binutils/binutils-$VERSION.tar.bz2
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
	# Sometimes VERSION and DIR_VERSION differ; e.g. binutils-2.21.1a unpacks to just binutils-2.21.1
	../binutils-$DIR_VERSION/configure --target=$TARGET --prefix=/tools --disable-nls --disable-werror
	make $MAKE_FLAGS
}

function _install() {
	cd $BUILD/binutils-build
	make $MAKE_INSTALL_FLAGS install
}

function _cleanup() {
	rm -Rf $BUILD/binutils-$DIR_VERSION
	rm -Rf $BUILD/binutils-build
}
