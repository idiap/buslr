#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August 2020
#

# https://developer.nvidia.com/cuda-toolkit
# Here we use 10.2 as it matches Idiap's current drivers
# Ref: https://docs.nvidia.com/deploy/cuda-compatibility/index.html
set(NVIDIA      "https://developer.download.nvidia.com/compute")
set(CUDA_VERSION "10.2")
set(CUDA_SUBVERSION ".89")
set(CUDA_DRIVER  "440.33.01")
set(CUDA_FILE    "cuda_${CUDA_VERSION}${CUDA_SUBVERSION}_${CUDA_DRIVER}_linux.run")

# NVidia conda distributions don't contain headers, so we use the original
# If this fails, download by hand and put into buslr/cache
#
# It's possible to add --extract=<SOURCE_DIR>, but then the installer has to be
# run explicitly too
BuSLR_Add(cuda
  URL "${NVIDIA}/cuda/${CUDA_VERSION}/Prod/local_installers/${CUDA_FILE}"
  URL_MD5           3d816c583759efa8567a92c1a2af90db
  DOWNLOAD_NAME     ${CUDA_FILE}
  DOWNLOAD_NO_EXTRACT TRUE
  CONFIGURE_COMMAND true
  BUILD_COMMAND     true
  INSTALL_COMMAND   mkdir -p ${CMAKE_INSTALL_PREFIX}/opt &&
                    sh <DOWNLOADED_FILE> --silent --override --toolkit
			--installpath=${CMAKE_INSTALL_PREFIX}/opt/cuda
			--no-man-page --no-drm
  )

# CUDNN binaries.  Lift from NVidia's conda dist is easiest
set(NVIDIA_CONDA "https://anaconda.org/nvidia")
set(CUDNN_VERSION "8.0.0")
set(CUDNN_BUILD   "cuda10.2_0")
set(CUDNN_DIR "${NVIDIA_CONDA}/cudnn/${CUDNN_VERSION}/download/linux-64")
BuSLR_Add(cudnn
  URL ${CUDNN_DIR}/cudnn-${CUDNN_VERSION}-${CUDNN_BUILD}.tar.bz2
  URL_MD5           efd6901a5540f1c73ab0bdc06b9eaa98
  CONFIGURE_COMMAND true
  BUILD_COMMAND     true
  INSTALL_COMMAND   cp -dr lib include ${CMAKE_INSTALL_PREFIX}
  )

# NCCL: Use a github archive
set(NCCL_VERSION "2.7.8-1")
set(NCCL_DIR "https://github.com/NVIDIA/nccl/archive")
set(NCCL_TGZ "v${NCCL_VERSION}.tar.gz")
find_package(CUDA)
BuSLR_Add(nccl
  URL               ${NCCL_DIR}/${NCCL_TGZ}
  DOWNLOAD_NAME     "nccl-${NCCL_VERSION}.tar.gz"
  URL_MD5           2ad66167be386ec506426cede8a90df2
  CONFIGURE_COMMAND true
  BUILD_COMMAND     CC=gcc-7 CXX=g++-7
                    ${MAKE_EXE} src.build CUDA_HOME=${CUDA_TOOLKIT_ROOT_DIR}
  INSTALL_COMMAND   cp -dr build/lib build/include ${CMAKE_INSTALL_PREFIX}
)
ExternalProject_Add_StepDependencies(nccl build cuda)
