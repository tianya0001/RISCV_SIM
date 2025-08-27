/**
 * @file riscv_cpu.hpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2025-08-26
 * 
 * @copyright Copyright (c) 2025
 * 
 */
#ifndef __RISCV_CPU_HPP__
#define __RISCV_CPU_HPP__

#include <string>
#include "riscv_cpu_types.hpp"

class riscv_cpu
{
private:
    const int default_RAM_size = 64 * 1024;     // 默认RAM大小
    const int default_ROM_size = 256 * 1024;    // 默认ROM大小
    int RAM_size;
    int ROM_size;
    BYTE* RAM;
    BYTE* ROM;
public:
    riscv_cpu();
    riscv_cpu(int ram_size, int rom_size);
    ~riscv_cpu();

    /**
     * @brief 加载ELF文件
     * 
     * @param file_path 文件路径
     * @return int 0 - 加载成功
     */
    int load_elf(std::string file_path);

    /**
     * @brief 加载BIN文件
     * 
     * @param file_path 
     * @return int 
     */
    int load_bin(std::string file_path);

    int get_ram_size() {return this->RAM_size;};
    int get_rom_size() {return this->ROM_size;};
};





#endif  /* __RISCV_CPU_HPP__ */


