VERSION=4.6.1
GMP_VERSION=5.0.2
MPFR_VERSION=3.1.0
MPC_VERSION=0.9

#Again, pass2 => already fetched.
function _fetch() {
	echo "Nothing to fetch."
}

function _prep() {
	tar -xvf $SRC/gcc-$VERSION.tar.bz2
	cd gcc-$VERSION
	patch -Np1 -i $SRC/gcc-4.6.1-startfiles_fix-1.patch
	cp -v gcc/Makefile.in{,.orig}
	sed 's@\./fixinc\.sh@-c true@' gcc/Makefile.in.orig > gcc/Makefile.in
	cp -v gcc/Makefile.in{,.tmp}
	sed 's/^T_CFLAGS =$/& -fomit-frame-pointer/' gcc/Makefile.in.tmp > gcc/Makefile.in
	for file in $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h); do
		cp -uv $file{,.orig}
		sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' -e 's@/usr@/tools@g' $file.orig > $file
		echo '
#undef STANDARD_INCLUDE_DIR
#define STANDARD_INCLUDE_DIR 0
#define STANDARD_STARTFILE_PREFIX_1 ""
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
		touch $file.orig
	done
	case $(uname -m) in
		x86_64)
			for file in $(find gcc/config -name t-linux64) ; do
				cp -v $file{,.orig}
				sed '/MULTILIB_OSDIRNAMES/d' $file.orig > $file
			done
		;;
	esac
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
	CC="$TARGET-gcc -B/tools/lib/" AR=$TARGET-ar RANLIB=$TARGET-ranlib ../gcc-$VERSION/configure --prefix=/tools --with-local-prefix=/tools --enable-clocale=gnu --enable-shared --enable-threads=posix --enable-__cxa_atexit --enable-languages=c,c++ --disable-libstdcxx-pch --disable-multilib --disable-bootstrap --disable-libgomp --without-ppl --without-cloog --with-mpfr-include=$(pwd)/../gcc-4.6.1/mpfr/src --with-mpfr-lib=$(pwd)/mpfr/src/.libs
	make $MAKE_FLAGS
}

function _install() {
	cd $BUILD/gcc-build
	make $MAKE_INSTALL_FLAGS install
	ln -vs gcc $DEST/tools/bin/cc
}

function _cleanup() {
	rm -Rf $BUILD/gcc-$VERSION
	rm -Rf $BUILD/gcc-build
}