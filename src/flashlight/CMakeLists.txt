#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#
BuSLR_Add(flashlight
  GIT_REPOSITORY    https://github.com/facebookresearch/flashlight.git
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                    -D FLASHLIGHT_BACKEND=CUDA
  )

ExternalProject_Add_StepDependencies(flashlight build gloo nccl arrayfire)
