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

add_library(${PROJECT_NAME} SHARED  ${SOURCE_FILE})
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDE_DIR})




