cmake_minimum_required(VERSION 3.10)

project(riscv_sim_app VERSION 0.1 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 20)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(SDL3_x86_64_INCLUDE_DIR
    E:/Project/RISCV/RISCV_SIM/libs/SDL3-3.2.20/x86_64-w64-mingw32/include
)

set(SDL3_x86_64_LIBRARY_DIR
    E:/Project/RISCV/RISCV_SIM/libs/SDL3-3.2.20/x86_64-w64-mingw32/lib
)

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

target_link_libraries(${PROJECT_NAME} PRIVATE
    ${SDL3_x86_64_LIBRARY_DIR}/libSDL3.dll.a
    ${SDL3_x86_64_LIBRARY_DIR}/libSDL3_test.a
)
