# Install script for directory: /home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/xtl" TYPE FILE FILES
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xany.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xbasic_fixed_string.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xbase64.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xclosure.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xcomplex.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xcomplex_sequence.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xspan.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xspan_impl.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xdynamic_bitset.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xfunctional.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xhalf_float.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xhalf_float_impl.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xhash.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xhierarchy_generator.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xiterator_base.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xjson.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xmasked_value_meta.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xmasked_value.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xmeta_utils.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xmultimethods.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xoptional_meta.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xoptional.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xoptional_sequence.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xplatform.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xproxy_wrapper.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xsequence.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xsystem.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xtl_config.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xtype_traits.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xvariant.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xvariant_impl.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/include/xtl/xvisitor.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake/xtl" TYPE FILE FILES
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/xtlConfig.cmake"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/xtlConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/cmake/xtl/xtlTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/cmake/xtl/xtlTargets.cmake"
         "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/CMakeFiles/Export/share/cmake/xtl/xtlTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/cmake/xtl/xtlTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/cmake/xtl/xtlTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake/xtl" TYPE FILE FILES "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/CMakeFiles/Export/share/cmake/xtl/xtlTargets.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pkgconfig" TYPE FILE FILES "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/xtl.pc")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtl/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
