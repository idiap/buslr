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
#
# With CUDA 10.0, we need gcc-7 as host compiler
# The array 3.0;3.4;... doesn't survive function wrapping; this is a problem!
set(AF_VERSION 3.7.2)
set(AF_DIR "http://github.com/arrayfire/arrayfire/releases/download/v${AF_VERSION}")
set(AF_TGZ "arrayfire-full-${AF_VERSION}.tar.bz2")
BuSLR_Add(arrayfire
  URL               "${AF_DIR}/${AF_TGZ}"
  URL_MD5           cb01959ac50217a7151dc135f177b444
  CMAKE_ARGS        -Wno-dev
                    -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                    -D AF_BUILD_CPU=ON
                    -D AF_BUILD_CUDA=ON
                    -D AF_BUILD_OPENCL=OFF
                    -D AF_WITH_CUDNN=ON
		    -D USE_CPU_MKL=ON
		    -D USE_OPENCL_MKL=ON
		    -D AF_BUILD_EXAMPLES=OFF
		    -D AF_BUILD_DOCS=OFF
		    -D CUDA_HOST_COMPILER=/usr/bin/gcc-7
#		    -D CUDA_architecture_build_targets=3.0;3.5;6.0;6.1;7.0;7.2;7.5
)

ExternalProject_Add_StepDependencies(arrayfire build mkl boost cuda cudnn)

# Build targets (-D CUDA_architecture_build_targets=...)
# Arch uses these;
#  5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0
# ArrayFire defaults to these:
#  3.0;3.5;5.0;5.2;6.0;6.1;7.0;7.0+PTX
# Idiap has:
#  3.0;3.5;6.0;6.1;7.0;7.2;7.5

# Not tested...
set(AFBIN_DIR "https://arrayfire.s3.amazonaws.com/${AF_VERSION}")
set(AFBIN_TGZ "ArrayFire-v${AF_VERSION}_Linux_x86_64.sh")
BuSLR_Add(arrayfire-bin
  URL               "${AFBIN_DIR}/${AFBIN_TGZ}"
  URL_MD5
  CONFIGURE_COMMAND true
  BUILD_COMMAND     true
  INSTALL_COMMAND   sh ${AFBIN_TGZ} --prefix=${CMAKE_INSTALL_PREFIX}
                                    --skip-license
)
