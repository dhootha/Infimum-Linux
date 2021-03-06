VERSION=5.14.2

function _fetch() {
	wget -P$SRC -c http://www.cpan.org/src/5.0/perl-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/perl-$VERSION.tar.bz2
	#cd perl-$VERSION
	# patch -Np1 -i SRC/perl-5.14.2-libc-1.patch TODO Find a way to use sed or something instead to remove dependency on version number
}
function _build() {
	cd $BUILD/perl-$VERSION
	sh Configure -des -Dprefix=/tools
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/perl-$VERSION
	cp -v perl cpan/podlators/pod2man $DEST/tools/bin
	mkdir -pv $DEST/tools/lib/perl5/$VERSION
	cp -Rv lib/* $DEST/tools/lib/perl5/$VERSION
}
function _cleanup() {
	rm -Rf $BUILD/perl-$VERSION
}