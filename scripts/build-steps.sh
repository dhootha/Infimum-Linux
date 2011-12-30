source $1
cd $BUILD
if [ -z $2 -o $2 == "all" ]; then
	_fetch
	_prep
	_build
	_install
	_cleanup
elif [ $2 == "fetch" ]; then
	_fetch
elif [ $2 == "prep" ]; then
	_prep
elif [ $2 == "build" ]; then
	_build
elif [ $2 == "install" ]; then
	_install
elif [ $2 == "cleanup" ]; then
	_cleanup
else
	echo "Not a valid build step."
fi