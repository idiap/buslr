#
# Copyright 2018 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Phil Garner, December 2018
#
find_package(Git REQUIRED)

ExternalProject_Add(mecab
  GIT_REPOSITORY    https://github.com/taku910/mecab.git
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND cd mecab && ./configure
                    --prefix=${CMAKE_INSTALL_PREFIX}
		    --with-charset=utf8
  BUILD_COMMAND     cd mecab && ${CMAKE_MAKE_PROGRAM}
  INSTALL_COMMAND   cd mecab && ${CMAKE_MAKE_PROGRAM} install
)
set_target_properties(mecab PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add(mecab-ipadic
  DOWNLOAD_COMMAND  ""
  PREFIX            mecab-prefix
  SOURCE_DIR        mecab-prefix/src/mecab
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND cd mecab-ipadic && ./configure
                    --prefix=${CMAKE_INSTALL_PREFIX}
                    --with-mecab-config=${CMAKE_INSTALL_PREFIX}/bin/mecab-config
		    --with-charset=utf8
  BUILD_COMMAND     cd mecab-ipadic && ${CMAKE_MAKE_PROGRAM}
  INSTALL_COMMAND   cd mecab-ipadic && ${CMAKE_MAKE_PROGRAM} install
)
set_target_properties(mecab-ipadic PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add(mecab-jumandic
  DOWNLOAD_COMMAND  ""
  PREFIX            mecab-prefix
  SOURCE_DIR        mecab-prefix/src/mecab
  BUILD_IN_SOURCE   true
  CONFIGURE_COMMAND cd mecab-jumandic && ./configure
                    --prefix=${CMAKE_INSTALL_PREFIX}
                    --with-mecab-config=${CMAKE_INSTALL_PREFIX}/bin/mecab-config
		    --with-charset=utf8
  BUILD_COMMAND     cd mecab-jumandic && ${CMAKE_MAKE_PROGRAM}
  INSTALL_COMMAND   cd mecab-jumandic && ${CMAKE_MAKE_PROGRAM} install
)
set_target_properties(mecab-jumandic PROPERTIES EXCLUDE_FROM_ALL 1)

ExternalProject_Add_StepDependencies(mecab-ipadic build mecab)
ExternalProject_Add_StepDependencies(mecab-jumandic build mecab)
