# 指定CMake最低版本 [5,7](@ref)
cmake_minimum_required(VERSION 3.22)

include(Configs/gcc-riscv-none-elf.cmake)

# Setup compiler settings
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

# Define the build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# 定义项目名称（可指定语言）[3,8](@ref)
set(CMAKE_PROJECT_NAME test_project)

set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# 核心工程设置
project(${CMAKE_PROJECT_NAME})
message("Build type: " ${CMAKE_BUILD_TYPE})

# 允许使用C, C++和ASM
enable_language(C CXX ASM)

# 工程宏定义
set(Defines_Syms
    $<$<CONFIG:Debug>:DEBUG>
)

# 创建可执行对象
add_executable(${CMAKE_PROJECT_NAME})

# 源文件
set(ASM_SOURCE_FILES
    # ${CMAKE_CURRENT_SOURCE_DIR}/test.s
)

set(APP_SOURCE_FILES 
    ${CMAKE_CURRENT_SOURCE_DIR}/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/startup.c
)

################################ Firmware ################################
set(FIRMWARE_SOURCE_FILE
)

# 包含路径
set(APP_INCLUDE_DIR
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE
    ${FIRMWARE_INCLUDE_DIR}
    ${APP_INCLUDE_DIR}
)

target_sources(${CMAKE_PROJECT_NAME} PRIVATE
    ${ASM_SOURCE_FILES}
    ${APP_SOURCE_FILES}
    ${FIRMWARE_SOURCE_FILE}
)


# 链接库目录
target_link_directories(${CMAKE_PROJECT_NAME} PRIVATE
)


target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE
    ${Defines_Syms}
)


# 构建后反汇编
add_custom_command(
  TARGET ${CMAKE_PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_OBJDUMP} -D -S $<TARGET_FILE:${CMAKE_PROJECT_NAME}> > ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.asm
  COMMENT "反汇编中..."
  VERBATIM
)

# 构建后导出符号表
add_custom_command(
  TARGET ${CMAKE_PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_NM} -n $<TARGET_FILE:${CMAKE_PROJECT_NAME}> > ${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}_symbol_table.txt
  COMMENT "导出符号表中..."
  VERBATIM
)

# 构建后输出Hex和bin
add_custom_command(
  TARGET ${CMAKE_PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${CMAKE_PROJECT_NAME}> ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.hex
  COMMENT "输出Hex文件..."
  VERBATIM
)
add_custom_command(
  TARGET ${CMAKE_PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${CMAKE_PROJECT_NAME}> ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.bin
  COMMENT "输出Bin文件..."
  VERBATIM
)

# Remove wrong libob.a library dependency when using cpp files
list(REMOVE_ITEM CMAKE_C_IMPLICIT_LINK_LIBRARIES ob)

