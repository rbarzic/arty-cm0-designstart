#include "CMSDK_CM0.h"

#define small_delay  __ISB

void medium_delay() {
    for(uint32_t i=0;i<10;i++) {
        small_delay();
    }

}

void long_delay() {
    for(uint32_t i=0;i<200000;i++) {
        medium_delay();
    }

}



int main (void)
{
    CMSDK_GPIO0->OUTENABLESET = 0x00000001;
    // while(1) {
    for(int i =0; i<5; i++) {
        CMSDK_GPIO0-> DATAOUT = 0;
        medium_delay();
        CMSDK_GPIO0-> DATAOUT = 1;
        medium_delay();
    }

}
