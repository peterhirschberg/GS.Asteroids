;
;  saucers.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

saucers start
        using globalData
        using objectData
        using rockData
        using saucerData
        using scoreData
        using gameData



chooseNewSaucer entry

; if the player is hanging around on a level for a while give them the small saucer
        lda gameLevelTimer
        cmp #4000
        bcs chooseSmallSaucer

; above 30000 pts always get the small saucer
        lda playerScore
        cmp #30000
        bcs chooseSmallSaucer

; below 9000 pts always get the large saucer
        lda #9000
        cmp playerScore
        bcs chooseLargeSaucer

; randomly pick large or small
        lda #2
        pha
        jsl getRandom
        sta currentSaucer
        rtl

chooseLargeSaucer anop
        lda #0
        sta currentSaucer
        rtl

chooseSmallSaucer anop
        lda #1
        sta currentSaucer
        rtl



spawnSaucer entry
        
; check to see if there is already an active saucer
        jsr getSaucer
        tax
        lda lifetimeList,x
        cmp #0
        beq checkPlayer
        rtl

; check to see if the player is alive or not - don't spawn if the player is dead
; TODO - skip this check if we are in attract mode
checkPlayer anop

        ldx #OBJECT_PLAYER
        lda lifetimeList,x
        cmp #0
        beq playerDead2
        jmp notDead2

playerDead2 anop

        rtl

notDead2 anop
        
; if less than 10 medium/small rocks left, consider spawning a saucer
;checkRocks anop
;        lda #10
;        cmp numOtherRocks
;        bcs checklargeRocks
;        rtl

; only spawn a saucer if there are 1 or less large rocks
;checklargeRocks anop
;        lda #1
;        cmp numLargeRocks
;        bcs checkTimer
;        rtl
        
checkTimer anop
        dec saucerSpawnTimer
        lda saucerSpawnTimer
        bmi doSpawnSaucer
        rtl
        
doSpawnSaucer anop

        jsl chooseNewSaucer

        jsl startSaucerSound

        lda #1
        sta firstShot

        lda #500
        sta saucerSpawnTimer

        lda #20
        sta fireTimer

        lda #0
        sta directionTimer

        lda #2
        pha
        jsl getRandom
        
        cmp #0
        beq spawnFromLeft
        
; spawn from right
        jsr getSaucer
        tax

        lda #SCREEN_XMAX
        sta xPosList,x
        
        stx savex
        lda #SCREEN_YMAX
        pha
        jsl getRandom
        ldx savex
        sta yPosList,x
        
        lda #-SAUCER_SPEED
        sta xSpeedList,x
        
        lda #0
        sta ySpeedList,x
        
        lda #-1
        sta lifetimeList,x

        rtl
        
spawnFromLeft anop
        jsr getSaucer
        tax

        lda #0
        sta xPosList,x
    
        stx savex
        lda #SCREEN_YMAX
        pha
        jsl getRandom
        ldx savex
        sta yPosList,x

        lda #SAUCER_SPEED
        sta xSpeedList,x
        
        lda #0
        sta ySpeedList,x
        
        lda #-1
        sta lifetimeList,x
  
        rtl

    
runSaucers entry

        jsr getSaucer
        tax
        lda lifetimeList,x
        cmp #-1
        beq checkForFire
        rtl

checkForFire anop
        dec fireTimer
        bmi doFire
        jmp doDirectionTimer

; fire a missile
doFire anop

; ask for a saucer missile - accumulator will be -1 if none available
        jsr getAvailableSaucerMissile
        cmp #-1
        beq doDirectionTimerShortJump
        bra fireMissile

doDirectionTimerShortJump anop
        jmp doDirectionTimer

fireMissile anop
        sta missileIndex

        lda #30
        sta fireTimer

        stx savex
        jsl playFireSound
        ldx savex

; see if the player is alive or not

  jmp notDead1

        ldx #OBJECT_PLAYER
        lda lifetimeList,x
        cmp #0
        beq playerDead1
        jmp notDead1

playerDead1 anop

; shoot randomly
        lda #360
        pha
        jsl getRandom
        sta fireAngle
        jmp doneAiming

notDead1 anop

