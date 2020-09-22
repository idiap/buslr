#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#

BuSLR_Add(gloo
  GIT_REPOSITORY    https://github.com/facebookincubator/gloo
  GIT_TAG           fe2ad9c3283550962437c0fa2485c3d55374c6ea
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                    -D USE_MPI=ON
                    -D USE_CUDA=ON
		    -D USE_NCCL=ON
  )
