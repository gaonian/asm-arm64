	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 4
	.globl	_hehe1                          ; -- Begin function hehe1
	.p2align	2
_hehe1:                                 ; @hehe1
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, #12]
	str	w1, [sp, #8]
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #8]
	add	w8, w8, w9
	add	w0, w8, #1
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_haha1                          ; -- Begin function haha1
	.p2align	2
_haha1:                                 ; @haha1
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	str	w1, [sp, #8]
	ldur	w0, [x29, #-4]
	ldr	w1, [sp, #8]
	bl	_hehe1
	str	w0, [sp, #4]
	ldur	w8, [x29, #-4]
	ldr	w9, [sp, #8]
	add	w8, w8, w9
	ldr	w9, [sp, #4]
	add	w0, w8, w9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_fibonacci1                     ; -- Begin function fibonacci1
	.p2align	2
_fibonacci1:                            ; @fibonacci1
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	w0, [sp, #8]
	ldr	w8, [sp, #8]
	subs	w8, w8, #1
	cset	w8, gt
	tbnz	w8, #0, LBB2_2
	b	LBB2_1
LBB2_1:
	ldr	w8, [sp, #8]
	stur	w8, [x29, #-4]
	b	LBB2_3
LBB2_2:
	ldr	w8, [sp, #8]
	subs	w0, w8, #1
	bl	_fibonacci1
	str	w0, [sp, #4]                    ; 4-byte Folded Spill
	ldr	w8, [sp, #8]
	subs	w0, w8, #2
	bl	_fibonacci1
	mov	x8, x0
	ldr	w0, [sp, #4]                    ; 4-byte Folded Reload
	add	w8, w0, w8
	stur	w8, [x29, #-4]
	b	LBB2_3
LBB2_3:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_testif1                        ; -- Begin function testif1
	.p2align	2
_testif1:                               ; @testif1
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #90
	stur	w8, [x29, #-4]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #90
	cset	w8, lt
	tbnz	w8, #0, LBB3_2
	b	LBB3_1
LBB3_1:
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	b	LBB3_7
LBB3_2:
	ldur	w8, [x29, #-4]
	subs	w8, w8, #60
	cset	w8, lt
	tbnz	w8, #0, LBB3_5
	b	LBB3_3
LBB3_3:
	ldur	w8, [x29, #-4]
	subs	w8, w8, #90
	cset	w8, ge
	tbnz	w8, #0, LBB3_5
	b	LBB3_4
LBB3_4:
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	b	LBB3_6
LBB3_5:
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	b	LBB3_6
LBB3_6:
	b	LBB3_7
LBB3_7:
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_testSwitch                     ; -- Begin function testSwitch
	.p2align	2
_testSwitch:                            ; @testSwitch
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #90
	stur	w8, [x29, #-4]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #1
                                        ; kill: def $x8 killed $w8
	str	x8, [sp]                        ; 8-byte Folded Spill
	subs	x8, x8, #89
	cset	w8, hi
	tbnz	w8, #0, LBB4_16
; %bb.1:
	ldr	x11, [sp]                       ; 8-byte Folded Reload
	adrp	x10, lJTI4_0@PAGE
	add	x10, x10, lJTI4_0@PAGEOFF
Ltmp1:
	adr	x8, Ltmp1
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB4_2:
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_3:
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_4:
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_5:
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_6:
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_7:
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_8:
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_9:
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_10:
	adrp	x0, l_.str.12@PAGE
	add	x0, x0, l_.str.12@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_11:
	adrp	x0, l_.str.13@PAGE
	add	x0, x0, l_.str.13@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_12:
	adrp	x0, l_.str.14@PAGE
	add	x0, x0, l_.str.14@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_13:
	adrp	x0, l_.str.15@PAGE
	add	x0, x0, l_.str.15@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_14:
	adrp	x0, l_.str.16@PAGE
	add	x0, x0, l_.str.16@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_15:
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_16:
	adrp	x0, l_.str.18@PAGE
	add	x0, x0, l_.str.18@PAGEOFF
	bl	_printf
	b	LBB4_17
LBB4_17:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
	.p2align	2
lJTI4_0:
	.long	LBB4_2-Ltmp1
	.long	LBB4_3-Ltmp1
	.long	LBB4_4-Ltmp1
	.long	LBB4_5-Ltmp1
	.long	LBB4_6-Ltmp1
	.long	LBB4_7-Ltmp1
	.long	LBB4_8-Ltmp1
	.long	LBB4_9-Ltmp1
	.long	LBB4_10-Ltmp1
	.long	LBB4_11-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_12-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_13-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_14-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_16-Ltmp1
	.long	LBB4_15-Ltmp1
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	x8, x0
	mov	w0, #0
	str	wzr, [sp, #12]
	str	w8, [sp, #8]
	str	x1, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"\344\274\230\347\247\200"

l_.str.1:                               ; @.str.1
	.asciz	"\345\217\212\346\240\274"

l_.str.2:                               ; @.str.2
	.asciz	"\345\267\256"

l_.str.3:                               ; @.str.3
	.asciz	"end\n"

l_.str.4:                               ; @.str.4
	.asciz	"1"

l_.str.5:                               ; @.str.5
	.asciz	"2"

l_.str.6:                               ; @.str.6
	.asciz	"3"

l_.str.7:                               ; @.str.7
	.asciz	"4"

l_.str.8:                               ; @.str.8
	.asciz	"5"

l_.str.9:                               ; @.str.9
	.asciz	"6"

l_.str.10:                              ; @.str.10
	.asciz	"7"

l_.str.11:                              ; @.str.11
	.asciz	"8"

l_.str.12:                              ; @.str.12
	.asciz	"9"

l_.str.13:                              ; @.str.13
	.asciz	"10"

l_.str.14:                              ; @.str.14
	.asciz	"30"

l_.str.15:                              ; @.str.15
	.asciz	"50"

l_.str.16:                              ; @.str.16
	.asciz	"70"

l_.str.17:                              ; @.str.17
	.asciz	"90"

l_.str.18:                              ; @.str.18
	.asciz	"other"

	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

.subsections_via_symbols
