#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
find_package(Git REQUIRED)
find_package(CUDA)

# Kaldi commits can be quite variable, so use a specific tag here
BuSLR_Add(kaldi
  GIT_REPOSITORY    https://github.com/kaldi-asr/kaldi
  GIT_TAG           794732ac31426d6bfd39b27c66ef7bdcfcd80a79
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/kaldi
  PATCH_COMMAND     cd tools && ${MAKE_EXE} cub
  CONFIGURE_COMMAND cd src &&
                    CC=gcc-7 CXX=g++-7
                    ./configure --shared
		                --cudatk-dir=${CUDA_TOOLKIT_ROOT_DIR}
		                --mkl-root=$ENV{MKLROOT}
		                --mkl-libdir=$ENV{MKLROOT}/lib # Maybe + intel64
                                --fst-root=${CMAKE_INSTALL_PREFIX}
                                --fst-version=1.6.7 &&
                    ${MAKE_EXE} depend
  BUILD_COMMAND     cd src && ${MAKE_EXE}
  INSTALL_COMMAND   true
  )

ExternalProject_Add_StepDependencies(kaldi build sph2pipe sctk openfst mkl cuda)


BuSLR_Add(kaldi_lm
  URL               http://www.danielpovey.com/files/kaldi/kaldi_lm.tar.gz
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/kaldi/tools/kaldi_lm
  CONFIGURE_COMMAND true
  BUILD_COMMAND     ${MAKE_EXE}
  INSTALL_COMMAND   true
  )

ExternalProject_Add_StepDependencies(kaldi_lm build kaldi)
