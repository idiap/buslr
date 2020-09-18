#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#

BuSLR_Add(libssp
  GIT_REPOSITORY    https://github.com/idiap/libssp
  CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  TEST_AFTER_INSTALL TRUE
)

ExternalProject_Add_StepDependencies(libssp build lube)