; if this is the first shot, aim randomly
        lda firstShot
        cmp #0
        beq notFirstShot

        lda #0
        sta firstShot

        lda #360
        pha
        jsl getRandom
        sta fireAngle
        jmp doneAiming

notFirstShot anop

; Aim at the player

        jsr getSaucer
        tax

        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta param1

        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta param2

        ldx #OBJECT_PLAYER

        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta param3

        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta param4

        jsr calcPointsAngle
        sta fireAngle

; Adjust the aim a bit for reduced accuracy
        jsr adjustAim

doneAiming anop

        lda #MISSILE_SPEED
        sta param1
        lda #0
        sta param2
        
        lda fireAngle
        sta param3
        
        jsl rotate

        ldx missileIndex

        lda result1
        asl a
        asl a
        sta xSpeedList,x
        
        lda result2
        asl a
        asl a
        sta ySpeedList,x
        
        jsr getSaucer
        tay

        lda xPosList,y
        sta xPosList,x

        lda yPosList,y
        sta yPosList,x

        lda #SAUCER_MISSILE_LIFETIME
        ldx missileIndex
        sta lifetimeList,x
        

; change directions
doDirectionTimer anop
        dec directionTimer
        lda directionTimer
        bmi doChangeDirection
        jmp offscreenCheck
        
doChangeDirection anop
        jsr changeDirection
        
offscreenCheck anop
; test to see if saucer has moved offscreen
        jsr getSaucer
        tax
        lda xSpeedList,x
        bmi goingLeft
        
        lda xPosList,x
        cmp #SAUCER_END_XMAX
        bcs killSaucer
        
        rtl
        
goingLeft anop
        lda #SAUCER_END_MIN
        cmp xPosList,x
        bcs killSaucer
        rtl
        
killSaucer anop

        lda #0
        sta lifetimeList,x

        jsl stopSaucerSound

        rtl
        
        
changeDirection anop

        jsr getSaucer
        tax

        lda #50
        sta directionTimer
        
        lda ySpeedList,x
        cmp #0
        bne goStraight
        
        stx savex
        lda #3
        pha
        jsl getRandom
        ldx savex

        cmp #1
        beq goDown
        
        cmp #2
        beq goUp

goStraight anop
        lda #0
        sta ySpeedList,x
        rts

goDown anop
        lda #SAUCER_SPEED
        sta ySpeedList,x
        rts

goUp anop
        lda #-SAUCER_SPEED
        sta ySpeedList,x
        rts


adjustAim entry

        jsr isSmallSaucer
        cmp #1
        beq smallSaucerAim

        lda #40
        pha
        jsl getRandom
        sec
        sbc #20
        sta fireAngleAdjust

        lda fireAngle
        clc
        adc fireAngleAdjust
        sta fireAngle

        bmi wrapAim
        rts

smallSaucerAim anop

        lda #20
        pha
        jsl getRandom
        sec
        sbc #10
        sta fireAngleAdjust

        lda fireAngle
        clc
        adc fireAngleAdjust
        sta fireAngle

        bmi wrapAim
        rts


wrapAim anop

        lda fireAngle
        clc
        adc #360
        sta fireAngle
        rts


getSaucer entry

        lda currentSaucer
        cmp #0
        beq getLargeSaucer
        lda #OBJECT_SMALL_SAUCER1
        rts

getLargeSaucer anop
        lda #OBJECT_LARGE_SAUCER1
        rts


isSmallSaucer entry
        lda currentSaucer
        rts

currentSaucer dc i2'0'

savex dc i2'0'

directionTimer dc i2'0'
fireTimer dc i2'0'
fireAngle dc i2'0'
fireAngleAdjust dc i2'0'
missileIndex dc i2'0'

firstShot dc i2'0'

saucerX dc i2'0'
saucerY dc i2'0'

playerX dc i2'0'
playerY dc i2'0'

SAUCER_SPEED gequ 100

SAUCER_END_MIN gequ SAUCER_SPEED
SAUCER_END_XMAX gequ SCREEN_XMAX-SAUCER_SPEED

        end

saucerData data

saucerSpawnTimer dc i2'500'

        end
