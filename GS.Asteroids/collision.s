;
;  collision.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

collision start
        using globalData
        using objectData
        using gameData
        

collisionCheckMissiles entry

; go through each of missiles and check against the rocks

        lda #0
        sta missileCounter
        ldx #OBJECT_PLAYER_MISSILE1
        
        lda #NUM_PLAYER_MISSILES
        sta isPlayerMissile
        dec isPlayerMissile

missileLoop anop

; check to see if this missile is active
        lda lifetimeList,x
        cmp #0
        bne getMissilePos
        jmp nextMissile

getMissilePos anop
        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta xMissilePos
        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta yMissilePos

        jsl checkMissileAgainstRocks

; increment to the next missile and loop
nextMissile anop
        dec isPlayerMissile
        inc missileCounter
        lda missileCounter
        cmp #NUM_MISSILES
        beq missilesDone
        inx
        inx
        jmp missileLoop

missilesDone anop

        rtl

checkMissileAgainstRocks entry

        lda #0
        sta rockCounter
        ldy #OBJECT_LARGE_ROCK1

rockLoop anop

; check to see if this rock is active
        lda lifetimeList,y
        cmp #-1
        beq computeBoundingBox
        jmp rockNext

computeBoundingBox anop
; compute the bounding box
        lda sizeList,y
        lsr a
        sta size

        lda xPosList,y
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta xRockCenter

        lda yPosList,y
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta yRockCenter

        lda xRockCenter
        sec
        sbc size
        sta testRectLeft

        lda yRockCenter
        sec
        sbc size
        sta testRectTop

        lda xRockCenter
        clc
        adc size
        sta testRectRight

        lda yRockCenter
        clc
        adc size
        sta testRectBottom

; hit test the missile point against the bounding box
        lda xMissilePos
        cmp testRectLeft
        bcs continue1
        jmp rockNext

continue1 anop
        lda testRectRight
        cmp xMissilePos
        bcs continue2
        jmp rockNext

continue2 anop

        lda yMissilePos
        cmp testRectTop
        bcs continue3
        jmp rockNext

continue3 anop
        lda testRectBottom
        cmp yMissilePos
        bcs itsAHit
        jmp rockNext

itsAHit anop

; break down the rock
        stx savex
        sty savey
        tya
        jsl destroyRock
        ldx savex
        ldy savey

; eliminate the missile
        lda #0
        sta lifetimeList,x

        lda isPlayerMissile
        bmi skipScore
        
; update the score
        lda #20
        sta tempScore

        lda objectTypeList,y
        cmp #OBJECT_MEDIUM_ROCK
        beq mediumRock
        jmp checkSmallRock
mediumRock anop
        lda #50
        sta tempScore
        jmp scoreDone
checkSmallRock anop
        lda objectTypeList,y
        cmp #OBJECT_SMALL_ROCK
        beq smallRock
        jmp scoreDone
smallRock anop
        lda #100
        sta tempScore
scoreDone anop
        stx savex
        sty savey
        lda tempScore
        jsr addToScore
        ldx savex
        ldy savey

skipScore anop
; throw some particles
        tya
        jsl startExplosion

; this missile is DONE. Stop checking.
        jmp rocksDone

; increment to the next rock and loop
rockNext anop
        inc rockCounter
        lda rockCounter
        cmp #NUM_ROCKS
        beq rocksDone
        iny
        iny
        jmp rockLoop

rocksDone anop
        rtl




checkPlayerAgainstRocks entry

        lda #0
        sta rockCounter
        ldy #OBJECT_LARGE_ROCK1

rockLoop1 anop

; check to see if this rock is active
        lda lifetimeList,y
        cmp #-1
        beq computeBoundingBox1
        jmp rockNext1

computeBoundingBox1 anop
; compute the rock bounding box
        lda sizeList,y
        lsr a
        sta size

        lda xPosList,y
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta xRockCenter

        lda yPosList,y
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta yRockCenter

        lda xRockCenter
        sec
        sbc size
        sta testRectLeft

        lda yRockCenter
        sec
        sbc size
        sta testRectTop

        lda xRockCenter
        clc
        adc size
        sta testRectRight

        lda yRockCenter
        clc
        adc size
        sta testRectBottom


; hit test the player rect against the rock rect

; check playerRectLeft > testRectRight

        lda playerRectLeft
        cmp testRectRight
        bcs noIntersect1

; check playerRectRight < testRectLeft

        lda testRectLeft
        cmp playerRectRight
        bcs noIntersect1

; check playerRectTop > testRectBottom

        lda playerRectTop
        cmp testRectBottom
        bcs noIntersect1

; check playerRectBottom < testRectTop

        lda testRectTop
        cmp playerRectBottom
        bcs noIntersect1

        bra itsAHit1

noIntersect1 anop
        jmp rockNext1

itsAHit1 anop
; break down the rock
        stx savex
        sty savey
        tya
        jsl destroyRock
        ldx savex
        ldy savey

; destroy the player ship and the thrust object
        lda #0
        ldx #OBJECT_PLAYER
        sta lifetimeList,x
        ldx #OBJECT_THRUST
        sta lifetimeList,x

; throw some particles
        lda #OBJECT_PLAYER
        jsl startExplosion

