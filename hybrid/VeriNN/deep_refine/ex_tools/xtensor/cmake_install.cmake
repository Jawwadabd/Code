# Install script for directory: /home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/xtensor" TYPE FILE FILES
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xaccessible.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xaccumulator.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xadapt.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xarray.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xassign.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xaxis_iterator.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xaxis_slice_iterator.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xblockwise_reducer.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xblockwise_reducer_functors.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xbroadcast.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xbuffer_adaptor.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xbuilder.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xchunked_array.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xchunked_assign.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xchunked_view.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xcomplex.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xcontainer.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xcsv.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xdynamic_view.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xeval.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xexception.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xexpression.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xexpression_holder.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xexpression_traits.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xfixed.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xfunction.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xfunctor_view.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xgenerator.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xhistogram.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xindex_view.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xinfo.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xio.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xiterable.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xiterator.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xjson.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xlayout.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xmanipulation.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xmasked_view.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xmath.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xmime.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xmultiindex_iterator.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xnoalias.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xnorm.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xnpy.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xoffset_view.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xoperation.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xoptional.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xoptional_assembly.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xoptional_assembly_base.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xoptional_assembly_storage.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xpad.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xrandom.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xreducer.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xrepeat.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xscalar.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xsemantic.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xset_operation.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xshape.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xslice.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xsort.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xstorage.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xstrided_view.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xstrided_view_base.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xstrides.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xtensor.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xtensor_config.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xtensor_forward.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xtensor_simd.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xutils.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xvectorize.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xview.hpp"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/include/xtensor/xview_utils.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor" TYPE FILE FILES
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/xtensorConfig.cmake"
    "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/xtensorConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor/xtensorTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor/xtensorTargets.cmake"
         "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/CMakeFiles/Export/lib/cmake/xtensor/xtensorTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor/xtensorTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor/xtensorTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/xtensor" TYPE FILE FILES "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/CMakeFiles/Export/lib/cmake/xtensor/xtensorTargets.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/xtensor.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/xtensor.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/jawwadabd/Downloads/sem2/RandD/VeriNN/deep_refine/ex_tools/xtensor/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
