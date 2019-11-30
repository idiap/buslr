#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
find_package(Git REQUIRED)
ExternalProject_Add(kaldi
  GIT_REPOSITORY    https://github.com/kaldi-asr/kaldi
  GIT_TAG           ca32c4e2bd77544c4ad4aa0bba25f0b812ea1a61
  BUILD_IN_SOURCE   true
  PATCH_COMMAND     cd tools && ${CMAKE_MAKE_PROGRAM} cub
  CONFIGURE_COMMAND cd src &&
                    ./configure --shared
		                --mkl-root=${CMAKE_INSTALL_PREFIX}
		                --mkl-libdir=${CMAKE_INSTALL_PREFIX}/lib
                                --fst-root=${CMAKE_INSTALL_PREFIX}
                                --fst-version=1.6.7 &&
                    ${CMAKE_MAKE_PROGRAM} depend
  BUILD_COMMAND     cd src && ${CMAKE_MAKE_PROGRAM}
  INSTALL_COMMAND   ""
  )
set_target_properties(kaldi PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add_StepDependencies(kaldi build sph2pipe sctk openfst)
