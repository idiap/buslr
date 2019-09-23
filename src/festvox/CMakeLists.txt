#
# Copyright 2019 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, September 2019
#

#
# Festival & co are quite difficult to build.  They like to be together 
#
# There are packages like this:
# https://git.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/festival
# that try to pick apart the right parts of festival.  For the moment, I can't
# be bothered.  Rather, the festival family has a build-in-source model; just
# copy everything into /opt
#
# This build process is based on http://festvox.org/do_install
#

find_package(Git REQUIRED)

set(CMAKE_INSTALL_SCRIPT ${CMAKE_CURRENT_BINARY_DIR}/cmake_install.cmake)
set(FESTVOX "http://www.festvox.org")
set(FESTPACK "${FESTVOX}/packed/festival/2.5")

ExternalProject_Add(speech_tools
  GIT_REPOSITORY    https://github.com/festvox/speech_tools
  PREFIX            festvox-prefix
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}/opt
  INSTALL_COMMAND
    rm -rf ${CMAKE_INSTALL_PREFIX}/opt/speech_tools &&
    cp -Lr ../speech_tools ${CMAKE_INSTALL_PREFIX}/opt
  )
set_target_properties(speech_tools PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add(festival
  GIT_REPOSITORY    https://github.com/festvox/festival
  PREFIX            festvox-prefix
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}/opt
  INSTALL_COMMAND
    rm -rf ${CMAKE_INSTALL_PREFIX}/opt/festival &&
    cp -Lr ../festival ${CMAKE_INSTALL_PREFIX}/opt
  )
set_target_properties(festival PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add(festvox
  GIT_REPOSITORY    https://github.com/festvox/festvox
  PREFIX            festvox-prefix
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}/opt
  INSTALL_COMMAND
    rm -rf ${CMAKE_INSTALL_PREFIX}/opt/festvox &&
    cp -Lr ../festvox ${CMAKE_INSTALL_PREFIX}/opt
  )
set_target_properties(festvox PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add_StepDependencies(festival build speech_tools)
ExternalProject_Add_StepDependencies(festvox build speech_tools festival)

#
# Festival data.  One project per data file.
# Make sure to install after festival but before festvox.
#
set(DICTS
  festlex_CMU
  festlex_POSLEX
  )
foreach(DICT ${DICTS})
  ExternalProject_Add(${DICT}
    URL               ${FESTPACK}/${DICT}.tar.gz
    BUILD_IN_SOURCE   true
    CONFIGURE_COMMAND ""
    BUILD_COMMAND     ""
    INSTALL_COMMAND   cp -Lr . ${CMAKE_INSTALL_PREFIX}/opt/festival
    )
  set_target_properties(${DICT} PROPERTIES EXCLUDE_FROM_ALL 1)
  ExternalProject_Add_StepDependencies(${DICT} install festival)
  ExternalProject_Add_StepDependencies(festvox install ${DICT})
endforeach()
