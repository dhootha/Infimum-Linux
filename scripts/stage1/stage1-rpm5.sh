#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/tcl.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/expect.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/dejagnu.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/check.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/ncurses.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/bash.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/bzip2.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/coreutils.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/diffutils.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/file.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/findutils.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/gawk.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/gettext.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/grep.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/gzip.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/m4.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/make.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/patch.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/perl.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/sed.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/tar.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/texinfo.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/xz.sh all

#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/busybox.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/e2fsprogs.sh all

# RPM4 and dependencies
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/zlib.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/popt.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/nss_with_nspr.sh all
$SCRIPTS/build-steps.sh $SCRIPTS/stage1/db.sh all
$SCRIPTS/build-steps.sh $SCRIPTS/stage1/rpm.sh all

# RPM5 and dependencies
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/zlib.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/openssl.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/nss_with_nspr.sh all
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/sqlite.sh cleanup
#$SCRIPTS/build-steps.sh $SCRIPTS/stage1/rpm5.sh build
