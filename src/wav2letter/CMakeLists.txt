#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#

set(ENV{KENLM_ROOT_DIR} "${CMAKE_INSTALL_PREFIX}/kenlm")
BuSLR_Add(wav2letter
  GIT_REPOSITORY    https://github.com/facebookresearch/wav2letter.git
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  )

ExternalProject_Add_StepDependencies(wav2letter build
  flashlight glog gflags kenlm
  )
