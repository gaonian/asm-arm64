//
//  test.s
//  testArm64
//
//  Created by gaoyu on 2024/5/11.
//

.global _haha

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


/*
void testif1(void) {
    int score = 90;
    if (score >= 90) {
        printf("优秀");
    } else if (score >= 60 && score < 90) {
        printf("及格");
    } else {
        printf("差");
    }
    printf("end");
}
*/    
    .global _testif_asm
_testif_asm:
    sub sp, sp, #32
    stp x29, x30, [sp, #16]
    add x29, sp, #16

    mov w8, #70
    str w8, [x29, #-4]

    ldr w8, [x29, #-4]
    cmp w8, #90
    b.ge _testif_asm_1

    ldr w8, [x29, #-4]
    cmp w8, #60
    b.ge _testif_asm_2

    b _testif_asm_4

_testif_asm_1:
    adrp x0, _testif_asm_str1@PAGE
    add x0, x0, _testif_asm_str1@PAGEOFF
    bl _printf                                  ; printf("优秀");
    b _testif_asm_end

_testif_asm_2:
    ldr w8, [x29, #-4]
    cmp w8, #90
    b.lt _testif_asm_3
    b _testif_asm_4

_testif_asm_3:
    adrp x0, _testif_asm_str2@PAGE
    add x0, x0, _testif_asm_str2@PAGEOFF
    bl _printf                                  ; printf("及格");
    b _testif_asm_end

_testif_asm_4:
    adrp x0, _testif_asm_str3@PAGE
    add x0, x0, _testif_asm_str3@PAGEOFF
    bl _printf                                  ; printf("差");
    b _testif_asm_end

_testif_asm_end:
    adrp x0, _testif_asm_str4@PAGE
    add x0, x0, _testif_asm_str4@PAGEOFF
    bl _printf                                  ; printf("end");
    ldp x29, x30, [sp, #16]
    add sp, sp, #32
    ret


    .data
_testif_asm_str1:
    .string "优秀\n"
_testif_asm_str2:
    .string "及格\n"
_testif_asm_str3:
    .string "差\n"
_testif_asm_str4:
    .string "end\n"
