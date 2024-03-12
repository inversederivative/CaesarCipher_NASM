cmake_minimum_required(VERSION 3.27)

project(CaesarCipher_NASM CXX ASM)

include_directories(include)
add_subdirectory(source)
add_subdirectory(tests)


#
##
#
########
#
##
#

###################
#					#
#    Google Test	#
#                   #
#	  Framework		#
#                   #
###################



include(FetchContent)
FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG v1.14.0 # most recent version 03/2024 Check GITHUB!
)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)
