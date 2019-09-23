#
# Copyright 2019 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, September 2019
#

set(CMAKE_INSTALL_SCRIPT ${CMAKE_CURRENT_BINARY_DIR}/cmake_install.cmake)

ExternalProject_Add(unisyn
  URL               ${CMAKE_CURRENT_SOURCE_DIR}/unisyn13.tgz
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   ${CMAKE_COMMAND} -P ${CMAKE_INSTALL_SCRIPT}
  )
set_target_properties(unisyn PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Get_property(unisyn BINARY_DIR)

install(
  DIRECTORY   ${BINARY_DIR}/festival
  DESTINATION opt
)