; throw some wreckage
        lda #OBJECT_PLAYER
        jsl startWreckageExplosion
        
; set player respawn timer
        lda #100
        sta playerRespawnTimer

; player was destroyed - bail
        jmp rocksDone1

; increment to the next rock and loop
rockNext1 anop
        inc rockCounter
        lda rockCounter
        cmp #NUM_ROCKS
        beq rocksDone1
        iny
        iny
        jmp rockLoop1

rocksDone1 anop

        rtl




collisionCheckPlayer entry

        ldx #OBJECT_PLAYER

; check to see if the player is active
        lda lifetimeList,x
        cmp #0
        bne getPlayerPos
        jmp done

getPlayerPos anop
        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta xPlayerPos
        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta yPlayerPos

        lda sizeList,x
        lsr a
        sta playerSize

        lda xPlayerPos
        sec
        sbc playerSize
        sta playerRectLeft

        lda yPlayerPos
        sec
        sbc playerSize
        sta playerRectTop

        lda xPlayerPos
        clc
        adc playerSize
        sta playerRectRight

        lda yPlayerPos
        clc
        adc playerSize
        sta playerRectBottom

        jsl checkPlayerAgainstRocks

done anop

        rtl


        
        
checkSaucerAgainstRocks entry

        lda #0
        sta rockCounter
        ldy #OBJECT_LARGE_ROCK1

rockLoop2 anop

; check to see if this rock is active
        lda lifetimeList,y
        cmp #-1
        beq computeBoundingBox2
        jmp rockNext2

computeBoundingBox2 anop
; compute the rock bounding box
        lda sizeList,y
        lsr a
        sta size

        lda xPosList,y
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta xRockCenter

        lda yPosList,y
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta yRockCenter

        lda xRockCenter
        sec
        sbc size
        sta testRectLeft

        lda yRockCenter
        sec
        sbc size
        sta testRectTop

        lda xRockCenter
        clc
        adc size
        sta testRectRight

        lda yRockCenter
        clc
        adc size
        sta testRectBottom


; hit test the saucer rect against the rock rect

; check saucerRectLeft > testRectRight

        lda saucerRectLeft
        cmp testRectRight
        bcs noIntersect2

; check saucerRectRight < testRectLeft

        lda testRectLeft
        cmp saucerRectRight
        bcs noIntersect2

; check saucerRectTop > testRectBottom

        lda saucerRectTop
        cmp testRectBottom
        bcs noIntersect2

; check saucerRectBottom < testRectTop

        lda testRectTop
        cmp saucerRectBottom
        bcs noIntersect2

        bra itsAHit2

noIntersect2 anop
        jmp rockNext2

itsAHit2 anop
; break down the rock
        stx savex
        sty savey
        tya
        jsl destroyRock
        ldx savex
        ldy savey

; destroy the saucer
        lda #0
        ldx #OBJECT_LARGE_SAUCER1
        sta lifetimeList,x

; throw some particles
        lda #OBJECT_LARGE_SAUCER1
        jsl startExplosion

; throw some wreckage
        lda #OBJECT_LARGE_SAUCER1
        jsl startWreckageExplosion

; saucer was destroyed - bail
        jmp rocksDone2

; increment to the next rock and loop
rockNext2 anop
        inc rockCounter
        lda rockCounter
        cmp #NUM_ROCKS
        beq rocksDone2
        iny
        iny
        jmp rockLoop2

rocksDone2 anop

        rtl
        
        
collisionCheckSaucers entry

        ldx #OBJECT_LARGE_SAUCER1

; check to see if the saucer is active
        lda lifetimeList,x
        cmp #0
        bne getSaucerPos
        jmp done1

getSaucerPos anop
        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta xSaucerPos
        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta ySaucerPos

        lda sizeList,x
        lsr a
        sta saucerSize

        lda xSaucerPos
        sec
        sbc saucerSize
        sta saucerRectLeft

        lda ySaucerPos
        sec
        sbc saucerSize
        sta saucerRectTop

        lda xSaucerPos
        clc
        adc saucerSize
        sta saucerRectRight

        lda ySaucerPos
        clc
        adc saucerSize
        sta saucerRectBottom

        jsl checkSaucerAgainstRocks

done1 anop

        rtl
        
        
        

missileCounter dc i2'0'
rockCounter dc i2'0'
xPlayerPos dc i2'0'
yPlayerPos dc i2'0'
playerSize dc i2'0'
xSaucerPos dc i2'0'
ySaucerPos dc i2'0'
saucerSize dc i2'0'
xMissilePos dc i2'0'
yMissilePos dc i2'0'
size dc i2'0'
testRectLeft dc i2'0'
testRectTop dc i2'0'
testRectRight dc i2'0'
testRectBottom dc i2'0'
playerRectLeft dc i2'0'
playerRectTop dc i2'0'
playerRectRight dc i2'0'
playerRectBottom dc i2'0'
saucerRectLeft dc i2'0'
saucerRectTop dc i2'0'
saucerRectRight dc i2'0'
saucerRectBottom dc i2'0'
xRockCenter dc i2'0'
yRockCenter dc i2'0'
tempScore dc i2'0'
isPlayerMissile dc i2'0'

savex dc i2'0'
savey dc i2'0'


        end
