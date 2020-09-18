#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#

BuSLR_Add(tracter
  GIT_REPOSITORY    https://github.com/idiap/tracter
  PATCH_COMMAND     ./prepare.sh
  CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_C_COMPILER=clang
                    -DCMAKE_CXX_COMPILER=clang++
)

ExternalProject_Add_StepDependencies(tracter build
  boost lube sptk libresample libssp
  )
