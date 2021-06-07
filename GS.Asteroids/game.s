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
        jsl collisionCheckMissiles
        jsl collisionCheckPlayer
        jsl collisionCheckSaucers

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
        
; draw all objects
        jsr drawObjects
        
; render the display list and dot list
        jsl renderDisplayList
        jsl renderDotList

; fade particles and wreckage
        jsl fadeParticles
        jsl fadeWreckage

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

        

        end


gameData data

playerRespawnTimer dc i2'0'
    
        end



