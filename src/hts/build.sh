#!/bin/bash

htk_version=3.4.1
hts_version=2.3
hts_string=HTS-${hts_version}_for_HTK-${htk_version}

echo Conda build for ${hts_string}
cd htk

# This is because conda messes up unpacking HDecode on top of HTK
(cd HTKLVRec; mv HTKLVRec/* .; rmdir HTKLVRec)

# The HTS patch
patch -p1 < ../hts/${hts_string}.patch

# --disable-hslab is the rune that stops it linking with X11
./configure --prefix=${PREFIX} --enable-hdecode --disable-hslab
make
make install
