#
# Copyright 2019 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, November 2019
#

# Just go get the conda package
set(ANACONDA "https://repo.anaconda.com/pkgs/main/linux-64")
set(MKL_VERSION "2019.5-281")
ExternalProject_Add(mkl
  URL               ${ANACONDA}/mkl-${MKL_VERSION}.tar.bz2
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   cp -dr lib ${CMAKE_INSTALL_PREFIX}
  )
set_target_properties(mkl PROPERTIES EXCLUDE_FROM_ALL 1)
