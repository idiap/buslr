#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
set(CMAKE_INSTALL_SCRIPT ${CMAKE_CURRENT_BINARY_DIR}/cmake_install.cmake)
ExternalProject_Add(libresample
  URL               http://ccrma.stanford.edu/~jos/gz/libresample-0.1.3.tgz
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND CFLAGS=-fPIC ./configure --prefix=${CMAKE_INSTALL_PREFIX}
  INSTALL_COMMAND   ${CMAKE_COMMAND} -P ${CMAKE_INSTALL_SCRIPT}
  )
set_target_properties(libresample PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Get_property(libresample SOURCE_DIR)
ExternalProject_Get_property(libresample BINARY_DIR)

install(FILES
  ${BINARY_DIR}/libresample.a
  DESTINATION lib
  )

install(FILES
  ${SOURCE_DIR}/include/libresample.h
  DESTINATION include
  )
