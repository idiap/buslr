#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
set(HTK_VERSION "3.4.1")
set(HTS_VERSION "2.3")
set(HTS_STRING "HTS-${HTS_VERSION}_for_HTK-${HTK_VERSION}")

set(CONFARGS
  --prefix=${CMAKE_INSTALL_PREFIX}
  --enable-hdecode
  )

find_package(X11)
if (X11_FOUND)
  list(APPEND CONFARGS
    --with-x
    --x-includes=${X11_INCLUDE_DIR}
    --x-libraries="${X11_LIBRARIES}"
    )
else()
  list(APPEND CONFARGS
    --without-x
    )
endif()

# To download HTK go through the registration page, download the file, and copy
# it to `buslr/src/hts`.
ExternalProject_Add(hts
  BUILD_IN_SOURCE true
  DOWNLOAD_COMMAND
      tar zxf ${CMAKE_CURRENT_SOURCE_DIR}/HTK-${HTK_VERSION}.tar.gz &&
      tar zxf ${CMAKE_CURRENT_SOURCE_DIR}/HDecode-${HTK_VERSION}.tar.gz &&
      rmdir hts &&
      mv htk hts
  PATCH_COMMAND patch -p1 < ../htspatch/${HTS_STRING}.patch
  CONFIGURE_COMMAND ./configure ${CONFARGS}
  )
set_target_properties(hts PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add(htspatch
  PREFIX hts-prefix  
  URL http://hts.sp.nitech.ac.jp/archives/${HTS_VERSION}/${HTS_STRING}.tar.bz2
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  )
set_target_properties(htspatch PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add_StepDependencies(hts patch htspatch)
