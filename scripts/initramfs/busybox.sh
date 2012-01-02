VERSION=1.19.3

function _fetch() {
	wget -P$SRC -c # URL to fetch
}
function _prep() {
	tar -xvf $SRC/busybox-$VERSION.tar.bz2
}
function _build() {
	cd $BUILD/busybox-$VERSION
	make distclean
	LDLIBS="tirpc crypt m" make defconfig
	#cp $SRC/busybox-$VERSION.config .config
	# UBI tools is breaking build, and we're not supporting MTD devices right now anyway, so let's unset them.
	sed -i "s/\(CONFIG_UBI[A-Z]*\)=y/# \1 is not set/g" .config
	# Unset INETD
	#sed -i "s/\([A-Z_]*INETD[A-Z_]*\)=y/# \1 is not set/g" .config
	#make oldconfig
	#echo 'LDFLAGS+="tirpc"' > Makefile.local
	LDLIBS="tirpc crypt m" make busybox
}
function _install() {
	cd $BUILD/-$VERSION
	make $MAKE_INSTALL_FLAGS install
}
function _cleanup() {
	rm -Rf $BUILD/busybox-$VERSION
}