#!/bin/bash

if [ ! -d "$TARGET_DIR" ] ; then
	echo "Internal error - TARGET_DIR is not set. Exiting."
	exit 1
fi

pushd "$TARGET_DIR"/usr/lib/firmware/amdgpu/

rm aldebaran_*
rm arcturus_*
rm beige_goby_*
rm cyan_skillfish2_*
rm dimgrey_cavefish_*
rm green_sardine_*
rm kabini_*
rm kaveri_*
rm navi*
rm navi10_*
rm picasso_*
rm raven*
rm renoir_*
rm sienna_cichlid_*
rm vangogh_*
rm vcn_*
rm vega*
rm vega20_*
rm vegam_*
rm yellow_carp_*

popd

sed -i -r -e 's/^(console|)::/null::/' "$TARGET_DIR/etc/inittab"
