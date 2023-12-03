#!/bin/bash
clear;

# check build dir
if [ ! -d build ] 
then 
    mkdir build 
else 
    rm -rf build/*
fi

export LIBRARY_PATH=/opt/homebrew/lib

# generate cmake files
cmake --debug-output -O . -B ./build -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=ON

cd build && cmake --build . -v
