#
# Copyright 2019 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, September 2019
#
find_package(Git REQUIRED)
ExternalProject_Add(wcad
  GIT_REPOSITORY    https://github.com/b-schnell/wcad.git
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   ""
  )
set_target_properties(wcad PROPERTIES EXCLUDE_FROM_ALL 1)
