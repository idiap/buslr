#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
find_package(Git REQUIRED)
ExternalProject_Add(tracter
  GIT_REPOSITORY    https://github.com/idiap/tracter
  BUILD_IN_SOURCE   true
  PATCH_COMMAND     ./prepare.sh
  CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
)
set_target_properties(tracter PROPERTIES EXCLUDE_FROM_ALL 1)
