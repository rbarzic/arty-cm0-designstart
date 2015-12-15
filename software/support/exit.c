void exit(int status) __attribute__ ((section (".tbench")));

void exit(int status) {
    // asm volatile ("mov r0 ");
//    asm volatile ("mov r0,%0 "
//                  : /* no output register */
//                  : "r(status)"
//        );

    // asm("mov %[result], %[value], ror #1" : [result] "=r" (y) : [value] "r" (x));
    __asm ("mov r0, %0" : : "r" (status));
    __asm ("mov r0, %0" : : "r" (status));
    __asm ("mov r0, %0" : : "r" (status));
    __asm ("mov r0, %0" : : "r" (status));
    __asm ("mov r0, %0" : : "r" (status));
    while(1);
}
