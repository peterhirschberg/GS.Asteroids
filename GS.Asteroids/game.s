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
        using saucerData
        
        
gameInit entry
        jsl setupScreen
        jsl initColorTable
        jsl soundInit
        jsl spawnInitialRocks
        rtl


runGameTick entry

; if on last life and player is dead, go to game over
; But, wait until all missiles and saucers are done
        lda playerLives
        cmp #1
        beq checkAlive
        bra doCheckControls

checkAlive anop
        ldx #OBJECT_PLAYER
        lda lifetimeList,x
        cmp #0
        beq checkOutstandingMissiles
        bra doCheckControls

checkOutstandingMissiles anop
        jsl getActiveMissileCount
        cmp #0
        beq startGameOver
        bra doCheckControls

startGameOver anop
        lda #GAMEMODE_GAMEOVER
        sta gameMode

doCheckControls anop

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

; if no rocks left restart with next level
        lda rockCount
        cmp #0
        bne continue1
        jsr resetForNextWave

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
        jsl drawGameOver

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




doThumpSounds entry

; no thumps between levels
        lda interWaveTimer
        cmp #60
        beq checkPlayer
        rts

checkPlayer anop
; no thumps if the player is not active
        ldx #OBJECT_PLAYER
        lda lifetimeList,x
        cmp #-1
        beq doThumps
        rts

doThumps anop

        dec thumpTimer
        lda #0
        cmp thumpTimer
        beq resetThumpTimer
        jmp thumpDone

resetThumpTimer anop
        lda thumpTime
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

; increase thump speed

        dec thumpDecTimer
        lda thumpDecTimer
        bmi decThumpTime
        rts

decThumpTime anop
        dec thumpTime
        lda #50
        sta thumpDecTimer

        lda #6
        cmp thumpTime
        bcs resetThumpTime
        rts

resetThumpTime anop
        lda #6
        sta thumpTime

        rts


resetForNextWave entry

        dec interWaveTimer
        lda interWaveTimer
        bmi checkSaucers
        rts

checkSaucers anop

; wait for any saucers to finish

        jsr getSaucer
        tax
        lda lifetimeList,x
        cmp #0
        beq doWaveReset
        rts

doWaveReset anop

        lda #60
        sta interWaveTimer

        lda #30
        sta thumpDecTimer
        lda #30
        sta thumpTime
        lda #20
        sta thumpTimer
        lda #0
        sta thumpWhich

        inc numRocksToSpawn
        lda numRocksToSpawn
        cmp #8
        bcs limitRocksToSpawn
        bra respawnRocksAndPlayer

limitRocksToSpawn anop
        lda #8
        sta numRocksToSpawn

respawnRocksAndPlayer anop
        jsl spawnInitialRocks

        rts


isGameOver entry
        lda gameMode
        cmp #GAMEMODE_GAMEOVER
        beq yesGameOver
        lda #0
        rtl
yesGameOver anop
        lda #1
        rtl



startNewGame entry

        lda playerRespawnTimer
        bmi doStart
        dec playerRespawnTimer
        rtl

doStart anop

        jsl zeroScore

        lda #4
        sta numRocksToSpawn

        jsl stopAllRocks
        jsl spawnInitialRocks

        lda #500
        sta saucerSpawnTimer

        lda #GAMEMODE_PLAYING
        sta gameMode

        jsl spawnPlayer

        lda #3
        sta playerLives

        rtl



usePlayerLife entry

        dec playerLives
        lda playerLives
        bmi resetLivesToZero
        rtl

resetLivesToZero anop
        stz playerLives

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


GAMEMODE_GAMEOVER gequ 0
GAMEMODE_PLAYING gequ 1

gameMode dc i2'GAMEMODE_GAMEOVER'

playerLives dc i2'0'

playerRespawnTimer dc i2'0'

thumpDecTimer dc i2'30'
thumpTime dc i2'30'
thumpTimer dc i2'20'
thumpWhich dc i2'0'

interWaveTimer dc i2'60'


        end



