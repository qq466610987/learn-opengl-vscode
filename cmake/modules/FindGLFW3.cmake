set(_glfw3_HEADER_SEARCH_DIRS
  "/usr/include"
  "/usr/local/include"
  "${CMAKE_SOURCE_DIR}/includes"
  "C:/Program Files (x86)/glfw/include"
  "C:/Program Files (x86)/GLFW/include") # 注意这里，就是我们安装的目录
set(_glfw3_LIB_SEARCH_DIRS
  "/usr/lib"
  "/usr/local/lib"
  "${CMAKE_SOURCE_DIR}/lib"
  "C:/Program Files (x86)/glfw/lib-msvc110"
  "C:/Program Files (x86)/GLFW/lib") # 注意这里
set(_glfw3_ENV_ROOT $ENV{GLFW3_ROOT})
if(NOT GLFW3_ROOT AND _glfw3_ENV_ROOT)
  set(GLFW3_ROOT ${_glfw3_ENV_ROOT})
endif()

# Put user specified location at beginning of search
if(GLFW3_ROOT)
  list(INSERT _glfw3_HEADER_SEARCH_DIRS 0 "${GLFW3_ROOT}/include")
  list(INSERT _glfw3_LIB_SEARCH_DIRS 0 "${GLFW3_ROOT}/lib")
endif()

# Search for the header
FIND_PATH(GLFW3_INCLUDE_DIR "GLFW/glfw3.h" # 头文件目录的变量
  PATHS ${_glfw3_HEADER_SEARCH_DIRS})

# Search for the library
FIND_LIBRARY(GLFW3_LIBRARY NAMES glfw3 glfw glfw3dll
  PATHS ${_glfw3_LIB_SEARCH_DIRS})
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GLFW3 DEFAULT_MSG
  GLFW3_LIBRARY GLFW3_INCLUDE_DIR) # 注意这里
IF(GLFW3_FOUND)
  IF(NOT GLFW3_FIND_QUIETLY)
    MESSAGE(STATUS "Found ASSIMP: ${GLFW3_LIBRARY}")
  ENDIF(NOT GLFW3_FIND_QUIETLY)
ELSE(GLFW3_FOUND)
  IF(GLFW3_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find GLFW3")
  ENDIF(GLFW3_FIND_REQUIRED)
ENDIF(GLFW3_FOUND)
