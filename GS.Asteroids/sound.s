;
;  sound.s
;
; ********************************************
; Almost all this code/structure is pulled from Jeremy Rand's "BuGS" game
; Github: https://github.com/jeremysrand/BuGS
; ********************************************
;
;  Created by Jeremy Rand on 2020-12-16.
;  Copyright © 2020 Jeremy Rand. All rights reserved.
;

        case on
        mcopy global.macros
        keep global

sound start
        using globalData


SOUND_REG_FREQ_LOW	equ $0000
SOUND_REG_FREQ_HIGH	equ $0020
SOUND_REG_VOLUME	equ $0040
SOUND_REG_POINTER	equ $0080
SOUND_REG_CONTROL	equ $00a0
SOUND_REG_SIZE		equ $00c0

SOUND_HALTED		equ 1
SOUND_STARTED		equ 0

SOUND_ONE_SHOT_MODE	equ 2
SOUND_SWAP_MODE equ 6

SOUND_RIGHT_SPEAKER    equ $10
SOUND_LEFT_SPEAKER    equ $00

SOUND_CONTROL_REG        equ $e1c03c
SOUND_DATA_REG            equ $e1c03d
SOUND_ADDR_LOW            equ $e1c03e
SOUND_ADDR_HIGH         equ $e1c03f
SOUND_SYSTEM_VOLUME        equ $e100ca


EXPLODE1_SOUND_ADDR     equ $0000
EXPLODE1_OSC_NUM        equ 0
EXPLODE1_FREQ_HIGH        equ 0
EXPLODE1_FREQ_LOW        equ 800
EXPLODE1_CONTROL        equ SOUND_ONE_SHOT_MODE
EXPLODE1_SIZE            equ $2b

EXPLODE2_SOUND_ADDR     equ $2000
EXPLODE2_OSC_NUM        equ 2
EXPLODE2_FREQ_HIGH        equ 0
EXPLODE2_FREQ_LOW        equ 800
EXPLODE2_CONTROL        equ SOUND_ONE_SHOT_MODE
EXPLODE2_SIZE            equ $2b

EXPLODE3_SOUND_ADDR     equ $4000
EXPLODE3_OSC_NUM        equ 4
EXPLODE3_FREQ_HIGH        equ 0
EXPLODE3_FREQ_LOW        equ 800
EXPLODE3_CONTROL        equ SOUND_ONE_SHOT_MODE
EXPLODE3_SIZE            equ $2b

FIRE_SOUND_ADDR     equ $6000
FIRE_OSC_NUM        equ 6
FIRE_FREQ_HIGH        equ 0
FIRE_FREQ_LOW        equ 150
FIRE_CONTROL        equ SOUND_ONE_SHOT_MODE
FIRE_SIZE            equ $1b

THRUST_SOUND_ADDR     equ $8000
THRUST_OSC_NUM        equ 8
THRUST_FREQ_HIGH        equ 0
THRUST_FREQ_LOW        equ 800
THRUST_CONTROL        equ SOUND_SWAP_MODE
THRUST_SIZE            equ $2b

LSAUCER_SOUND_ADDR     equ $9000
LSAUCER_OSC_NUM        equ 12
LSAUCER_FREQ_HIGH        equ 0
LSAUCER_FREQ_LOW        equ 400
LSAUCER_CONTROL        equ SOUND_SWAP_MODE
LSAUCER_SIZE            equ $1b

SSAUCER_SOUND_ADDR     equ $a000
SSAUCER_OSC_NUM        equ 16
SSAUCER_FREQ_HIGH        equ 0
SSAUCER_FREQ_LOW        equ 400
SSAUCER_CONTROL        equ SOUND_SWAP_MODE
SSAUCER_SIZE            equ $1b

THUMPLO_SOUND_ADDR     equ $c000
THUMPLO_OSC_NUM        equ 20
THUMPLO_FREQ_HIGH        equ 0
THUMPLO_FREQ_LOW        equ 803
THUMPLO_CONTROL        equ SOUND_ONE_SHOT_MODE
THUMPLO_SIZE            equ $2b

THUMPHI_SOUND_ADDR     equ $d000
THUMPHI_OSC_NUM        equ 22
THUMPHI_FREQ_HIGH        equ 0
THUMPHI_FREQ_LOW        equ 806
THUMPHI_CONTROL        equ SOUND_ONE_SHOT_MODE
THUMPHI_SIZE            equ $2b

