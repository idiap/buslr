#
# Copyright 2019 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, September 2019
#

set(CMAKE_INSTALL_SCRIPT ${CMAKE_CURRENT_BINARY_DIR}/cmake_install.cmake)

ExternalProject_Add(idiaptts
  GIT_REPOSITORY    https://github.com/idiap/IdiapTTS
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   python -m pip install . --no-deps --ignore-installed -v
  )
set_target_properties(idiaptts PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Get_property(idiaptts SOURCE_DIR)

ExternalProject_Add(idiaptts-english
  URL ${SOURCE_DIR}/idiaptts/scripts/tts_frontend/English/festival_files.tar.gz
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   ${CMAKE_COMMAND} -P ${CMAKE_INSTALL_SCRIPT}
  )
set_target_properties(idiaptts-english PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Get_property(idiaptts-english SOURCE_DIR)

install(
  DIRECTORY   ${SOURCE_DIR}/lib
  DESTINATION opt/festival
)
