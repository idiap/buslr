#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, September 2020
#

BuSLR_Add(mitlm
  GIT_REPOSITORY    https://github.com/mitlm/mitlm
  GIT_TAG           v0.4.2
  CONFIGURE_COMMAND autoreconf -i && ./configure --prefix=${CMAKE_INSTALL_PREFIX}
  BUILD_COMMAND     ${MAKE_EXE}
  INSTALL_COMMAND   ${MAKE_EXE} install
  )
