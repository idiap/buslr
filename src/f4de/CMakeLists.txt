#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, September 2020
#

BuSLR_Add(f4de
  GIT_REPOSITORY    https://github.com/usnistgov/F4DE
  GIT_TAG           3.5.0
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/F4DE
  PATCH_COMMAND     patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/patch.txt
  CONFIGURE_COMMAND true
  BUILD_COMMAND     ${MAKE_EXE} perl_install install
  INSTALL_COMMAND   true
  )

ExternalProject_Add_StepDependencies(f4de build locallib)
