VERSION=3.0.12

function _fetch() {
	# TODO Make this modular for other versions: 2.6, 3.2, etc.
	wget -P$SRC -c http://ftp.kernel.org/pub/linux/kernel/v3.0/linux-$VERSION.tar.xz
}

function _prep() {
	tar -xvf $SRC/linux-$VERSION.tar.xz
}

function _build() {
	cd linux-$VERSION
	make mrproper
	make headers_check
}

function _install() {
	cd linux-$VERSION
	make INSTALL_HDR_PATH=dest headers_install
	cp -rv dest/include/* $DEST/tools/include
}

function _cleanup() {
	rm -Rf $BUILD/linux-$VERSION
}