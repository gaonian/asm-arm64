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
    sub sp, sp, #0x30
    stp x29, x30, [sp, #32]
    stp w8, w9, [sp, #24]
    add x29, sp, #24

    str w0, [x29, #-0x4]
    cmp w0, #0x1
    b.le _fibonacci_end

    sub w8, w0, #1
    sub w9, w0, #2

    mov w0, w8
    bl _fibonacci_asm
    str w0, [x29, #-0x8]

    mov w0, w9
    bl _fibonacci_asm
    str w0, [x29, #-0xC]

    ldr w8, [x29, #-0x8]
    ldr w9, [x29, #-0xC]
    add w0, w8, w9
    str w0, [x29, #-0x4]

    b _fibonacci_end

_fibonacci_end:
    ldr w0, [x29, #-0x4]
    ldp w8, w9, [sp, #24]
    ldp x29, x30, [sp, #32]
    add sp, sp, #0x30
    ret


    .global _fibonacci_asm_1
_fibonacci_asm_1:
    sub sp, sp, #0x20
    stp x29, x30, [sp, #0x10]
    add x29, sp, #0x10

    str w0, [x29, #-0x4]

    cmp w0, #0x1
    b.le _fibonacci_1_end

    sub w0, w0, #0x1
    bl _fibonacci_asm_1
    str w0, [x29, #-0x8]

    ldr w0, [x29, #-0x4]
    sub w0, w0, #0x2
    bl _fibonacci_asm_1

    ldr w8, [x29, #-0x8]
    add w0, w0, w8 
    str w0, [x29, #-0x4]

_fibonacci_1_end:
    ldr w0, [x29, #-0x4]
    ldp x29, x30, [sp, #0x10]
    add sp, sp, #0x20
    ret
