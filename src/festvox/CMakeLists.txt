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
# be bothered.  Rather, the festival family has a build-in-source model; we do
# an "in place" build by setting SOURCE_DIR to something reasonable and
# skipping the install step.
#
# This build process is based on http://festvox.org/do_install
#

find_package(Git REQUIRED)

set(CMAKE_INSTALL_SCRIPT ${CMAKE_CURRENT_BINARY_DIR}/cmake_install.cmake)
set(FESTVOX "http://www.festvox.org")
set(FESTPACK "${FESTVOX}/packed/festival/2.5")

BuSLR_Add(speech_tools
  GIT_REPOSITORY    https://github.com/festvox/speech_tools
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/speech_tools
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}/speech_tools
  INSTALL_COMMAND   true
  )

BuSLR_Add(festival
  GIT_REPOSITORY    https://github.com/festvox/festival
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/festival
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}/festival
  INSTALL_COMMAND   true
  )

BuSLR_Add(festvox
  GIT_REPOSITORY    https://github.com/festvox/festvox
  SOURCE_DIR        ${CMAKE_INSTALL_PREFIX}/festvox
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}/festvox
  INSTALL_COMMAND   true
  )

ExternalProject_Add_StepDependencies(festival build speech_tools)
ExternalProject_Add_StepDependencies(festvox build speech_tools festival)

#
# Festival data.  One project per data file.
# Make sure to install after festival but before festvox.
#
# The caching won't work for these as written.  todo...
#
set(DICTS
  festlex_CMU
  festlex_POSLEX
  )
foreach(DICT ${DICTS})
  BuSLR_Add(${DICT}
    URL               ${FESTPACK}/${DICT}.tar.gz
    CONFIGURE_COMMAND true
    BUILD_COMMAND     true
    INSTALL_COMMAND   cp -Lr . ${CMAKE_INSTALL_PREFIX}/festival
    )
  ExternalProject_Add_StepDependencies(${DICT} install festival)
  ExternalProject_Add_StepDependencies(festvox install ${DICT})
endforeach()
