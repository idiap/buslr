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
  GIT_TAG           aadba79a51cc7d9b8d63a8f16afb14e5ef25590e
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                    -D FLASHLIGHT_BACKEND=CUDA
  )

ExternalProject_Add_StepDependencies(flashlight build gloo nccl arrayfire)

# August 2020: flashlight can't find googletest unless you let it download its
# own copy
