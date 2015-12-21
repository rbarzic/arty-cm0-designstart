#include <stdlib.h>
#include "CMSDK_CM0.h"

#define PIN_LED (0)
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
    CMSDK_GPIO0->OUTENABLESET = 1<<PIN_LED;
    while(1) {
        // for(int i =0; i<5; i++) {
        CMSDK_GPIO0-> DATAOUT = 0<<PIN_LED;
        long_delay();
        CMSDK_GPIO0-> DATAOUT = 1<<PIN_LED;
        long_delay();
    }
    return 0;
    // exit(0);
}
