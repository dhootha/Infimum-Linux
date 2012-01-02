VERSION=4.2

function _fetch() {
	wget -P$SRC -c http://downloads.sourceforge.net/project/squashfs/squashfs/squashfs$VERSION/squashfs$VERSION.tar.gz
}
function _prep() {
	tar -xvf $SRC/squashfs$VERSION.tar.gz
}
function _build() {
	cd $BUILD/squashfs$VERSION/squashfs-tools
	mv Makefile{,.orig}
	sed -e "s/#XZ_SUPPORT/XZ_SUPPORT/" -e "s/\(COMP_DEFAULT = \)gzip/\1xz/" -e 's|\(INSTALL_DIR = \).*|\1'"$INFIMUM_HOME"'\/utils|' Makefile.orig > Makefile
	make $MAKE_FLAGS
}
function _install() {
	cd $BUILD/squashfs$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/squashfs$VERSION
}