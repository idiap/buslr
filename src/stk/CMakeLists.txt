#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, September 2020
#

BuSLR_Add(stk
  GIT_REPOSITORY    https://github.com/stk-developers/stk
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX} --without-atlas
  BUILD_COMMAND     ${MAKE_EXE}
  INSTALL_COMMAND   ${MAKE_EXE} install
  )
