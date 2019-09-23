#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
ExternalProject_Add(sptk
  URL               http://downloads.sourceforge.net/sp-tk/SPTK-3.11.tar.gz
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}
  )
set_target_properties(sptk PROPERTIES EXCLUDE_FROM_ALL 1)
