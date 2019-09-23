#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
find_package(Git REQUIRED)
ExternalProject_Add(libssp
  GIT_REPOSITORY    https://github.com/idiap/libssp
  BUILD_IN_SOURCE   true
  CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
)
set_target_properties(libssp PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add_StepDependencies(libssp build lube)
