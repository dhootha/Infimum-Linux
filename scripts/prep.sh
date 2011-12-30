mkdir -pv $BUILD
mkdir -pv $DEST/tools/lib
if [ ! -h $DEST/tools/lib64 ]; then
	ln -sv lib $DEST/tools/lib64
fi
