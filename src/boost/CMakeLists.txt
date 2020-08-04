#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#

ExternalProject_Add(boost
  URL https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.bz2
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ./bootstrap.sh
                    --prefix=${CMAKE_INSTALL_PREFIX}
                    --with-libraries=date_time,filesystem,graph,regex
  INSTALL_COMMAND   ./b2 install
  )
set_target_properties(boost PROPERTIES EXCLUDE_FROM_ALL 1)
