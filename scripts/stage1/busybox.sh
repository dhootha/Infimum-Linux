VERSION=1.19.3

function _fetch() {
	wget -P$SRC -c http://busybox.net/downloads/busybox-$VERSION.tar.bz2
}
function _prep() {
	tar -xvf $SRC/busybox-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/busybox-$VERSION
	make distclean
	make defconfig
	# UBI tools is breaking build, and we're not supporting MTD devices right now anyway, so let's unset them.
	sed -i "s/\(CONFIG_UBI[A-Z]*\)=y/# \1 is not set/g" .config
	make
}
function _install() {
	cd $BUILD/busybox-$VERSION
	#make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/busybox-$VERSION
}