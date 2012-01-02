VERSION=4.9.1.2

function _fetch() {
	# TODO Modularize version directory
	wget -P$SRC -c http://rpm.org/releases/rpm-4.9.x/rpm-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/rpm-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/rpm-$VERSION
	env CPPFLAGS="-I/tools/include/nspr -I/tools/include/nss" ./configure --prefix=/tools --with-sysroot=/tools --disable-nls --without-selinux --with-external-db --without-lua
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/rpm-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/rpm-$VERSION
}