VERSION=$GCC_VERSION
GMP_VERSION=5.0.2
MPFR_VERSION=3.1.0
MPC_VERSION=0.9

function _fetch() {
	wget -P$SRC -c http://ftp.gnu.org/gnu/gcc/gcc-$VERSION/gcc-$VERSION.tar.bz2
	wget -P$SRC -c http://ftp.gnu.org/gnu/gmp/gmp-$GMP_VERSION.tar.bz2
	wget -P$SRC -c http://www.multiprecision.org/mpc/download/mpc-$MPC_VERSION.tar.gz
	wget -P$SRC -c http://www.mpfr.org/mpfr-current/mpfr-$MPFR_VERSION.tar.xz
}

function _prep() {
	tar -xvf $SRC/gcc-$VERSION.tar.bz2
	cd gcc-$VERSION
	tar -xvf $SRC/gmp-$GMP_VERSION.tar.bz2
	mv -v gmp{-$GMP_VERSION,}
	tar -xvf $SRC/mpc-$MPC_VERSION.tar.gz
	mv -v mpc{-$MPC_VERSION,}
	tar -xvf $SRC/mpfr-$MPFR_VERSION.tar.xz
	mv -v mpfr{-$MPFR_VERSION,}
}

function _build() {
	cd $BUILD
	if [ -d gcc-build ]; then
		rm -Rf gcc-build
	fi
	mkdir -v gcc-build
	cd gcc-build
	../gcc-$VERSION/configure --target=$TARGET --prefix=/tools --disable-nls --disable-shared --disable-multilib --disable-decimal-float --disable-threads --disable-libmudflap --disable-libssp --disable-libgomp --disable-libquadmath --disable-target-libiberty --disable-target-zlib --enable-languages=c --without-ppl --without-cloog --with-mpfr-include=$(pwd)/../gcc-4.6.1/mpfr/src --with-mpfr-lib=$(pwd)/mpfr/src/.libs
	make $MAKE_FLAGS
}

function _install() {
	cd $BUILD/gcc-build
	make $MAKE_INSTALL_FLAGS install
	ln -vs libgcc.a `$TARGET-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`
}

function _cleanup() {
	rm -Rf $BUILD/gcc-$VERSION
	rm -Rf $BUILD/gcc-build
}