LIFE_SOUND_ADDR     equ $e000
LIFE_OSC_NUM        equ 24
LIFE_FREQ_HIGH        equ 0
LIFE_FREQ_LOW        equ 400
LIFE_CONTROL        equ SOUND_ONE_SHOT_MODE
LIFE_SIZE            equ $1b


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
		pea FIRE_SOUND_ADDR
		jsl loadFireSound

        pea EXPLODE1_SOUND_ADDR
        jsl loadExplode1Sound

        pea EXPLODE2_SOUND_ADDR
        jsl loadExplode2Sound

        pea EXPLODE3_SOUND_ADDR
        jsl loadExplode3Sound

        pea THRUST_SOUND_ADDR
        jsl loadThrustSound

        pea LSAUCER_SOUND_ADDR
        jsl loadLSaucerSound

        pea SSAUCER_SOUND_ADDR
        jsl loadSSaucerSound

        pea THUMPLO_SOUND_ADDR
        jsl loadThumpLowSound

        pea THUMPHI_SOUND_ADDR
        jsl loadThumpHighSound

        pea LIFE_SOUND_ADDR
        jsl loadLifeSound

; Set registers
        short m
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
        long m

		rtl

playFireSound entry

        jsl isGameOver
        cmp #0
        beq doPlayerFireSound
        rtl

doPlayerFireSound anop
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+FIRE_OSC_NUM,#FIRE_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+FIRE_OSC_NUM+1,#FIRE_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+FIRE_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+FIRE_OSC_NUM,#FIRE_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+FIRE_OSC_NUM+1,#FIRE_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rtl


playExplode1Sound entry

        jsl isGameOver
        cmp #0
        beq doExplode1Sound
        rtl

doExplode1Sound anop
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+EXPLODE1_OSC_NUM,#EXPLODE1_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EXPLODE1_OSC_NUM+1,#EXPLODE1_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+EXPLODE1_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+EXPLODE1_OSC_NUM,#EXPLODE1_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EXPLODE1_OSC_NUM+1,#EXPLODE1_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rtl

playExplode2Sound entry

        jsl isGameOver
        cmp #0
        beq doExplode2Sound
        rtl

doExplode2Sound anop
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+EXPLODE2_OSC_NUM,#EXPLODE2_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EXPLODE2_OSC_NUM+1,#EXPLODE2_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+EXPLODE2_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+EXPLODE2_OSC_NUM,#EXPLODE2_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EXPLODE2_OSC_NUM+1,#EXPLODE2_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rtl

playExplode3Sound entry

        jsl isGameOver
        cmp #0
        beq doExplode3Sound
        rtl

doExplode3Sound anop
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+EXPLODE3_OSC_NUM,#EXPLODE3_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EXPLODE3_OSC_NUM+1,#EXPLODE3_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+EXPLODE3_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+EXPLODE3_OSC_NUM,#EXPLODE3_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EXPLODE3_OSC_NUM+1,#EXPLODE3_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rtl

startThrustSound entry

        jsl isGameOver
        cmp #0
        beq doThrustSound
        rtl

doThrustSound anop

        lda thrustSoundIsPlaying
        cmp #1
        beq thrustAlreadyPlaying
        jmp doStartThrustSound

thrustAlreadyPlaying anop
        rtl

doStartThrustSound anop
        lda #1
        sta thrustSoundIsPlaying

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM,#THRUST_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+1,#THRUST_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+2,#THRUST_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+3,#THRUST_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+THRUST_OSC_NUM
        lda #$fff
        jsr writeReg
        iny
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg

		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM,#THRUST_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+1,#THRUST_CONTROL+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+2,#THRUST_CONTROL+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+3,#THRUST_CONTROL+SOUND_LEFT_SPEAKER

        long m
		rtl


stopThrustSound entry
        lda thrustSoundIsPlaying
        cmp #0
        beq thrustNotPlaying
        jmp doStopThrustSound

thrustNotPlaying anop
        rtl

doStopThrustSound anop
        lda #0
        sta thrustSoundIsPlaying

        short m
		_docWait
		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_VOLUME+THRUST_OSC_NUM,#0
		_writeReg #SOUND_REG_VOLUME+THRUST_OSC_NUM+1,#0
		_writeReg #SOUND_REG_VOLUME+THRUST_OSC_NUM+1,#0
		_writeReg #SOUND_REG_VOLUME+THRUST_OSC_NUM+1,#0

		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER

		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THRUST_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER

        long m
        rtl


; SAUCERS

startSaucerSound entry

        jsl isGameOver
        cmp #0
        beq doSaucerSound
        rtl

doSaucerSound anop

        jsr isSmallSaucer
        cmp #0
        beq startLargeSaucerSound
        jsl startSSaucerSound
        rtl
