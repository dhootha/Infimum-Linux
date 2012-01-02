VERSION=5.3.5
POPT_VERSION=1.16

function _fetch() {
	# TODO Modularize version directory
	wget -P$SRC -c http://rpm5.org/files/rpm/rpm-5.3/rpm-$VERSION.tar.gz
	wget -P$SRC -c http://rpm5.org/files/popt/popt-$POPT_VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/rpm-$VERSION.tar.gz
	cd rpm-$VERSION
	tar -xvf $SRC/popt-$POPT_VERSION.tar.gz
	mv popt{-$POPT_VERSION,}
}
function _build() {
	cd $BUILD/rpm-$VERSION
	./configure --prefix=/tools --disable-nls -with-dbsql --with-popt=internal --with-xz=/tools/lib --with-sqlite=/tools/lib
	#env CPPFLAGS="-I/tools/include/nspr -I/tools/include/nss" ./configure --prefix=/tools --with-sysroot=/tools --disable-nls --without-selinux --with-external-db --without-lua
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/rpm-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/rpm-$VERSION
}