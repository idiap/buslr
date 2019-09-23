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

# Add each directory in the src directory
file(GLOB dirs ${CMAKE_CURRENT_SOURCE_DIR}/src/*)
foreach(dir ${dirs})
  if(EXISTS "${dir}/CMakeLists.txt")
    add_subdirectory(${dir})
  endif()
endforeach(dir)
