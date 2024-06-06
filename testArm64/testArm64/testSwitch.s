//
//  testSwitch.c
//  testArm64
//
//  Created by gaoyu on 2024/6/6.
//

/*
 void testSwitch(void) {
     int score = 10;
     switch (score) {
         case 1:
             printf("1");
             break;
         case 2:
             printf("2");
             break;
         case 3:
             printf("3");
             break;
             
         default:
             printf("other");
             break;
     }
 }
 */
    .global _testSwitch_asm_1
    .p2align 2
_testSwitch_asm_1:
    sub sp, sp, #32
    stp x29, x30, [sp, #16]
    add x29, sp, #16

    mov w8, #10
    str w8, [x29, #-4]
    ldr w8, [x29, #-4]

    cmp w8, #1
    b.eq _testSwitch_asm_1_1

    ldr w8, [x29, #-4]
    cmp w8, #2
    b.eq _testSwitch_asm_1_2

    ldr w8, [x29, #-4]
    cmp w8, #3
    b.eq _testSwitch_asm_1_3

    b _testSwitch_asm_1_other

_testSwitch_asm_1_1:
    adrp x0, _int_1@PAGE
    add x0, x0, _int_1@PAGEOFF
    bl _printf
    b _testSwitch_asm_1_end

_testSwitch_asm_1_2:
    adrp x0, _int_2@PAGE
    add x0, x0, _int_2@PAGEOFF
    bl _printf
    b _testSwitch_asm_1_end

_testSwitch_asm_1_3:
    adrp x0, _int_3@PAGE
    add x0, x0, _int_3@PAGEOFF
    bl _printf
    b _testSwitch_asm_1_end

_testSwitch_asm_1_other:
    adrp x0, _str_other@PAGE
    add x0, x0, _str_other@PAGEOFF
    bl _printf
    b _testSwitch_asm_1_end

_testSwitch_asm_1_end:
    ldp x29, x30, [sp, #16]
    add sp, sp, #32
    ret



/*
 void testSwitch(void) {
     int score = 10;
     switch (score) {
         case 1:
             printf("1");
             break;
         case 2:
             printf("2");
             break;
         case 3:
             printf("3");
             break;
         case 4:
             printf("4");
             break;
             
         default:
             printf("other");
             break;
     }
 }
 */
    .global _testSwitch_asm_2
    .p2align 2
_testSwitch_asm_2:
    sub sp, sp, #32
    stp x29, x30, [sp, #16]
    add x29, sp, #16



_testSwitch_asm_2_end:
        ldp x29, x30, [sp, #16]
add sp, sp, #32
    ret



    .data
_int_1:
    .string "1\n"
_int_2:
    .string "2\n"
_int_3:
    .string "3\n"
_int_4:
    .string "4\n"
_int_5:
    .string "5\n"
_int_6:
    .string "6\n"
_int_7:
    .string "7\n"
_int_8:
    .string "8\n"
_int_9:
    .string "9\n"
_int_10:
    .string "10\n"
_int_11:
    .string "11\n"
_int_12:
    .string "12\n"
_str_other:
    .string "other\n"
