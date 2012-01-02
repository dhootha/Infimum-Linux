#$SCRIPTS/build-steps.sh $SCRIPTS/prep.sh
#$SCRIPTS/build-steps.sh $SCRIPTS/toolchain/binutils-pass1.sh all #> $BUILD/binutils-pass1.log
#$SCRIPTS/build-steps.sh $SCRIPTS/toolchain/gcc-pass1.sh all #> $BUILD/gcc-pass1.log
#$SCRIPTS/build-steps.sh $SCRIPTS/toolchain/kernel-headers.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/toolchain/glibc.sh all
$SCRIPTS/build-steps.sh $SCRIPTS/toolchain/adjust-toolchain.sh install
$SCRIPTS/build-steps.sh $SCRIPTS/toolchain/binutils-pass2.sh all
$SCRIPTS/build-steps.sh $SCRIPTS/toolchain/gcc-pass2.sh all