cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD 17)

project(chapter02)

# output directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_OSX_ARCHITECTURES "arm64"
    CACHE STRING "The list of target architectures to build")

file(GLOB SRC_FILES *.cpp CMAKE_CONFIGURE_DEPENDS)

add_executable(${PROJECT_NAME} Main.cpp ${SRC_FILES})

# include(FindPkgConfig)

# find_package(SDL2 REQUIRED COMPONENTS SDL2)
find_package(SDL2 REQUIRED COMPONENTS SDL2)
find_package(SDL2_image REQUIRED)

# pkg_search_module(SDL2 REQUIRED SDL2)
# PKG_SEARCH_MODULE(SDL2_image REQUIRED SDL2_image)

# search libs
# find_package(GLEW REQUIRED) # necessary for loading OpenGL libraries

# include headers
# target_include_directories(${PROJECT_NAME} PUBLIC ${SDL2_INCLUDE_DIRS} ${SDL2_IMAGE_INCLUDE_DIRS})

# target_include_directories(${PROJECT_NAME} PUBLIC ${YAML_CPP_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} PRIVATE SDL2::SDL2 SDL2_image::SDL2_image)
