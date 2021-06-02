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

collisionCheck entry

; go through each of player missiles and check against the rocks
; start with the first player missile

        lda #0
        sta missileCounter
        ldx #OBJECT_PLAYER_MISSILE1

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
        inc missileCounter
        lda missileCounter
        cmp #NUM_PLAYER_MISSILES
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
; eliminate the rock and the missile
        lda #0
        sta lifetimeList,y
        sta lifetimeList,x

; throw some particles
        tya
        jsl startExplosion

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


missileCounter dc i2'0'
rockCounter dc i2'0'
xMissilePos dc i2'0'
yMissilePos dc i2'0'
size dc i2'0'
testRectLeft dc i2'0'
testRectTop dc i2'0'
testRectRight dc i2'0'
testRectBottom dc i2'0'
xRockCenter dc i2'0'
yRockCenter dc i2'0'

savex dc i2'0'
savey dc i2'0'


        end
