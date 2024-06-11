//
//  testFunction.c
//  testArm64
//
//  Created by gaoyu on 2024/6/7.
//

/*
/// 叶子函数
int testLeafFunc(int a, int b) {
    return a + b + 1;
}

/// 非叶子函数
int testNoLeafFunc(int a, int b) {
    int c = testLeafFunc(a, b);
    return a + b + c;
}
*/

    .global _testLeafFunc
_testLeafFunc:
    add w0, w0, w1
    add w0, w0, #1
    ret


    .global _testNoLeafFunc
_testNoLeafFunc:
    sub sp, sp, #32
    stp x29, x30, [sp, #16]
    add x29, sp, #16

    str w0, [x29, #-4]
    str w1, [x29, #-8]
    ldr w0, [x29, #-4]
    ldr w1, [x29, #-8]

    bl _testLeafFunc

    ldr w8, [x29, #-4]
    ldr x9, [x29, #-8]
    add w8, w8, w9
    add w0, w0, w8

    ldp x29, x30, [sp, #16]
    add sp, sp, #32
    ret
