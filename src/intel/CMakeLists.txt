#
# Copyright 2019 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, November 2019
#

# Of the Intel distributions, the conda packages are the easiest
set(INTEL       "https://anaconda.org/intel")
set(MKL_VERSION "2020.2")
set(MKL_BUILD   "intel_254")

# Raw MKL library
set(MKL_DIR     "${INTEL}/mkl/${MKL_VERSION}/download/linux-64")
ExternalProject_Add(mkl
  URL               ${MKL_DIR}/mkl-${MKL_VERSION}-${MKL_BUILD}.tar.bz2
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   cp -dr lib ${CMAKE_INSTALL_PREFIX}
  )
set_target_properties(mkl PROPERTIES EXCLUDE_FROM_ALL 1)

# The MKL headers
set(MKL_INCLUDE_DIR "${INTEL}/mkl-include/${MKL_VERSION}/download/linux-64")
ExternalProject_Add(mkl-include
  URL ${MKL_INCLUDE_DIR}/mkl-include-${MKL_VERSION}-${MKL_BUILD}.tar.bz2
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   cp -dr include ${CMAKE_INSTALL_PREFIX}
  )
set_target_properties(mkl-include PROPERTIES EXCLUDE_FROM_ALL 1)
