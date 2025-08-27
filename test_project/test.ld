OUTPUT_ARCH( "riscv" )

MEMORY
{
    ROM   (rx)  : ORIGIN = 0x08000000, LENGTH = 256K
    RAM   (xrw) : ORIGIN = 0x20000000, LENGTH = 64K
}

ENTRY(Reset_Handler)

SECTIONS
{
    __stack_size = 2K;
    __heap_size =  1K;

    /* 异常向量表 */
    .vectors :
    {
        . = ALIGN(4);
        __gVectors = .;
        KEEP(*(.vectors))
        . = ALIGN(4);
        __Vectors_End = .;
        __Vectors_Size = __Vectors_End - __gVectors;
    } >ROM

    /* 程序 */
    .text :
    {
        . = ALIGN(4);
        *(.text)
        *(.text*)
        *(.glue_7)
        *(.glue_7t)
        *(.eh_frame)
        KEEP (*(.init))
        KEEP (*(.fini))
        . = ALIGN(4);
        /* the symbol '_etext' will be defined at the end of code section */
        _etext = .;
    } >ROM

    /* 只读数据 */
    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    } >ROM

    /* 初始化数据 */
    _sidata = LOADADDR(.data);
    .data :
    {
        . = ALIGN(4);
        /* the symbol '_sdata' will be defined at the data section end start */
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        /* the symbol '_edata' will be defined at the data section end */
        _edata = .;
    } > RAM AT> ROM

    /* provide some necessary symbols for uninitialized data */
    . = ALIGN(4);
    .bss :
    {
        . = ALIGN(4);
        /* the symbol '_sbss' will be defined at the bss section start */
        _sbss = .;
        __bss_start = _sbss;
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        /* the symbol '_ebss' will be defined at the bss section end */
        _ebss = .;
        __bss_end = _ebss;
    } > RAM

    /* heap and stack space */
    .heap_stack :
    {
        . = ALIGN(8);
        PROVIDE ( end = _ebss );
        PROVIDE ( _end = _ebss );
        . = . + __heap_size;
        PROVIDE( _heap_end = . );
        . = . + __stack_size;
        PROVIDE( _sp = . ); 
        . = ALIGN(8);
    } > RAM
}

/* input sections */
GROUP(libgcc.a libc.a libm.a libnosys.a)


