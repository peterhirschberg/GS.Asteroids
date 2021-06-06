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
    
    
spawnSaucer entry

; check to see if there is already an active saucer
        ldx #OBJECT_LARGE_SAUCER1
        lda lifetimeList,x
        cmp #0
        beq doSpawn
        rtl

doSpawn anop

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

        dec directionTimer
        lda directionTimer
        bmi changeDirection
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
        rtl

goDown anop
        lda #SAUCER_SPEED
        sta ySpeedList,x
        rtl

goUp anop
        lda #-SAUCER_SPEED
        sta ySpeedList,x
        rtl


savex dc i2'0'

directionTimer dc i2'0'

SAUCER_SPEED gequ 100
        
        end
