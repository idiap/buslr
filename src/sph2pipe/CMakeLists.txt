#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
ExternalProject_Add(sph2pipe
  URL           http://www.openslr.org/resources/3/sph2pipe_v2.5.tar.gz
  PATCH_COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/build.cmake CMakeLists.txt
  CMAKE_ARGS    -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  )
set_target_properties(sph2pipe PROPERTIES EXCLUDE_FROM_ALL 1)
