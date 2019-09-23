#!/bin/bash

echo Building with ${CPU_COUNT} CPUs
make config
make -j ${CPU_COUNT} all

echo Installing
mkdir -p $PREFIX/bin
make install
