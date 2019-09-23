#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
project(sph2pipe)
cmake_minimum_required(VERSION 3.9)
set(CMAKE_C_STANDARD 90)
add_executable(sph2pipe file_headers.c shorten_x.c sph2pipe.c)
target_link_libraries(sph2pipe m)
install(TARGETS sph2pipe
  RUNTIME DESTINATION bin
)
