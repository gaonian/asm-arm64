//
//  testSwitch.c
//  testArm64
//
//  Created by gaoyu on 2024/6/6.
//

/*
 void testSwitch(int a) {
     switch (a) {
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
    b.eq LBB1_1

    ldr w8, [x29, #-4]
    cmp w8, #2
    b.eq LBB1_2

    ldr w8, [x29, #-4]
    cmp w8, #3
    b.eq LBB1_3

    b LBB1_other

LBB1_1:
    adrp x0, _int_1@PAGE
    add x0, x0, _int_1@PAGEOFF
    bl _printf
    b LBB1_end

LBB1_2:
    adrp x0, _int_2@PAGE
    add x0, x0, _int_2@PAGEOFF
    bl _printf
    b LBB1_end

LBB1_3:
    adrp x0, _int_3@PAGE
    add x0, x0, _int_3@PAGEOFF
    bl _printf
    b LBB1_end

LBB1_other:
    adrp x0, _str_other@PAGE
    add x0, x0, _str_other@PAGEOFF
    bl _printf
    b LBB1_end

LBB1_end:
    ldp x29, x30, [sp, #16]
    add sp, sp, #32
    ret



/*
 void testSwitch(int a) {
     switch (a) {
         case 1:
             printf("1");
             break;
         case 2:
             printf("2");
             break;
         case 3:
             printf("3");
             break;
         case 6:
             printf("6");
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

    mov w8, w0
    str w8, [x29, #-4]
    ldr w8, [x29, #-4]

    subs x8, x8, #1                     ; x8 = 当前值与最小值case的差值
    str x8, [x29, #-8]
    
    cmp x8, #5                          ; x8 与 最大值-最小值的差值 比较
    b.hi LBB2_other

	ldr	x9, [x29, #-8]                  ; x9 = 跳转表内偏移量 = 当前值与最小case的差值
	adrp x10, lJTI2_0@PAGE
	add	x10, x10, lJTI2_0@PAGEOFF       ; x10 = lJTI2_0跳转表基地址

Ltmp0:
    adr x8, Ltmp0                       ; x8 = Ltmp0当前地址
    ldrsw x11, [x10, x9, lsl #2]        ; x11 = lJTI2_0跳转表基地址(x10) + 跳转表内偏移量(x9) << 2。跳转表4字节对齐，所以左移两位
    add x8, x8, x11                     ; x11 = 条件case与Ltmp0的偏移地址。x8 = x8 + x11 = 实际要跳转的地址
    br x8                               ; 跳转到指定case

LBB2_1:
    adrp x0, _int_1@PAGE
    add x0, x0, _int_1@PAGEOFF
    bl _printf
    b LBB2_end

LBB2_2:
    adrp x0, _int_2@PAGE
    add x0, x0, _int_2@PAGEOFF
    bl _printf
    b LBB2_end

LBB2_3:
    adrp x0, _int_3@PAGE
    add x0, x0, _int_3@PAGEOFF
    bl _printf
    b LBB2_end

LBB2_4:
    adrp x0, _int_6@PAGE
    add x0, x0, _int_6@PAGEOFF
    bl _printf
    b LBB2_end

LBB2_other:
    adrp x0, _str_other@PAGE
    add x0, x0, _str_other@PAGEOFF
    bl _printf
    b LBB2_end

LBB2_end:
    ldp x29, x30, [sp, #16]
    add sp, sp, #32
    ret

    .p2align 2
lJTI2_0:
    .long LBB2_1-Ltmp0
    .long LBB2_2-Ltmp0
    .long LBB2_3-Ltmp0
    .long LBB2_other-Ltmp0
    .long LBB2_other-Ltmp0
    .long LBB2_4-Ltmp0



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
