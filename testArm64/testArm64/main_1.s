	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 4
	.globl	_switch_1                       ; -- Begin function switch_1
	.p2align	2
_switch_1:                              ; @switch_1
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_switch_2                       ; -- Begin function switch_2
	.p2align	2
_switch_2:                              ; @switch_2
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_switch_3                       ; -- Begin function switch_3
	.p2align	2
_switch_3:                              ; @switch_3
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_switch_4                       ; -- Begin function switch_4
	.p2align	2
_switch_4:                              ; @switch_4
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_switch_5                       ; -- Begin function switch_5
	.p2align	2
_switch_5:                              ; @switch_5
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_switch_6                       ; -- Begin function switch_6
	.p2align	2
_switch_6:                              ; @switch_6
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_switch_7                       ; -- Begin function switch_7
	.p2align	2
_switch_7:                              ; @switch_7
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_switch_other                   ; -- Begin function switch_other
	.p2align	2
_switch_other:                          ; @switch_other
	.cfi_startproc
; %bb.0:
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
	mov	w8, #10
	stur	w8, [x29, #-4]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #2
                                        ; kill: def $x8 killed $w8
	str	x8, [sp]                        ; 8-byte Folded Spill
	subs	x8, x8, #28
	cset	w8, hi
	tbnz	w8, #0, LBB8_6
; %bb.1:
	ldr	x11, [sp]                       ; 8-byte Folded Reload
	adrp	x10, lJTI8_0@PAGE
	add	x10, x10, lJTI8_0@PAGEOFF
Ltmp0:
	adr	x8, Ltmp0
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB8_2:
	bl	_switch_1
	b	LBB8_7
LBB8_3:
	bl	_switch_2
	b	LBB8_7
LBB8_4:
	bl	_switch_3
	b	LBB8_7
LBB8_5:
	bl	_switch_5
	b	LBB8_7
LBB8_6:
	bl	_switch_other
	b	LBB8_7
LBB8_7:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
	.p2align	2
lJTI8_0:
	.long	LBB8_3-Ltmp0
	.long	LBB8_4-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_2-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_6-Ltmp0
	.long	LBB8_5-Ltmp0
                                        ; -- End function
	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

.subsections_via_symbols
