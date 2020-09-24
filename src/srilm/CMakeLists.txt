#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#

# To download SRILM go through the registration page at:
#  http://www.speech.sri.com/projects/srilm/download.html
# download the file, and copy it to `buslr/src/srilm`.
# The URL below then points to that file.
BuSLR_Add(srilm
  URL               http://www.speech.sri.com/projects/srilm-1.7.3.tar.gz
  URL_MD5           d69c9718de86daaa5862d29667daf149
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/srilm
  CONFIGURE_COMMAND true
  BUILD_COMMAND     ${MAKE_EXE} SRILM=<SOURCE_DIR> HAVE_LIBLBFGS=1
		       ADDITIONAL_INCLUDES=-I${CMAKE_INSTALL_PREFIX}/include
		       ADDITIONAL_LDFLAGS=-L${CMAKE_INSTALL_PREFIX}/lib
  INSTALL_COMMAND   true
  )

ExternalProject_Add_StepDependencies(srilm build liblbfgs)
