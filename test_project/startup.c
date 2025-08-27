#include <stdint.h>

typedef void (*isr_func)(void);

#define __VECTORS_SECTION   __attribute__((section(".vectors")))
#define __NO_RETURN         __attribute__((noreturn))

extern uint32_t _sp;
extern int main();

__NO_RETURN void Reset_Handler();

__VECTORS_SECTION isr_func __gVectors[256] = 
{
    (isr_func)(&_sp),
    Reset_Handler
};




__NO_RETURN void Reset_Handler()
{
    main();

    while (1)
    {
        
    }
}




