#!/bin/bash -e

rm -rf id
conan install conanfile.txt -b missing -pr:b default -of id/cmake -s build_type=Debug
conan install conanfile.txt -b missing -pr:b default -of id/cmake -s build_type=Release
