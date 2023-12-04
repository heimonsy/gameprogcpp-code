#!/bin/bash
clear;

# check build dir
if [ ! -d build ] 
then 
    mkdir build 
# else 
    # rm -rf build/*
fi

# export LIBRARY_PATH=/opt/homebrew/lib

# generate cmake files
cmake -O . -B ./build -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=ON

cd build && cmake --build . 


cd -

cp -rf Assets ./build/bin/
cp -rf Shaders ./build/bin/