startLargeSaucerSound anop
        jsl startLSaucerSound
        rtl

stopSaucerSound entry
        jsr isSmallSaucer
        cmp #0
        beq stopLargeSaucerSound
        jsl stopSSaucerSound
        rtl
stopLargeSaucerSound anop
        jsl stopLSaucerSound
        rtl

; LSAUCER

startLSaucerSound entry

        lda lSaucerSoundIsPlaying
        cmp #1
        beq lSaucerAlreadyPlaying
        jmp doStartLSaucerSound

lSaucerAlreadyPlaying anop
        rtl

doStartLSaucerSound anop
        lda #1
        sta lSaucerSoundIsPlaying

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM,#LSAUCER_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+1,#LSAUCER_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+2,#LSAUCER_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+3,#LSAUCER_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+LSAUCER_OSC_NUM
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg

		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM,#LSAUCER_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+1,#LSAUCER_CONTROL+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+2,#LSAUCER_CONTROL+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+3,#LSAUCER_CONTROL+SOUND_LEFT_SPEAKER

        long m
        rtl


stopLSaucerSound entry
        lda lSaucerSoundIsPlaying
        cmp #0
        beq lSaucerNotPlaying
        jmp doStopLSaucerSound

lSaucerNotPlaying anop
        rtl

doStopLSaucerSound anop
        lda #0
        sta lSaucerSoundIsPlaying

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_VOLUME+LSAUCER_OSC_NUM,#0
		_writeReg #SOUND_REG_VOLUME+LSAUCER_OSC_NUM+1,#0
		_writeReg #SOUND_REG_VOLUME+LSAUCER_OSC_NUM+1,#0
		_writeReg #SOUND_REG_VOLUME+LSAUCER_OSC_NUM+1,#0

		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER

		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LSAUCER_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER

        long m
        rtl


; SSAUCER

startSSaucerSound entry

        lda sSaucerSoundIsPlaying
        cmp #1
        beq sSaucerAlreadyPlaying
        jmp doStartSSaucerSound

sSaucerAlreadyPlaying anop
        rtl

doStartSSaucerSound anop
        lda #1
        sta sSaucerSoundIsPlaying

        short m
		_docWait

        lda >SOUND_SYSTEM_VOLUME
        and #$0f
        sta >SOUND_CONTROL_REG

        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM,#SSAUCER_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+1,#SSAUCER_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+2,#SSAUCER_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+3,#SSAUCER_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

        ldy #SOUND_REG_VOLUME+SSAUCER_OSC_NUM
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg

        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM,#SSAUCER_CONTROL+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+1,#SSAUCER_CONTROL+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+2,#SSAUCER_CONTROL+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+3,#SSAUCER_CONTROL+SOUND_LEFT_SPEAKER

        long m
		rtl


stopSSaucerSound entry
       lda sSaucerSoundIsPlaying
       cmp #0
       beq sSaucerNotPlaying
       jmp doStopSSaucerSound

sSaucerNotPlaying anop
      rtl

doStopSSaucerSound anop
        lda #0
        sta sSaucerSoundIsPlaying

        short m
		_docWait

        lda >SOUND_SYSTEM_VOLUME
        and #$0f
        sta >SOUND_CONTROL_REG

        _writeReg #SOUND_REG_VOLUME+SSAUCER_OSC_NUM,#0
        _writeReg #SOUND_REG_VOLUME+SSAUCER_OSC_NUM+1,#0
        _writeReg #SOUND_REG_VOLUME+SSAUCER_OSC_NUM+1,#0
        _writeReg #SOUND_REG_VOLUME+SSAUCER_OSC_NUM+1,#0

        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER

        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SSAUCER_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER

        long m
        rtl


playThumpLowSound entry

        jsl isGameOver
        cmp #0
        beq doThumpLowSound
        rtl

doThumpLowSound anop

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+THUMPLO_OSC_NUM,#THUMPLO_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THUMPLO_OSC_NUM+1,#THUMPLO_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+THUMPLO_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+THUMPLO_OSC_NUM,#THUMPLO_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+THUMPLO_OSC_NUM+1,#THUMPLO_CONTROL+SOUND_LEFT_SPEAKER

        long m
		rtl


playThumpHighSound entry

        jsl isGameOver
        cmp #0
        beq doThumpHighSound
        rtl

