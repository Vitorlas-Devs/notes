cmake_minimum_required(VERSION 3.25)
project(my_project CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  # For clangd

# If using clang
set(CMAKE_CXX_COMPILER "clang++")

# Add source files
add_executable(${PROJECT_NAME}
    src/main.cpp
    src/mymodule.cpp
)

# Add include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
