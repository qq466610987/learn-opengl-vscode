# 你好，窗口
add_executable(HelloWindow HelloWindow.cpp) # 添加可执行程序
target_link_libraries(HelloWindow ${GLFW3_LIBRARY} glad) # 链接lib glfw glad.c

# 你好，三角形
add_executable(HelloTriangle HelloTriangle.cpp)
target_link_libraries(HelloTriangle ${GLFW3_LIBRARY} glad)
