#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#
BuSLR_Add(kenlm
  URL               https://kheafield.com/code/kenlm.tar.gz
  URL_MD5           f7dce7d50387dc3ca21b408b36bd0838
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
		    -D KENLM_MAX_ORDER=20
		    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/kenlm
  INSTALL_COMMAND   true
  )
