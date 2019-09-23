#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
set(QN_VERSION "v3_33") # Latest seems to be 3_50pre4; kaldi uses 3_33
set(ICSI "ftp://ftp.icsi.berkeley.edu/pub/real/davidj")
ExternalProject_Add(quicknet
  URL               "${ICSI}/quicknet-${QN_VERSION}.tar.gz"
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}
  )
set_target_properties(quicknet PROPERTIES EXCLUDE_FROM_ALL 1)
