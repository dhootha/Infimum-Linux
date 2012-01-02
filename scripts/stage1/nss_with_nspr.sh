#VERSION=

function _fetch() {
	wget -P$SRC -c https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_12_4_RTM/src/nss-3.12.4-with-nspr-4.8.tar.gz
}
function _prep() {
	tar -xvf $SRC/nss-3.12.4-with-nspr-4.8.tar.gz
}
function _build() {
	cd $BUILD/nss-3.12.4-with-nspr-4.8/mozilla/security/nss
	#./configure --prefix=/tools
	BUILD_OPT=1 USE_64=1 gmake nss_build_all
}
function _install() {
	cd $BUILD/nss-3.12.4-with-nspr-4.8/
	mkdir -v $DEST/tools/include/nss
	cp -RLv mozilla/dist/public/nss/* $DEST/tools/include/nss --remove-destination
	mkdir -v $DEST/tools/include/nspr
	cp -RLv mozilla/dist/Linux2.6_x86_64_glibc_PTH_64_OPT.OBJ/include/* $DEST/tools/include/nspr --remove-destination
	cp -RLv mozilla/dist/Linux2.6_x86_64_glibc_PTH_64_OPT.OBJ/lib/* $DEST/tools/lib --remove-destination
	cp -RLv mozilla/dist/Linux2.6_x86_64_glibc_PTH_64_OPT.OBJ/bin/* $DEST/tools/bin --remove-destination
	
}
function _cleanup() {
	rm -Rf $BUILD/nss-3.12.4-with-nspr-4.8/
}