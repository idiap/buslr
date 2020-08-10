#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#
set(GLOG_VERSION "0.4.0")
set(GLOG_DIR "https://github.com/google/glog/archive")
set(GLOG_TGZ "v${GLOG_VERSION}.tar.gz")
BuSLR_Add(glog
  URL               "${GLOG_DIR}/${GLOG_TGZ}"
  DOWNLOAD_NAME     "glog-${GLOG_VERSION}.tar.gz"
  URL_MD5           0daea8785e6df922d7887755c3d100d0
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  )
