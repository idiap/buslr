#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, September 2020
#

# Allow local perl modules; see https://metacpan.org/pod/local::lib
BuSLR_Add(locallib
  GIT_REPOSITORY    https://github.com/Perl-Toolchain-Gang/local-lib
  GIT_TAG           v2.000_025
  CONFIGURE_COMMAND true
  BUILD_COMMAND     perl Makefile.PL --bootstrap=${CMAKE_INSTALL_PREFIX}/perl5
  INSTALL_COMMAND   ${MAKE_EXE} install
  )
