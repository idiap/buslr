#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
set(VERSION "1.6.7")
ExternalProject_Add(openfst
  URL http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-${VERSION}.tar.gz
  CONFIGURE_COMMAND ./configure
      --prefix=${CMAKE_INSTALL_PREFIX}
      --enable-static
      --enable-shared
      --enable-far
      --enable-ngram-fsts
  BUILD_IN_SOURCE   true
  )
set_target_properties(openfst PROPERTIES EXCLUDE_FROM_ALL 1)
