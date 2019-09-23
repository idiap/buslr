#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#

# Right now, this one has my CMake configuration including something for
# GoogleTest.  CMake has a GoogleTest package, so this may all be moot.
find_package(Git REQUIRED)
ExternalProject_Add(carfac
  GIT_REPOSITORY    https://github.com/pgarner/carfac
  GIT_TAG           devel
  BUILD_IN_SOURCE   true
  SOURCE_SUBDIR     cpp
  CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
)
set_target_properties(carfac PROPERTIES EXCLUDE_FROM_ALL 1)
