#
# Author(s):
#   Phil Garner, June 2017
#
cmake_minimum_required(VERSION 3.8)

project(carfac)
set(VERSION 0.1)

set(CMAKE_CXX_STANDARD 11)

# The basic library just depends on Eigen3
find_package(Eigen3 REQUIRED)
include_directories(${EIGEN3_INCLUDE_DIR})

add_library(carfac SHARED
  binaural_sai.cc
  carfac.cc
  ear.cc
  sai.cc
  )

list(APPEND HEADERS carfac.h agc.h common.h car.h ihc.h)
set_target_properties(carfac
  PROPERTIES OUTPUT_NAME   "carfac"
             PUBLIC_HEADER "${HEADERS}"
  )

# Things to install
set(INSTALL_TARGETS
  carfac
)

# CMake install line
install(
  TARGETS ${INSTALL_TARGETS}
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  PUBLIC_HEADER DESTINATION include/carfac
  )

# These require gtest
#add_executable(binaural_sai_test binaural_sai_test.cc)
#target_link_libraries(binaural_sai_test carfac ${GTEST_LIBRARIES})
#add_executable(carfac_test carfac_test.cc)
#target_link_libraries(carfac_test carfac ${GTEST_LIBRARIES})
#add_executable(sai_test sai_test.cc)
#target_link_libraries(sai_test carfac ${GTEST_LIBRARIES})
