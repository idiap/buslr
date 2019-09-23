#!/bin/bash

# Install the pip package
python -m pip install . --no-deps --ignore-installed -vv

# Install the frontend parts
tar zxf idiaptts/scripts/tts_frontend/English/festival_files.tar.gz
mkdir -p ${PREFIX}/opt
cp -r festival_files ${PREFIX}/opt/festival
