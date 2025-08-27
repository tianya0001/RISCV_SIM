cmake_minimum_required(VERSION 3.10)
project(riscv_cpu VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(INCLUDE_DIR 
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/cpu
    )

set(SOURCE_FILE 
        ${CMAKE_CURRENT_SOURCE_DIR}/cpu/riscv_cpu.cpp
    )

# 最推荐的方式：通过指针大小判断
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    message(STATUS "目标架构为 64 位 (x64)")
    set(ARCHITECTURE "x64")
    add_compile_definitions(IS_64_BIT) # 可选：向代码传递宏定义
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    message(STATUS "目标架构为 32 位 (x86)")
    set(ARCHITECTURE "x86")
    add_compile_definitions(IS_32_BIT)
else()
    message(FATAL_ERROR "不支持的架构：指针大小为 ${CMAKE_SIZEOF_VOID_P}")
endif()

add_library(${PROJECT_NAME} SHARED  ${SOURCE_FILE})
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDE_DIR})




