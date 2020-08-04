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

# The MKL headers
set(MKL_INCLUDE_DIR "${INTEL}/mkl-include/${MKL_VERSION}/download/linux-64")
BuSLR_Add(mkl-include
  URL ${MKL_INCLUDE_DIR}/mkl-include-${MKL_VERSION}-${MKL_BUILD}.tar.bz2
  URL_MD5           6870b1f2f7f428f88f0abd7af56a2a66
  CONFIGURE_COMMAND true
  BUILD_COMMAND     true
  INSTALL_COMMAND   cp -dr include ${CMAKE_INSTALL_PREFIX}
  )

# OpenMP: FindBLAS will not work without this
set(OPENMP_DIR "${INTEL}/intel-openmp/${MKL_VERSION}/download/linux-64")
BuSLR_Add(intel-openmp
  URL ${OPENMP_DIR}/intel-openmp-${MKL_VERSION}-${MKL_BUILD}.tar.bz2
  URL_MD5           bcf8241c035ba3adc7dbcbde695a865e
  CONFIGURE_COMMAND true
  BUILD_COMMAND     true
  INSTALL_COMMAND   cp -dr lib ${CMAKE_INSTALL_PREFIX}
  )

# Raw MKL library
set(MKL_DIR     "${INTEL}/mkl/${MKL_VERSION}/download/linux-64")
BuSLR_Add(mkl
  URL               ${MKL_DIR}/mkl-${MKL_VERSION}-${MKL_BUILD}.tar.bz2
  URL_MD5           0ff92a9a6890377f8dc6fe45988a8d26
  CONFIGURE_COMMAND true
  BUILD_COMMAND     true
  INSTALL_COMMAND   cp -dr lib ${CMAKE_INSTALL_PREFIX}
  )

# MKL is actually not useful without headers and OpenMP
ExternalProject_Add_StepDependencies(mkl build mkl-include intel-openmp)
