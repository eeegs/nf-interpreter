#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#

########################################################################################
# make sure that a valid path is set bellow                                            #
# this is an Interop module so this file should be placed in the CMakes module folder  #
# usually CMake\Modules                                                                #
########################################################################################

# native code directory
set(BASE_PATH_FOR_THIS_MODULE ${PROJECT_SOURCE_DIR}/InteropAssemblies/CA.Library)


# set include directories
list(APPEND CA.Library_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Core)
list(APPEND CA.Library_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Include)
list(APPEND CA.Library_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/HAL/Include)
list(APPEND CA.Library_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/PAL/Include)
list(APPEND CA.Library_INCLUDE_DIRS ${BASE_PATH_FOR_THIS_MODULE})


# source files
set(CA.Library_SRCS

    CA_Library.cpp
    CA_Library_AdcMonitor.cpp
    CA_Library_DirectGPIO.cpp
)

foreach(SRC_FILE ${CA.Library_SRCS})

    set(CA.Library_SRC_FILE SRC_FILE-NOTFOUND)

    find_file(CA.Library_SRC_FILE ${SRC_FILE}
        PATHS
	        ${BASE_PATH_FOR_THIS_MODULE}
	        ${TARGET_BASE_LOCATION}
            ${PROJECT_SOURCE_DIR}/src/CA.Library

	    CMAKE_FIND_ROOT_PATH_BOTH
    )

    if (BUILD_VERBOSE)
        message("${SRC_FILE} >> ${CA.Library_SRC_FILE}")
    endif()

    list(APPEND CA.Library_SOURCES ${CA.Library_SRC_FILE})

endforeach()

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(CA.Library DEFAULT_MSG CA.Library_INCLUDE_DIRS CA.Library_SOURCES)
