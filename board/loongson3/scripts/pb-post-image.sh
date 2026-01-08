if ! [ -d "$TARGET_DIR" ] ; then
	echo "FATAL: TARGET_DIR does not exist."
	exit 1
fi

DATE="${DATE:-$(date "+%Y%m%d")}"
REV="1"

while [ -d "$BINARIES_DIR"/"petitboot-ls3a"-"$DATE"-"r$REV" ] ; do
	REV=$(( REV + 1 ))
done
OUTDIR="petitboot-ls3a-$DATE-r$REV"
OUTNAME="$OUTDIR.zip"

if ! [ -d "$BINARIES_DIR"/firmware-dir ] ; then
	echo "FATAL: Firmware directory does not exist."
	exit 1
fi

mkdir -pv "$BINARIES_DIR"/"$OUTDIR"/boot
cp -rv "$BINARIES_DIR"/rootfs.cpio.xz "$BINARIES_DIR"/"$OUTDIR"/boot/pbinitrd.img
cp -rv "$BINARIES_DIR"/vmlinuz "$BINARIES_DIR"/"$OUTDIR"/boot/pbkernel
touch "$BINARIES_DIR"/"$OUTDIR"/boot/petiboot.txt
cp -Lrv "$BINARIES_DIR"/firmware-dir/lib "$BINARIES_DIR"/"$OUTDIR"/

echo "Creating zip ..."
pushd "$BINARIES_DIR"
zip -r "$BINARIES_DIR"/"$OUTNAME" "$OUTDIR"
popd

echo "Build finished successfully."
echo "Zip archive created at $BINARIES_DIR/$OUTNAME."
