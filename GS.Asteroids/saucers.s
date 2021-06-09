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

    
spawnSaucer entry
        
; check to see if there is already an active saucer
        ldx #OBJECT_LARGE_SAUCER1
        lda lifetimeList,x
        cmp #0
        beq checkTimer
        rtl
        
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
        dec spawnTimer
        lda spawnTimer
        bmi doSpawnSaucer
        rtl
        
doSpawnSaucer anop
        lda #500
        sta spawnTimer
        jsl spawnSaucer

doSpawn anop

        lda #30
        sta fireTimer

        lda #0
        sta directionTimer

        lda #2
        pha
        jsl getRandom
        
        cmp #0
        beq spawnFromLeft
        
; spawn from right
        ldx #OBJECT_LARGE_SAUCER1
        
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
        ldx #OBJECT_LARGE_SAUCER1
    
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

        ldx #OBJECT_LARGE_SAUCER1
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

; ask for a player missile - accumulator will be -1 if none available
        jsr getAvailableSaucerMissile
        cmp #-1
        beq doDirectionTimer
        
        sta missileIndex

        lda #40
        sta fireTimer

;        lda #360
;        pha
;        jsl getRandom
;        sta fireAngle
        jsr calcFireAngle
        
        lda #0
        sta param1
        lda #MISSILE_SPEED
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
        
        ldy #OBJECT_LARGE_SAUCER1
        
        lda xPosList,y
        sta xPosList,x
        
        lda yPosList,y
        sta yPosList,x
        
        lda #MISSILE_LIFETIME
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
        ldx #OBJECT_LARGE_SAUCER1
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
        
        rtl
        
        
changeDirection anop

        ldx #OBJECT_LARGE_SAUCER1

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

        
        
calcFireAngle entry

        ldx #OBJECT_LARGE_SAUCER1

        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta saucerX
        
        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta saucerY
        
        ldx #OBJECT_PLAYER

        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta playerX
        
        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta playerY

; get quadrant
        lda saucerX
        cmp playerX
        bcs leftHalf
        
; right half
        lda saucerY
        cmp playerY
        bcs topRight
        
; lower right quadrant
        lda #315
        sta fireAngle
        rts

; upper right quadrant
topRight anop
        lda #225
        sta fireAngle
        rts

; left half
leftHalf anop
        lda playerY
        cmp saucerY
        bcs topLeft

; lower left quadrant
        lda #135
        sta fireAngle
        rts
        
; top left
topLeft anop
        lda #45
        sta fireAngle
        rts

        
        

savex dc i2'0'

directionTimer dc i2'0'
spawnTimer dc i2'500'
fireTimer dc i2'0'
fireAngle dc i2'0'
missileIndex dc i2'0'

saucerX dc i2'0'
saucerY dc i2'0'

playerX dc i2'0'
playerY dc i2'0'

SAUCER_SPEED gequ 100

SAUCER_END_MIN gequ SAUCER_SPEED
SAUCER_END_XMAX gequ SCREEN_XMAX-SAUCER_SPEED

        end
