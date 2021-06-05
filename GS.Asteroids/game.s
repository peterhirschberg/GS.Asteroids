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


gameInit entry
        jsl setupScreen
        jsl initColorTable
        jsl spawnInitialRocks

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

; collision checks
        jsl collisionCheckMissiles
        jsl collisionCheckPlayer

; check number of active rocks
        jsl numActiveRocks
        sta activeRockCount

; if no rocks left respawn them
; TODO: wait for a delay here
; TODO: increment number of rocks
        lda activeRockCount
        cmp #0
        bne continue
        jsl spawnInitialRocks

continue anop
; update all objects
        jsr updateObjects

; wait for VBL
;        jsl waitForVbl

; erase all previous lines and dots
        jsl eraseDisplayList
        jsl eraseDotList

; init the display list and dot list
        lda #0
        sta displayListLength
        sta dotListLength

; init the color list
        sta displayListColorLength

; draw everything to the display list
        jsr drawObjects

; render the display list and dot list
        jsl renderDisplayList
        jsl renderDotList

; fade particles
;        jsl fadeParticles

        rtl


; Credit for the code below goes to Jeremy Rand - author of BuGS
waitForVbl entry
vblLoop anop
        lda >VERTICAL_COUNTER     ; load the counter value
        and #$80ff                ; mask out the VBL bits
        asl a                     ; shift the word around
        adc #0                    ; move MSB -> LSB
        cmp #$1c8
        bge vblLoop
        rtl

setupScreen entry
        bra dontShadow

        lda >SHADOW_REGISTER     ; Enable shadowing of SHR
        and #$f7
        sta >SHADOW_REGISTER

        lda #$a1
        sta >NEW_VIDEO_REGISTER     ; Enable SHR mode
        lda >BORDER_COLOUR_REGISTER
        and #$000f
        sta borderColour

dontShadow anop

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


        end






