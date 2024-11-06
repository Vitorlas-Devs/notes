cmake_minimum_required(VERSION 3.28)  # Need recent CMake for modules
project(ModuleTest CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  # For clangd

# If using Clang, we need these flags for modules
if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(-fmodules -fbuiltin-module-map)
endif()

# Create the module library
add_library(math_module)
target_sources(math_module
    PUBLIC
        FILE_SET CXX_MODULES FILES
        src/math.cppm
)

# Create the executable
add_executable(main src/main.cpp)
target_link_libraries(main PRIVATE math_module)
