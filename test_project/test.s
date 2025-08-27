
    .section  .vectors
    .align  4
    .global __gVectors
__gVectors:
    .word _sp                                     /* Top of Stack */
    .word Reset_Handler                           /* Reset Handler */
    .word NMI_Handler                             /* NMI Handler */
    .word HardFault_Handler                       /* Hard Fault Handler */
    .word MemManage_Handler                       /* MPU Fault Handler */
    .word BusFault_Handler                        /* Bus Fault Handler */
    .word UsageFault_Handler                      /* Usage Fault Handler */
    .word 0                                       /* Reserved */
    .word 0                                       /* Reserved */
    .word 0                                       /* Reserved */
    .word 0                                       /* Reserved */
    .word SVC_Handler                             /* SVCall Handler */
    .word DebugMon_Handler                        /* Debug Monitor Handler */
    .word 0                                       /* Reserved */
    .word PendSV_Handler                          /* PendSV Handler */
    .word SysTick_Handler                         /* SysTick Handler */


    .section  .text
    .align  2

    .global Reset_Handler
    .extern main
Reset_Handler:
    call main

.global NMI_Handler
.weak NMI_Handler, Default_Handler

.global HardFault_Handler
.weak HardFault_Handler, Default_Handler

.global MemManage_Handler
.weak MemManage_Handler, Default_Handler

.global BusFault_Handler
.weak BusFault_Handler, Default_Handler

.global UsageFault_Handler
.weak UsageFault_Handler, Default_Handler

.global SVC_Handler
.weak SVC_Handler, Default_Handler

.global DebugMon_Handler
.weak DebugMon_Handler, Default_Handler

.global PendSV_Handler
.weak PendSV_Handler, Default_Handler

.global SysTick_Handler
.weak SysTick_Handler, Default_Handler

Default_Handler:
    j   Default_Handler






