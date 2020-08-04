#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, July 2020
#

# This is a good reference:
# https://github.com/archlinux/svntogit-community/blob/packages/arrayfire/trunk/PKGBUILD

set(AF_VERSION 3.7.2)
set(AF_DIR "http://github.com/arrayfire/arrayfire/releases/download/v${AF_VERSION}")
set(AF_TGZ "arrayfire-full-${AF_VERSION}.tar.bz2")
BuSLR_Add(arrayfire
  URL               "${AF_DIR}/${AF_TGZ}"
  URL_MD5           cb01959ac50217a7151dc135f177b444
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                    -D AF_BUILD_CPU=ON
                    -D AF_BUILD_CUDA=OFF
                    -D AF_BUILD_OPENCL=OFF
                    -D AF_WITH_CUDNN=OFF
		    -D USE_CPU_MKL=ON
)

ExternalProject_Add_StepDependencies(arrayfire build mkl boost)
