;
;  osdisplay.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

osdisplay start
        using globalData
        using gameData
        using objectData
        using displayListData


drawLives entry

        lda fastMode
        cmp #1
        bne notFastMode
        rtl

notFastMode anop

        jsl isGameOver
        cmp #0
        beq doDrawLives
        rtl

doDrawLives anop

        lda playerLives
        sec
        sbc #1
        sta livesCounter
        cmp #0
        beq livesDone

        stz livesXOffset

livesLoop anop

        lda #10
        clc
        adc livesXOffset
        sta drawX

        lda #25
        sta drawY

        jsl drawLifeShip

        dec livesCounter
        lda livesCounter
        cmp #0
        beq livesDone

        lda livesXOffset
        clc
        adc #7
        sta livesXOffset

        bra livesLoop

livesDone anop

        rtl


drawLifeShip anop

        ldx #0
        lda livesShipShapeData,x
        sta counter
        inx
        inx

        lda livesShipShapeData,x
        clc
        adc drawX
        sta fromx
        inx
        inx

        lda livesShipShapeData,x
        clc
        adc drawY
        sta fromy
        inx
        inx

drawObjectLoop anop

        dec counter
        lda counter
        cmp #0
        beq drawObjectDoneShortJump
        bra continue

drawObjectDoneShortJump anop
        brl drawObjectDone

continue anop

        lda fromx
        sta x1

        lda fromy
        sta y1

        lda livesShipShapeData,x
        clc
        adc drawX
        sta x2
        inx
        inx

        lda livesShipShapeData,x
        clc
        adc drawY
        sta y2
        inx
        inx

        lda x2
        sta fromx

        lda y2
        sta fromy

        ldy displayListLength

        lda x1
        sta displayListList,y
        iny
        iny

        lda y1
        sta displayListList,y
        iny
        iny

        lda x2
        sta displayListList,y
        iny
        iny

        lda y2
        sta displayListList,y
        iny
        iny

        sty displayListLength

        ldy displayListColorLength
        lda #$aa
        sta displayListColors,y
        iny
        iny
        sty displayListColorLength

skipLine1 anop

        jmp drawObjectLoop

drawObjectDone anop


        rtl


drawGameOver entry

        lda fastMode
        cmp #1
        bne dontSkipGameOver
        rtl

dontSkipGameOver anop

        jsl isGameOver
        cmp #1
        beq doDrawGameOver
        rtl

doDrawGameOver anop

        lda gameOverFlashState
        cmp #0
        beq runGameOverTimer
        jsl drawGameOverText
        rtl

runGameOverTimer anop

        dec gameOverFlashTimer
        lda gameOverFlashTimer
        bmi toggleFlashState
        rtl

toggleFlashState anop
        lda #15
        sta gameOverFlashTimer

        lda gameOverFlashState
        cmp #1
        beq toggleState1

        lda #1
        sta gameOverFlashState
        rtl

toggleState1 anop

        lda #0
        sta gameOverFlashState

        rtl



gameOverFlashTimer dc i2'0'
gameOverFlashState dc i2'1'

fromx dc i2'0'
fromy dc i2'0'

livesXOffset dc i2'0'
livesCounter dc i2'0'

        end
