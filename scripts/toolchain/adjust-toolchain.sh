function _install() {
	SPECS=`dirname $($TARGET-gcc -print-libgcc-file-name)`/specs
	$TARGET-gcc -dumpspecs | sed -e 's@/lib\(64\)\?/ld@/tools&@g' -e "/^\*cpp:$/{n;s,$, -isystem /tools/include,}" > $SPECS 
	echo "New specs file is: $SPECS"
	unset SPECS
}