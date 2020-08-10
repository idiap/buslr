#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#
set(GTEST_VERSION "1.10.0")
set(GTEST_DIR "https://github.com/google/googletest/archive")
set(GTEST_TGZ "release-${GTEST_VERSION}.tar.gz")
BuSLR_Add(googletest
  URL               "${GTEST_DIR}/${GTEST_TGZ}"
  DOWNLOAD_NAME     "googletest-${GTEST_VERSION}.tar.gz"
  URL_MD5           ecd1fa65e7de707cd5c00bdac56022cd
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  )
