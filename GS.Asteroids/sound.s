;
;  sound.s
;
;  Created by Jeremy Rand on 2020-12-16.
;Copyright © 2020 Jeremy Rand. All rights reserved.
;


        case on
        mcopy global.macros
        keep global

sound start
        using globalData


SOUND_REG_FREQ_LOW	gequ $0000
SOUND_REG_FREQ_HIGH	gequ $0020
SOUND_REG_VOLUME	gequ $0040
SOUND_REG_POINTER	gequ $0080
SOUND_REG_CONTROL	gequ $00a0
SOUND_REG_SIZE		gequ $00c0

SOUND_HALTED		gequ 1
SOUND_STARTED		gequ 0

SOUND_ONE_SHOT_MODE	gequ 2

SOUND_RIGHT_SPEAKER    gequ $10
SOUND_LEFT_SPEAKER    gequ $00

SOUND_CONTROL_REG        gequ $e1c03c
SOUND_DATA_REG            gequ $e1c03d
SOUND_ADDR_LOW            gequ $e1c03e
SOUND_ADDR_HIGH         gequ $e1c03f
SOUND_SYSTEM_VOLUME        gequ $e100ca


; OSC 6 & 7 for L/R channels
FIRE_SOUND_ADDR     gequ $0000
FIRE_OSC_NUM        gequ 6
FIRE_FREQ_HIGH        gequ 0
FIRE_FREQ_LOW        gequ 214
FIRE_CONTROL        gequ SOUND_ONE_SHOT_MODE
FIRE_SIZE            gequ $1b


; Y has the register to write to (16 bit mode)
; A has the value to write (8 bit mode)
; Assuming not in increment mode
writeReg entry
		sta registerValue
writeReg_loop anop
		tya
		sta >SOUND_ADDR_LOW
		_docWait
		lda registerValue
		sta >SOUND_DATA_REG
		tya
		sta >SOUND_ADDR_LOW
		_docWait
		lda >SOUND_DATA_REG
		lda >SOUND_DATA_REG
		cmp registerValue
		bne writeReg_loop
		rts


; Y has the register to write to (16 bit mode)
; A has the value to write (8 bit mode)
; Assuming not in increment mode
writeRegNoRead entry
		sta registerValue
		tya
		sta >SOUND_ADDR_LOW
		_docWait
		lda registerValue
		sta >SOUND_DATA_REG
		rts

soundInit entry
; Fire sound
		pea FIRE_SOUND_ADDR
		jsl loadFireSound

		_docWait
		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		ldx #soundRegDefaults
soundInit_loop anop
		lda |$0,x
		tay
		lda |$1,x
		jsr writeRegNoRead
		inx
		inx
		cpx #soundRegDefaultsEnd
		blt soundInit_loop

		rtl

playFireSound entry
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+FIRE_OSC_NUM,#FIRE_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+FIRE_OSC_NUM+1,#FIRE_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+FIRE_OSC_NUM
        lda #1
		jsr writeReg
		iny
        lda #1
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+FIRE_OSC_NUM,#FIRE_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+FIRE_OSC_NUM+1,#FIRE_CONTROL+SOUND_LEFT_SPEAKER

		rtl

registerValue        dc i2'0'

soundRegDefaults	anop

; Fire registers
		dc i1'SOUND_REG_FREQ_LOW+FIRE_OSC_NUM',i1'FIRE_FREQ_LOW'
		dc i1'SOUND_REG_FREQ_LOW+FIRE_OSC_NUM+1',i1'FIRE_FREQ_LOW'
		dc i1'SOUND_REG_FREQ_HIGH+FIRE_OSC_NUM',i1'FIRE_FREQ_HIGH'
		dc i1'SOUND_REG_FREQ_HIGH+FIRE_OSC_NUM+1',i1'FIRE_FREQ_HIGH'
		dc i1'SOUND_REG_SIZE+FIRE_OSC_NUM',i1'FIRE_SIZE'
		dc i1'SOUND_REG_SIZE+FIRE_OSC_NUM+1',i1'FIRE_SIZE'
		dc i1'SOUND_REG_POINTER+FIRE_OSC_NUM',i1'FIRE_SOUND_ADDR/256'
		dc i1'SOUND_REG_POINTER+FIRE_OSC_NUM+1',i1'FIRE_SOUND_ADDR/256'
		dc i1'SOUND_REG_CONTROL+FIRE_OSC_NUM',i1'FIRE_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
		dc i1'SOUND_REG_CONTROL+FIRE_OSC_NUM+1',i1'FIRE_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

soundRegDefaultsEnd	anop

        end
