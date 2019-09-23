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

set(CMAKE_ARGS "-DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")
if (${CUDA_CUDA_LIBRARY} STREQUAL "CUDA_CUDA_LIBRARY-NOTFOUND")
  list(APPEND CMAKE_ARGS "-DCOMPILE_CUDA=off")
endif (${CUDA_CUDA_LIBRARY} STREQUAL "CUDA_CUDA_LIBRARY-NOTFOUND")

ExternalProject_Add(marian
  GIT_REPOSITORY    https://github.com/marian-nmt/marian
  UPDATE_COMMAND    ""
  CMAKE_ARGS        ${CMAKE_ARGS}
)
set_target_properties(marian PROPERTIES EXCLUDE_FROM_ALL 1)