doThumpHighSound anop

        short m
        _docWait

        lda >SOUND_SYSTEM_VOLUME
        and #$0f
        sta >SOUND_CONTROL_REG

        _writeReg #SOUND_REG_CONTROL+THUMPHI_OSC_NUM,#THUMPHI_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+THUMPHI_OSC_NUM+1,#THUMPHI_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

        ldy #SOUND_REG_VOLUME+THUMPHI_OSC_NUM
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg

        _writeReg #SOUND_REG_CONTROL+THUMPHI_OSC_NUM,#THUMPHI_CONTROL+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+THUMPHI_OSC_NUM+1,#THUMPHI_CONTROL+SOUND_LEFT_SPEAKER

        long m
        rtl


doLifeSound entry

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+LIFE_OSC_NUM,#LIFE_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LIFE_OSC_NUM+1,#LIFE_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+LIFE_OSC_NUM
       lda #$ff
		jsr writeReg
		iny
       lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+LIFE_OSC_NUM,#LIFE_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+LIFE_OSC_NUM+1,#LIFE_CONTROL+SOUND_LEFT_SPEAKER

       long m
		rtl


registerValue dc i2'0'
thrustSoundIsPlaying dc i2'0'
lSaucerSoundIsPlaying dc i2'0'
sSaucerSoundIsPlaying dc i2'0'


soundRegDefaults anop

; Fire
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

; Explode 1
        dc i1'SOUND_REG_FREQ_LOW+EXPLODE1_OSC_NUM',i1'EXPLODE1_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+EXPLODE1_OSC_NUM+1',i1'EXPLODE1_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+EXPLODE1_OSC_NUM',i1'EXPLODE1_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+EXPLODE1_OSC_NUM+1',i1'EXPLODE1_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+EXPLODE1_OSC_NUM',i1'EXPLODE1_SIZE'
        dc i1'SOUND_REG_SIZE+EXPLODE1_OSC_NUM+1',i1'EXPLODE1_SIZE'
        dc i1'SOUND_REG_POINTER+EXPLODE1_OSC_NUM',i1'EXPLODE1_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+EXPLODE1_OSC_NUM+1',i1'EXPLODE1_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+EXPLODE1_OSC_NUM',i1'EXPLODE1_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+EXPLODE1_OSC_NUM+1',i1'EXPLODE1_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

; Explode 2
        dc i1'SOUND_REG_FREQ_LOW+EXPLODE2_OSC_NUM',i1'EXPLODE2_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+EXPLODE2_OSC_NUM+1',i1'EXPLODE2_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+EXPLODE2_OSC_NUM',i1'EXPLODE2_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+EXPLODE2_OSC_NUM+1',i1'EXPLODE2_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+EXPLODE2_OSC_NUM',i1'EXPLODE2_SIZE'
        dc i1'SOUND_REG_SIZE+EXPLODE2_OSC_NUM+1',i1'EXPLODE2_SIZE'
        dc i1'SOUND_REG_POINTER+EXPLODE2_OSC_NUM',i1'EXPLODE2_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+EXPLODE2_OSC_NUM+1',i1'EXPLODE2_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+EXPLODE2_OSC_NUM',i1'EXPLODE2_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+EXPLODE2_OSC_NUM+1',i1'EXPLODE2_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

; Explode 3
        dc i1'SOUND_REG_FREQ_LOW+EXPLODE3_OSC_NUM',i1'EXPLODE3_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+EXPLODE3_OSC_NUM+1',i1'EXPLODE3_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+EXPLODE3_OSC_NUM',i1'EXPLODE3_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+EXPLODE3_OSC_NUM+1',i1'EXPLODE3_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+EXPLODE3_OSC_NUM',i1'EXPLODE3_SIZE'
        dc i1'SOUND_REG_SIZE+EXPLODE3_OSC_NUM+1',i1'EXPLODE3_SIZE'
        dc i1'SOUND_REG_POINTER+EXPLODE3_OSC_NUM',i1'EXPLODE3_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+EXPLODE3_OSC_NUM+1',i1'EXPLODE3_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+EXPLODE3_OSC_NUM',i1'EXPLODE3_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+EXPLODE3_OSC_NUM+1',i1'EXPLODE3_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

; Thrust
        dc i1'SOUND_REG_FREQ_LOW+THRUST_OSC_NUM',i1'THRUST_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+THRUST_OSC_NUM+1',i1'THRUST_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+THRUST_OSC_NUM',i1'THRUST_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+THRUST_OSC_NUM+1',i1'THRUST_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+THRUST_OSC_NUM',i1'THRUST_SIZE'
        dc i1'SOUND_REG_SIZE+THRUST_OSC_NUM+1',i1'THRUST_SIZE'
        dc i1'SOUND_REG_POINTER+THRUST_OSC_NUM',i1'THRUST_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+THRUST_OSC_NUM+1',i1'THRUST_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+THRUST_OSC_NUM',i1'THRUST_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+THRUST_OSC_NUM+1',i1'THRUST_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

