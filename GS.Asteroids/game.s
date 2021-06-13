;
;  game.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

game    start
        using globalData
        using objectData
        using displayListData
        using rockData
        using gameData
        using scoreData
        
        
gameInit entry
        jsl setupScreen
        jsl initColorTable
        jsl soundInit
        jsl spawnInitialRocks
        lda #0
        sta playerScore
        rtl


runGameTick entry

        jsl checkControls

; do nothing if paused
        lda gamePaused
        cmp #0
        beq run
        rtl

run anop

; run the player ship
        jsl runPlayerShip
        
; spawn / run the saucers
        jsl spawnSaucer
        jsl runSaucers

; collision checks
        jsl doAllCollisionChecks

; check number of active rocks
        jsl calcActiveRocks

; if no rocks left respawn them
; TODO: wait for a delay here
; TODO: increment number of rocks
        lda rockCount
        cmp #0
        bne continue1
        jsl spawnInitialRocks

continue1 anop

; update all objects
        jsr updateObjects

; erase all previous lines and dots
        jsl eraseDisplayList
        jsl eraseDotList

; init the display list and dot list
        lda #0
        sta displayListLength
        sta dotListLength

; init the color list
        sta displayListColorLength

; alphanumerics
        jsl drawScore

; remaining ships
        jsl drawLives
        
; draw all objects
        jsr drawObjects
        
; render the display list and dot list
        jsl renderDisplayList
        jsl renderDotList

; fade particles and wreckage
        jsl fadeParticles
        jsl fadeWreckage

; "thump" sounds
        jsr doThumpSounds

        rtl



drawLives entry

        lda playerLives
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




; Credit for the code below goes to Jeremy Rand - author of BuGS

setupScreen entry

        lda >BORDER_COLOUR_REGISTER
        and #$f0
        sta >BORDER_COLOUR_REGISTER

        sei
        phd
        tsc
        sta backupStack
        lda >STATE_REGISTER      ; Direct Page and Stack in Bank 01/
        ora #$0030
        sta >STATE_REGISTER
        ldx #$0000

        lda #$9dfe
        tcs
        ldy #$7e00
nextWord anop
        phx
        dey
        dey
        bpl nextWord

        lda >STATE_REGISTER
        and #$ffcf
        sta >STATE_REGISTER
        lda backupStack
        tcs
        pld
        cli

        rtl

gameDone anop
        lda >BORDER_COLOUR_REGISTER
        and #$f0
        ora borderColour
        sta >BORDER_COLOUR_REGISTER

        rtl


doThumpSounds entry

        dec thumpTimer
        lda #0
        cmp thumpTimer
        beq resetThumpTimer
        jmp thumpDone

resetThumpTimer anop
        lda #20
        sta thumpTimer

        lda thumpWhich
        cmp #0
        beq thump1

        lda #0
        sta thumpWhich

        jsl playThumpLowSound

        jmp thumpDone

thump1 anop

        lda #1
        sta thumpWhich

        jsl playThumpHighSound

thumpDone anop

        rts



        end


gameData data

playerLives dc i2'3'

playerRespawnTimer dc i2'0'

thumpTimer dc i2'20'
thumpWhich dc i2'0'

fromx dc i2'0'
fromy dc i2'0'

livesXOffset dc i2'0'
livesCounter dc i2'0'

        end



