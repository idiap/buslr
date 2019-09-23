#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#

# To download SRILM go through the registration page, download the file, and
# copy it to `buslr/src/srilm`.  The URL below then points to that file.
set(SRILM ${CMAKE_CURRENT_BINARY_DIR}/srilm-prefix/src/srilm)
ExternalProject_Add(srilm
  URL               ${CMAKE_CURRENT_SOURCE_DIR}/srilm-1.7.2.tar.gz
  URL_MD5           b8d2be62b128de012d7a732cda679b22
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     SRILM=${SRILM} ${CMAKE_MAKE_PROGRAM}
  INSTALL_COMMAND   ""
  )
set_target_properties(srilm PROPERTIES EXCLUDE_FROM_ALL 1)
