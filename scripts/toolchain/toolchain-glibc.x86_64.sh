cd $SCRIPTS/toolchain

#$SCRIPTS/build-steps.sh binutils-pass1.sh all #> $BUILD/binutils-pass1.log
#$SCRIPTS/build-steps.sh gcc-pass1.sh all #> $BUILD/gcc-pass1.log
#$SCRIPTS/build-steps.sh kernel-headers.sh all
#$SCRIPTS/build-steps.sh glibc.sh all
#$SCRIPTS/build-steps.sh adjust-toolchain.sh install
#$SCRIPTS/build-steps.sh binutils-pass2.sh all
$SCRIPTS/build-steps.sh gcc-pass2.sh all