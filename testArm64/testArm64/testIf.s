//
//  testIf.c
//  testArm64
//
//  Created by gaoyu on 2024/6/7.
//


/*
void testIf_asm(int a) {
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
    .global _testIf_asm
_testIf_asm:
    sub sp, sp, #32
    stp x29, x30, [sp, #16]
    add x29, sp, #16

    mov w8, w0
    str w8, [x29, #-4]

    ldr w8, [x29, #-4]
    cmp w8, #90
    b.ge LBB0_1

    ldr w8, [x29, #-4]
    cmp w8, #60
    b.ge LBB0_2

    b LBB0_4

LBB0_1:
    adrp x0, _testif_asm_str1@PAGE
    add x0, x0, _testif_asm_str1@PAGEOFF
    bl _printf                                  ; printf("优秀");
    b LBB0_5
LBB0_2:
    ldr w8, [x29, #-4]
    cmp w8, #90
    b.lt LBB0_3
    b LBB0_5
LBB0_3:
    adrp x0, _testif_asm_str2@PAGE
    add x0, x0, _testif_asm_str2@PAGEOFF
    bl _printf                                  ; printf("及格");
    b LBB0_5
LBB0_4:
    adrp x0, _testif_asm_str3@PAGE
    add x0, x0, _testif_asm_str3@PAGEOFF
    bl _printf                                  ; printf("差");
    b LBB0_5
LBB0_5:
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
