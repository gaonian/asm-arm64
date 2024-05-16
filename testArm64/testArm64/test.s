//
//  test.s
//  testArm64
//
//  Created by gaoyu on 2024/5/11.
//

.global _haha, _fibonacci, _fibonacci_1

_haha:
    sub sp, sp, #0x20
    stp x29, x30, [sp, #0x10]
    add x29, sp, #0x10

    str w0, [x29, #-0x4]
    str w1, [x29, #-0x8]
    ldr w0, [x29, #-0x4]
    ldr w1, [x29, #-0x8]

    bl _hehe

    ldr w8, [x29, #-0x4]
    ldr x9, [x29, #-0x8]
    add w8, w8, w9
    add w0, w0, w8

    ldp x29, x30, [sp, #0x10]
    add sp, sp, 0x20
    ret


_hehe:
    add x0, x0, x1
    add x0, x0, #1
    ret




_fibonacci:
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
    bl _fibonacci
    str w0, [x29, #-0x8]

    mov w0, w9
    bl _fibonacci
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


_fibonacci_1:
    sub sp, sp, #0x20
    stp x29, x30, [sp, #0x10]
    add x29, sp, #0x10

    str w0, [x29, #-0x4]

    cmp w0, #0x1
    b.le _fibonacci_1_end

    sub w0, w0, #0x1
    bl _fibonacci_1
    str w0, [x29, #-0x8]

    ldr w0, [x29, #-0x4]
    sub w0, w0, #0x2
    bl _fibonacci_1

    ldr w8, [x29, #-0x8]
    add w0, w0, w8 
    str w0, [x29, #-0x4]

_fibonacci_1_end:
    ldr x0, [x29, #-0x4]
    ldp x29, x30, [sp, #0x10]
    add sp, sp, #0x20
    ret

    