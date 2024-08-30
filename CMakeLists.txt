# set target && use zig to compile set(ZIG_TARGET "x86_64-linux-gnu")
# include(${CMAKE_CURRENT_LIST_DIR}/cmake/zig-toolchain.cmake)

# CMake minimum version required
cmake_minimum_required(VERSION 3.15)

# Project name and version
project(OpenCVApp VERSION 1.0)

# Specify C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# export comamnd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Find OpenCV package
find_package(OpenCV REQUIRED)

# Cpp Sources
set(SOURCE_FILES src/main.cpp
                 # Add other source files here
)

# Add an executable target
add_executable(OpenCVApp ${SOURCE_FILES})

# Link the OpenCV libraries to the executable
target_link_libraries(OpenCVApp ${OpenCV_LIBS})

# Include the OpenCV headers
include_directories(${OpenCV_INCLUDE_DIRS})

# Optional: print OpenCV version for verification
message(STATUS "OpenCV version: ${OpenCV_VERSION}")
