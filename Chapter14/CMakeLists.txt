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

add_executable(${PROJECT_NAME} Main.cpp ${SRC_FILES})

# include headers
target_include_directories(${PROJECT_NAME} PUBLIC ${SDL2_INCLUDE_DIRS})
target_include_directories(${PROJECT_NAME} PUBLIC ${GLEW_INCLUDE_DIRS})


if (LINUX)
    include_directories(${CMAKE_SOURCE_DIR}/../External/rapidjson/include ${CMAKE_SOURCE_DIR}/../External/soil-local/build-linux-amd64/include ${CMAKE_SOURCE_DIR}/../External/FMOD-linux/api/core/inc ${CMAKE_SOURCE_DIR}/../External/FMOD-linux/api/studio/inc)

    INCLUDE(FindPkgConfig)
    PKG_SEARCH_MODULE(SDL2IMAGE REQUIRED SDL2_image>=2.0.0)
    PKG_SEARCH_MODULE(SDL2TTF REQUIRED SDL2_ttf>=2.0.0)
    PKG_SEARCH_MODULE(SDL2MIXER REQUIRED SDL2_ttf>=2.0.0)

    target_link_libraries(${PROJECT_NAME} PRIVATE -lGL -lX11 GLEW::GLEW SDL2::SDL2 ${SDL2IMAGE_LIBRARIES} ${SDL2TTF_LIBRARIES} ${SDL2MIXER_LIBRARIES} ${CMAKE_SOURCE_DIR}/../External/soil-local/build-linux-amd64/lib/libSOIL.a ${CMAKE_SOURCE_DIR}/../External/FMOD-linux/api/core/lib/${CMAKE_SYSTEM_PROCESSOR}/libfmod.so ${CMAKE_SOURCE_DIR}/../External/FMOD-linux/api/studio/lib/${CMAKE_SYSTEM_PROCESSOR}/libfmodstudio.so)
endif()

if (APPLE)
    include_directories(${CMAKE_SOURCE_DIR}/../External/soil-local/build-darwin-arm64/include ${CMAKE_SOURCE_DIR}/../External/FMOD/api/core/inc ${CMAKE_SOURCE_DIR}/../External/FMOD/api/studio/inc)

    find_package(SDL2_image REQUIRED)
    find_package(SDL2_ttf REQUIRED)
    find_package(SDL2_mixer REQUIRED)

    target_link_libraries(${PROJECT_NAME} PRIVATE "-framework Cocoa" GLEW::GLEW SDL2::SDL2 SDL2_image::SDL2_image SDL2_ttf::SDL2_ttf SDL2_mixer::SDL2_mixer ${CMAKE_SOURCE_DIR}/../External/soil-local/build-darwin-arm64/lib/libSOIL.a ${CMAKE_SOURCE_DIR}/../External/FMOD/api/core/lib/libfmod.dylib ${CMAKE_SOURCE_DIR}/../External/FMOD/api/studio/lib/libfmodstudio.dylib)
endif()
