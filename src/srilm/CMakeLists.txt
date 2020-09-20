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
BuSLR_Add(srilm
  URL               http://www.speech.sri.com/projects/srilm-1.7.2.tar.gz
  URL_MD5           b8d2be62b128de012d7a732cda679b22
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/srilm
  CONFIGURE_COMMAND true
  BUILD_COMMAND     SRILM=<SOURCE_DIR> ${MAKE_EXE}
  INSTALL_COMMAND   true
  )
