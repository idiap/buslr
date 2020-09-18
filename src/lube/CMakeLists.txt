#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#

BuSLR_Add(lube
  GIT_REPOSITORY    https://github.com/pgarner/libube
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                    -D CMAKE_C_COMPILER=clang
                    -D CMAKE_CXX_COMPILER=clang++
#  TEST_AFTER_INSTALL TRUE
  )

ExternalProject_Add_StepDependencies(lube build mkl)
