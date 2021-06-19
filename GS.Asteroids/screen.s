;
;  screen.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

;----------------------------------------
;  JoeyLib
;  Copyright (C) 2018-2019 Scott Duensing <scott@kangaroopunch.com>
;
;  This software is provided 'as-is', without any express or implied
;  warranty.  In no event will the authors be held liable for any damages
;  arising from the use of this software.
;
;  Permission is granted to anyone to use this software for any purpose,
;  including commercial applications, and to alter it and redistribute it
;  freely, subject to the following restrictions:
;
;  1. The origin of this software must not be misrepresented; you must not
;     claim that you wrote the original software. If you use this software
;     in a product, an acknowledgment in the product documentation would be
;     appreciated but is not required.
;  2. Altered source versions must be plainly marked as such, and must not be
;     misrepresented as being the original software.
;  3. This notice may not be removed or altered from any source distribution.
;----------------------------------------


;----------------------------------------
; "PEI Slam" shadowed SHR display to the
; actual display.  Copies all 200 lines,
; the palette, and SCBs.
;
; Basically stolen from https://www.yumpu.com/en/document/view/23761498/code-secrets-of-wolfenstein-3d-iigs-kansasfest
;----------------------------------------

    case on
    mcopy global.macros
    keep global

screen start

;----------------------------------------
; Turns off SHR Graphics
;----------------------------------------
asmGrOff entry
	short	m
	lda	>$E1C029
	and	#$7F
	sta	>$E1C029
	long	m
    rtl

;----------------------------------------
; Turns on SHR Graphics
;----------------------------------------
asmGrOn	entry
	short	m
	lda	>$E1C029
	ora	#$C1
	sta	>$E1C029
	long	m
	rtl

asmSlam	entry

	short	m	; Turn Shadowing On
	lda	>$E0C035
	and	#$F7
	sta	>$E0C035
	long	m

	php		; Push Processor Status Register
	lda	>$E0C068-1
	pha		; Save main/aux bank state
	phd		; Save DPage
	tsc		; Transfer Stack Pointer to C Accumulator
	sta	>StackPtr	; Store Accumulator in StackPtr

	sei		; Disable interrupts

	lda	#$3000	; Read/write aux 48k (SHR) via bank 0
	sta	>$E0C068-1

	ldy	#$2000	; Point to start of SHR

peiChunk	ldx	#7	; Chunks before interrupts

peiPage	tya
	tcd		; Move DP

	clc
	adc	#$FF	; Point to top of page
	tcs		; Move stack

	inc	a
	tay		; Keep + 0x100 for later

	pei	$FE	; "Slam" a single page
	pei	$FC
	pei	$FA
	pei	$F8
	pei	$F6
	pei	$F4
	pei	$F2
	pei	$F0
	pei	$EE
	pei	$EC
	pei	$EA
	pei	$E8
	pei	$E6
	nop
	pei	$E4
	pei	$E2
	pei	$E0
	pei	$DE
	pei	$DC
	pei	$DA
	pei	$D8
	pei	$D6
	pei	$D4
	pei	$D2
	pei	$D0
	pei	$CE
	pei	$CC
	nop
	pei	$CA
	pei	$C8
	pei	$C6
	pei	$C4
	pei	$C2
	pei	$C0
	pei	$BE
	pei	$BC
	pei	$BA
	pei	$B8
	pei	$B6
	pei	$B4
	pei	$B2
	nop
	pei	$B0
	pei	$AE
	pei	$AC
	pei	$AA
	pei	$A8
	pei	$A6
	pei	$A4
	pei	$A2
	pei	$A0
	pei	$9E
	pei	$9C
	pei	$9A
	pei	$98
	nop
	pei	$96
	pei	$94
	pei	$92
	pei	$90
	pei	$8E
	pei	$8C
	pei	$8A
	pei	$88
	pei	$86
	pei	$84
	pei	$82
	pei	$80
	nop
	pei	$7E
	pei	$7C
	pei	$7A
	pei	$78
	pei	$76
	pei	$74
	pei	$72
	pei	$70
	pei	$6E
	pei	$6C
	pei	$6A
	pei	$68
	pei	$66
	nop
	pei	$64
	pei	$62
	pei	$60
	pei	$5E
	pei	$5C
	pei	$5A
	pei	$58
	pei	$56
	pei	$54
	pei	$52
	pei	$50
	pei	$4E
	nop
	pei	$4C
	pei	$4A
	pei	$48
	pei	$46
	pei	$44
	pei	$42
	pei	$40
	pei	$3E
	pei	$3C
	pei	$3A
	pei	$38
	pei	$36
	pei	$34
	nop
	pei	$32
	pei	$30
	pei	$2E
	pei	$2C
	pei	$2A
	pei	$28
	pei	$26
	pei	$24
	pei	$22
	pei	$20
	pei	$1E
	pei	$1C
	pei	$1A
	nop
	pei	$18
	pei	$16
	pei	$14
	pei	$12
	pei	$10
	pei	$0E
	pei	$0C
	pei	$0A
	pei	$08
	pei	$06
	pei	$04
	pei	$02
	pei	$00

	cpy	#$A000	; Did we copy everything?
	bge	peiEnd	; Yep!

	dex
	bmi	peiInts	; Do we need to process interrupts?

	brl	peiPage

peiInts	lda	#0	; Swap main 48k into bank 0
	sta	>$E0C068-1
	lda	>StackPtr	; Load original Stack Pointer into Accumulator
	tcs		; Transfer Accumulator to Stack Pointer (Restores original stack)

	cli		; Go Interrupts!  Go!
	sei		; Stop interrupts

	lda	#$3000	; Read/write aux 48k (SHR) via bank 0
	sta	>$E0C068-1

	brl	peiChunk

peiEnd	lda	#0	; Swap main 48k into bank 0
	sta	>$E0C068-1
	lda	>StackPtr
	tcs		; Restore stack
	pld		; Restore DP
	pla
	sta	>$E0C068-1	; Restore main/aux bank state
	plp		; Restore processor register

	short	m	; Turn Shadowing Off
	lda	>$E0C035
	ora	#$08
	sta	>$E0C035
	long	m

	rtl

StackPtr	dc	i2'0'	; Space for SP

	end

