cmake_minimum_required(VERSION 2.9) # 指定cmake最小版本
project(learnopengl) # 设置项目名
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/")
find_package(GLFW3 REQUIRED)
include_directories(${GLFW3_INCLUDE_DIR})
add_library(glad include/glad.c)
# ------------------------------------------------------------------------------

include_directories(./include) # 添加头文件搜索目录
add_subdirectory(src/start) # 子目录也会有CMakeLists.txt文件，环境是相通的
