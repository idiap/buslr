#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
set(PFILE_VERSION "v0_51")
set(ICSI "ftp://ftp.icsi.berkeley.edu/pub/real/davidj")
ExternalProject_Add(pfile_utils
  URL               "${ICSI}/pfile_utils-${PFILE_VERSION}.tar.gz"
  BUILD_IN_SOURCE   true
  PATCH_COMMAND     patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/patch.txt
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}
  )
set_target_properties(pfile_utils PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add_StepDependencies(pfile_utils build quicknet)
