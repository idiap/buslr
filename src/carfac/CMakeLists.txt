#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#

BuSLR_Add(carfac
  GIT_REPOSITORY    https://github.com/google/carfac
  PATCH_COMMAND     cp ${CMAKE_CURRENT_SOURCE_DIR}/build.cmake
                       cpp/CMakeLists.txt
  SOURCE_SUBDIR     cpp
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  TEST_AFTER_INSTALL TRUE
)

ExternalProject_Add_StepDependencies(carfac build googletest)
