#
# Copyright 2020 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, August2020
#

# Here we use 9.2 as it matches Idiap's current drivers
# Ref: https://docs.nvidia.com/deploy/cuda-compatibility/index.html
set(NVIDIA      "https://developer.nvidia.com/compute")
set(CUDA_VERSION "9.2")
set(CUDA_SUBVERSION ".148")
set(CUDA_DRIVER  "396.37")
set(CUDA_FILE    "cuda_${CUDA_VERSION}${CUDA_SUBVERSION}_${CUDA_DRIVER}_linux.run")

# NVidia conda distributions don't contain headers, so we use the original
# If this fails, download by hand and put into buslr/cache
BuSLR_Add(cuda
  URL "${NVIDIA}/cuda/${CUDA_VERSION}/Prod2/local_installers/${CUDA_FILE}"
  URL_MD5           8303cdf46904e6dea8d5d641b0b46f0d
  DOWNLOAD_NAME     ${CUDA_FILE}
  DOWNLOAD_NO_EXTRACT TRUE
  CONFIGURE_COMMAND sh <DOWNLOADED_FILE> --target <SOURCE_DIR> --noexec
  BUILD_COMMAND     true
  INSTALL_COMMAND   ./cuda-installer.pl --silent
                    --toolkit --toolkitpath=${CMAKE_INSTALL_PREFIX}/opt/cuda
		    --no-man-page  --no-drm
  )

# CUDNN binaries.  Lift from NVidia's conda dist is easiest
set(NVIDIA_CONDA "https://anaconda.org/nvidia")
set(CUDNN_VERSION "7.6.0")
set(CUDNN_BUILD   "cuda9.2_0")
set(CUDNN_DIR "${NVIDIA_CONDA}/cudnn/${CUDNN_VERSION}/download/linux-64")
BuSLR_Add(cudnn
  URL ${CUDNN_DIR}/cudnn-${CUDNN_VERSION}-${CUDNN_BUILD}.tar.bz2
  URL_MD5           3121c2a60064304f8566989a40de00bf
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
  URL ${NCCL_DIR}/${NCCL_TGZ}
  URL_MD5
  CONFIGURE_COMMAND true
  BUILD_COMMAND     ${CMAKE_MAKE_PROGRAM} src.build
                                          CUDA_HOME=${CUDA_TOOLKIT_ROOT_DIR}
  INSTALL_COMMAND   cp -dr build/lib build/include ${CMAKE_INSTALL_PREFIX}
)
ExternalProject_Add_StepDependencies(nccl build cuda)
