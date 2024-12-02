cmake_minimum_required(VERSION 3.25)
project(test_relocated_openusd_install)

list(APPEND CMAKE_PREFIX_PATH ${CMAKE_SOURCE_DIR}/relocated_openusd_install)

find_package(OpenGL REQUIRED)
find_package(pxr REQUIRED CONFIG)

set(CMAKE_CXX_STANDARD 20)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE ${PXR_LIBRARIES})
