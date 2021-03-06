#include <stdlib.h>
#include "CMSDK_CM0.h"

#define small_delay  __ISB

void medium_delay() {
    for(uint32_t i=0;i<10;i++) {
        small_delay();
    }

}

void long_delay() {
    for(uint32_t i=0;i<50000;i++) {
        medium_delay();
    }

}



int main (void)
{
    CMSDK_GPIO0->OUTENABLESET = 0x00000001;

    for(int i =0; i<5; i++) {
        CMSDK_GPIO0-> DATAOUT = 0;
        small_delay();
        CMSDK_GPIO0-> DATAOUT = 1;
        small_delay();
    }
    return 0;

}
