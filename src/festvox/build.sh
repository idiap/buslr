#!/bin/bash

# Build
for d in speech_tools festival festvox
do
    ( cd $d; ./configure --prefix=${PREFIX}/opt; make )
done

# Install the default voices (cmake won't unpack them into the right place)
for d in kallpc cmu poslex
do
    cp -r $d/* festival
done

# Clean up a bit
find . -name "*.o" -exec echo rm {} \;

# Install
mkdir -p ${PREFIX}/opt
for d in speech_tools festival festvox
do
    cp -Lr $d ${PREFIX}/opt
done
