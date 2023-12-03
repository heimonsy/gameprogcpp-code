cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD 17)

project(chapter14)

# output directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_OSX_ARCHITECTURES "arm64"
    CACHE STRING "The list of target architectures to build")

file(GLOB SRC_FILES *.cpp CMAKE_CONFIGURE_DEPENDS)

find_package(SDL2 REQUIRED COMPONENTS SDL2)
find_package(GLEW REQUIRED)
find_package(rapidjson REQUIRED)

add_executable(${PROJECT_NAME} Main.cpp ${SRC_FILES})
# target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${CMAKE_SOURCE_DIR}/../external/soil-local/build/include ${CMAKE_SOURCE_DIR}/../external/FMOD/api/core/inc ${CMAKE_SOURCE_DIR}/../external/FMOD/api/studio/inc)

# search libs
find_package(SDL2_image REQUIRED)
find_package(SDL2_ttf REQUIRED)
find_package(SDL2_mixer REQUIRED)

# include headers
target_include_directories(${PROJECT_NAME} PUBLIC ${SDL2_INCLUDE_DIRS})
target_include_directories(${PROJECT_NAME} PUBLIC ${GLEW_INCLUDE_DIRS})
target_include_directories(${PROJECT_NAME} PUBLIC ${RAPIDJSON_INCLUDE_DIRS})


# target_include_directories(${PROJECT_NAME} PUBLIC ${YAML_CPP_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} PRIVATE "-framework Cocoa" GLEW::GLEW SDL2::SDL2 SDL2_image::SDL2_image SDL2_ttf::SDL2_ttf SDL2_mixer::SDL2_mixer ${CMAKE_SOURCE_DIR}/../external/soil-local/build/lib/libSOIL.a ${CMAKE_SOURCE_DIR}/../external/FMOD/api/core/lib/libfmod.dylib ${CMAKE_SOURCE_DIR}/../external/FMOD/api/studio/lib/libfmodstudio.dylib)

# find_library(COCOA_LIBRARY Cocoa)

# target_link_libraries(${PROJECT_NAME} PRIVATE ${COCOA_LIBRARY} GLEW::GLEW SDL2::SDL2 ${CMAKE_SOURCE_DIR}/../external/soil-local/build/lib/libSOIL.a)

