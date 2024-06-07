//
//  testFibonacci.c
//  testArm64
//
//  Created by gaoyu on 2024/6/6.
//

/*
int fibonacci1(int n) {
    if (n <= 1){
        return n;
    } else {
        return fibonacci1(n-1) + fibonacci1(n-2);
    }
}
*/

    .global _fibonacci_asm
_fibonacci_asm:
    sub sp, sp, #48
    stp x29, x30, [sp, #32]
    stp w8, w9, [sp, #24]
    add x29, sp, #24

    str w0, [x29, #-4]
    cmp w0, #1
    b.le LBB0_1

    sub w8, w0, #1
    sub w9, w0, #2

    mov w0, w8
    bl _fibonacci_asm
    str w0, [x29, #-8]

    mov w0, w9
    bl _fibonacci_asm
    str w0, [x29, #-12]

    ldr w8, [x29, #-8]
    ldr w9, [x29, #-12]
    add w0, w8, w9
    str w0, [x29, #-4]
    b LBB0_1
LBB0_1:
    ldr w0, [x29, #-4]
    ldp w8, w9, [sp, #24]
    ldp x29, x30, [sp, #32]
    add sp, sp, #48
    ret


    .global _fibonacci_asm_1
_fibonacci_asm_1:
    sub sp, sp, #32
    stp x29, x30, [sp, #16]
    add x29, sp, #16

    str w0, [x29, #-4]

    cmp w0, #1
    b.le LBB1_1

    sub w0, w0, #1
    bl _fibonacci_asm_1
    str w0, [x29, #-8]

    ldr w0, [x29, #-4]
    sub w0, w0, #2
    bl _fibonacci_asm_1

    ldr w8, [x29, #-8]
    add w0, w0, w8 
    str w0, [x29, #-4]

LBB1_1:
    ldr w0, [x29, #-4]
    ldp x29, x30, [sp, #16]
    add sp, sp, #32
    ret
