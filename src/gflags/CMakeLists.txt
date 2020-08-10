#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#
set(GFLAGS_VERSION "2.2.2")
set(GFLAGS_DIR "https://github.com/gflags/gflags/archive")
set(GFLAGS_TGZ "v${GFLAGS_VERSION}.tar.gz")
BuSLR_Add(gflags
  URL               "${GFLAGS_DIR}/${GFLAGS_TGZ}"
  DOWNLOAD_NAME     "gflags-${GFLAGS_VERSION}.tar.gz"
  URL_MD5           1a865b93bacfa963201af3f75b7bd64c
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  )
