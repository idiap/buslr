#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
cmake_minimum_required(VERSION 3.9)
project(BuSLR)
include(ExternalProject)

# Default is /usr/local; this overrides it to the current directory
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}"
    CACHE PATH "..." FORCE)
endif()

# Add the install prefix to the paths so deps can be found
if(NOT DEFINED ENV{MKLROOT})
  message(STATUS "Setting MKLROOT")
  set(ENV{MKLROOT} ${CMAKE_INSTALL_PREFIX})
endif()
set(ENV{PATH} "${CMAKE_INSTALL_PREFIX}/bin:$ENV{PATH}")
set(ENV{LD_LIBRARY_PATH} "${CMAKE_INSTALL_PREFIX}/lib:$ENV{LD_LIBRARY_PATH}")

# Wrapper macro for the generic build; adds defaults
# You can say -D INHIBIT="foo;bar" to inhibit the targets foo and bar
set(DOWNLOAD_DIR "${CMAKE_SOURCE_DIR}/cache")
function(BuSLR_Add)
  if(${ARGV0} IN_LIST INHIBIT)
    # Empty target
    message(STATUS "Inhibited ${ARGV0}")
    ExternalProject_Add(${ARGV0}
      DOWNLOAD_COMMAND  true
      CONFIGURE_COMMAND true
      BUILD_COMMAND     true
      INSTALL_COMMAND   true
      EXCLUDE_FROM_ALL  TRUE
      )
  else()
    # Real target
    ExternalProject_Add(${ARGV}
      DOWNLOAD_DIR      ${DOWNLOAD_DIR}
      BUILD_IN_SOURCE   TRUE
      EXCLUDE_FROM_ALL  TRUE
      )
  endif()
endfunction()

# Add each directory in the src directory
file(GLOB dirs ${CMAKE_CURRENT_SOURCE_DIR}/src/*)
foreach(dir ${dirs})
  if(EXISTS "${dir}/CMakeLists.txt")
    add_subdirectory(${dir})
  endif()
endforeach(dir)

# Helper script
configure_file(
  etc/buslrvars.sh.in ${CMAKE_CURRENT_BINARY_DIR}/etc/buslrvars.sh
  @ONLY
  )
