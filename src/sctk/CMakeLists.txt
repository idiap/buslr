#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#

#
# Original:   ftp://jaguar.ncsl.nist.gov/pub/sctk-2.4.10-20151007-1312Z.tar.bz2
# Mirror: http://www.openslr.org/resources/4/sctk-2.4.10-20151007-1312Z.tar.bz2
#
# This is the one shipped with Kaldi.  The official NIST version is on github
#  https://github.com/usnistgov/SCTK
# and is linked from the main NIST site
#  https://www.nist.gov/itl/iad/mig/tools
#
BuSLR_Add(sctk
  URL http://www.openslr.org/resources/4/sctk-2.4.10-20151007-1312Z.tar.bz2
  PATCH_COMMAND     patch -p0 < ${CMAKE_CURRENT_SOURCE_DIR}/patch.txt
  CONFIGURE_COMMAND PREFIX=${CMAKE_INSTALL_PREFIX} ${MAKE_EXE} config
  BUILD_COMMAND     ${MAKE_EXE} all
  INSTALL_COMMAND   ${MAKE_EXE} install
  )
