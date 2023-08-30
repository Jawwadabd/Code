# Install script for directory: /home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xt-build")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/xtensor-blas" TYPE FILE FILES
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/include/xtensor-blas/xblas.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/include/xtensor-blas/xblas_utils.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/include/xtensor-blas/xblas_config.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/include/xtensor-blas/xblas_config_cling.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/include/xtensor-blas/xlapack.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/include/xtensor-blas/xlinalg.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/include/xflens" REGEX "/[^/]*\\.tgz$" EXCLUDE REGEX "/Makefile$" EXCLUDE REGEX "/dummy\\.in\\.cc$" EXCLUDE REGEX "/filter\\.pm$" EXCLUDE REGEX "/CMakeLists\\.txt$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor-blas" TYPE FILE FILES
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/xtensor-blasConfig.cmake"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/xtensor-blasConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor-blas/xtensor-blasTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor-blas/xtensor-blasTargets.cmake"
         "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/CMakeFiles/Export/lib/cmake/xtensor-blas/xtensor-blasTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor-blas/xtensor-blasTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor-blas/xtensor-blasTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor-blas" TYPE FILE FILES "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/CMakeFiles/Export/lib/cmake/xtensor-blas/xtensor-blasTargets.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor-blas/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
