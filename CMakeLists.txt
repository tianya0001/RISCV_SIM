cmake_minimum_required(VERSION 3.10)
project(riscv_sim VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_subdirectory(riscv_cpu)
add_subdirectory(riscv_sim_app)