; Large Saucer
        dc i1'SOUND_REG_FREQ_LOW+LSAUCER_OSC_NUM',i1'LSAUCER_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+LSAUCER_OSC_NUM+1',i1'LSAUCER_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+LSAUCER_OSC_NUM',i1'LSAUCER_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+LSAUCER_OSC_NUM+1',i1'LSAUCER_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+LSAUCER_OSC_NUM',i1'LSAUCER_SIZE'
        dc i1'SOUND_REG_SIZE+LSAUCER_OSC_NUM+1',i1'LSAUCER_SIZE'
        dc i1'SOUND_REG_POINTER+LSAUCER_OSC_NUM',i1'LSAUCER_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+LSAUCER_OSC_NUM+1',i1'LSAUCER_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+LSAUCER_OSC_NUM',i1'LSAUCER_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+LSAUCER_OSC_NUM+1',i1'LSAUCER_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

; Small Saucer
        dc i1'SOUND_REG_FREQ_LOW+SSAUCER_OSC_NUM',i1'SSAUCER_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+SSAUCER_OSC_NUM+1',i1'SSAUCER_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+SSAUCER_OSC_NUM',i1'SSAUCER_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+SSAUCER_OSC_NUM+1',i1'SSAUCER_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+SSAUCER_OSC_NUM',i1'SSAUCER_SIZE'
        dc i1'SOUND_REG_SIZE+SSAUCER_OSC_NUM+1',i1'SSAUCER_SIZE'
        dc i1'SOUND_REG_POINTER+SSAUCER_OSC_NUM',i1'SSAUCER_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+SSAUCER_OSC_NUM+1',i1'SSAUCER_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+SSAUCER_OSC_NUM',i1'SSAUCER_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+SSAUCER_OSC_NUM+1',i1'SSAUCER_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

; Thump low
        dc i1'SOUND_REG_FREQ_LOW+THUMPLO_OSC_NUM',i1'THUMPLO_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+THUMPLO_OSC_NUM+1',i1'THUMPLO_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+THUMPLO_OSC_NUM',i1'THUMPLO_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+THUMPLO_OSC_NUM+1',i1'THUMPLO_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+THUMPLO_OSC_NUM',i1'THUMPLO_SIZE'
        dc i1'SOUND_REG_SIZE+THUMPLO_OSC_NUM+1',i1'THUMPLO_SIZE'
        dc i1'SOUND_REG_POINTER+THUMPLO_OSC_NUM',i1'THUMPLO_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+THUMPLO_OSC_NUM+1',i1'THUMPLO_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+THUMPLO_OSC_NUM',i1'THUMPLO_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+THUMPLO_OSC_NUM+1',i1'THUMPLO_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

; Thump high
        dc i1'SOUND_REG_FREQ_LOW+THUMPHI_OSC_NUM',i1'THUMPHI_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+THUMPHI_OSC_NUM+1',i1'THUMPHI_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+THUMPHI_OSC_NUM',i1'THUMPHI_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+THUMPHI_OSC_NUM+1',i1'THUMPHI_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+THUMPHI_OSC_NUM',i1'THUMPHI_SIZE'
        dc i1'SOUND_REG_SIZE+THUMPHI_OSC_NUM+1',i1'THUMPHI_SIZE'
        dc i1'SOUND_REG_POINTER+THUMPHI_OSC_NUM',i1'THUMPHI_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+THUMPHI_OSC_NUM+1',i1'THUMPHI_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+THUMPHI_OSC_NUM',i1'THUMPHI_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+THUMPHI_OSC_NUM+1',i1'THUMPHI_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

; Life
        dc i1'SOUND_REG_FREQ_LOW+LIFE_OSC_NUM',i1'LIFE_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+LIFE_OSC_NUM+1',i1'LIFE_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+LIFE_OSC_NUM',i1'LIFE_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+LIFE_OSC_NUM+1',i1'LIFE_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+LIFE_OSC_NUM',i1'LIFE_SIZE'
        dc i1'SOUND_REG_SIZE+LIFE_OSC_NUM+1',i1'LIFE_SIZE'
        dc i1'SOUND_REG_POINTER+LIFE_OSC_NUM',i1'LIFE_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+LIFE_OSC_NUM+1',i1'LIFE_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+LIFE_OSC_NUM',i1'LIFE_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+LIFE_OSC_NUM+1',i1'LIFE_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'

soundRegDefaultsEnd	anop


        end
