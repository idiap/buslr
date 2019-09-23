#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
find_package(Git REQUIRED)
ExternalProject_Add(irstlm
  GIT_REPOSITORY    https://github.com/irstlm-team/irstlm
  PATCH_COMMAND     patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/patch.txt
  CMAKE_ARGS        -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  )
set_target_properties(irstlm PROPERTIES EXCLUDE_FROM_ALL 1)
