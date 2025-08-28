cmake_minimum_required(VERSION 3.10)

project(riscv_sim_app VERSION 0.1 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 20)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_VERBOSE_MAKEFILE ON)  # 对所有构建生效

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message(STATUS "目标系统: Windows")
    set(SDL3_x86_64_INCLUDE_DIR
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/SDL3-3.2.20/x86_64-w64-mingw32/include
    )

    set(SDL3_x86_64_LIBRARY_DIR
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/SDL3-3.2.20/x86_64-w64-mingw32/lib
    )
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message(STATUS "目标系统: Linux")
    set(SDL3_x86_64_INCLUDE_DIR
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/SDL-release-3.2.20/include
    )

    set(SDL3_x86_64_LIBRARY_DIR
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/SDL-release-3.2.20/build
    )

elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    message(STATUS "目标系统: macOS/iOS")
else()
    message(STATUS "目标系统: ${CMAKE_SYSTEM_NAME}（未知）")
endif()

set(PROJECT_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/App/main.cpp
)

set(INCLUDE_DIR 
    ${CMAKE_CURRENT_SOURCE_DIR}/App
)

add_executable(${PROJECT_NAME} 
    ${PROJECT_SOURCES}
)

target_include_directories(${PROJECT_NAME} PUBLIC 
    ${INCLUDE_DIR}
    ${SDL3_x86_64_INCLUDE_DIR} 
)

target_link_directories( ${PROJECT_NAME} PRIVATE
    ${SDL3_x86_64_LIBRARY_DIR}
)

target_link_libraries(${PROJECT_NAME}
    SDL3
)

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
            ${SDL3_x86_64_LIBRARY_DIR}/../bin/SDL3.dll
            $<TARGET_FILE_DIR:${PROJECT_NAME}>
    )
endif()