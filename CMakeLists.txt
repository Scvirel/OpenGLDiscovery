# Minimum CMake version required
cmake_minimum_required(VERSION 3.10)

# Project name and version
project(OpenGLDiscovery VERSION 0.0.1)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Specify cmake modules
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/")

# Set temple "main" directory
set(DIRECTORY "HelloWindow")

# Set the output directory for the built executable
if(WIN32)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
endif(WIN32)

# Set necessary libs
if(WIN32)
	set(LIBS glfw3 opengl32 assimp freetype irrKlang) 
	add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif(WIN32)

# Link libs
link_directories(${CMAKE_SOURCE_DIR}/lib)

# Add source files (modify this to include all source files)
file(GLOB_RECURSE SOURCES "src/${DIRECTORY}/*.cpp" "src/${DIRECTORY}/*.h")

# Link the necessary libs
find_package(GLFW3 REQUIRED) #submodule

add_library(STB_IMAGE "src/stb_image.cpp") #static
set(LIBS ${LIBS} STB_IMAGE)

add_library(GLAD "src/glad.c") #static
set(LIBS ${LIBS} GLAD)

# Create the executable from the source files
add_executable(OpenGLDiscovery ${SOURCES})

# Link the libraries to the executable
target_link_libraries(OpenGLDiscovery ${LIBS})

# Include directories for headers
include_directories(${CMAKE_SOURCE_DIR}/includes)