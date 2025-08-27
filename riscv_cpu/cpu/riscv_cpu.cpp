/**
 * @file riscv_cpu.cpp
 * @author 
 * @brief 
 * @version 0.1
 * @date 2025-08-26
 * 
 * @copyright Copyright (c) 2025
 * 
 */
#include "riscv_cpu.hpp"
#include <iostream>
#include <fstream>

riscv_cpu::riscv_cpu()
{
    this->RAM = new BYTE[this->default_RAM_size];
    this->ROM = new BYTE[this->default_ROM_size];
    this->ROM_size = this->default_ROM_size;
    this->RAM_size = this->default_RAM_size;
}


riscv_cpu::riscv_cpu(int ram_size, int rom_size)
{
    if (this->ROM != nullptr)
    {
        delete this->ROM;
    }

    if(this->RAM != nullptr)
    {
        delete this->RAM;
    }
    
    this->RAM = new BYTE[this->default_RAM_size];
    this->ROM = new BYTE[this->default_ROM_size];

    this->ROM_size = rom_size;
    this->RAM_size = ram_size;
}

riscv_cpu::~riscv_cpu()
{
    delete this->RAM;
    delete this->ROM;
}

int riscv_cpu::load_elf(std::string file_path)
{
    return 0;
}

int riscv_cpu::load_bin(std::string file_path)
{
    return 0;
}