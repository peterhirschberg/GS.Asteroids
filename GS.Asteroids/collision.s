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
        stx missileIndex
        
; isPlayerMissile will be negative if it is a saucer missile
        lda #NUM_PLAYER_MISSILES
        sta isPlayerMissile
        dec isPlayerMissile

missileLoop anop

; check to see if this missile is active
        ldx missileIndex
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

        ldx missileIndex

        lda isPlayerMissile
        bmi checkAgainstPlayer
        jsl checkMissileAgainstSaucers
        jmp nextMissile
        
checkAgainstPlayer anop
        stx savex
        sty savey
        ldx missileIndex
        jsl checkMissileAgainstPlayer
        ldx savex
        ldy savey
        jmp nextMissile

; increment to the next missile and loop
nextMissile anop
        dec isPlayerMissile
        inc missileCounter
        lda missileCounter
        cmp #NUM_MISSILES
        beq missilesDone
        ldx missileIndex
        inx
        inx
        stx missileIndex
        jmp missileLoop

missilesDone anop

        rtl

        
        
        
checkMissileAgainstPlayer entry

        ldx #OBJECT_PLAYER

; check to see if the player is active
        lda lifetimeList,x
        cmp #0
        bne getPlayerPos1
        rtl

getPlayerPos1 anop
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
        
; hit test the missile point against the bounding box
        lda xMissilePos
        cmp playerRectLeft
        bcs continue1a
        rtl

continue1a anop
        lda playerRectRight
        cmp xMissilePos
        bcs continue2a
        rtl

continue2a anop

        lda yMissilePos
        cmp playerRectTop
        bcs continue3a
        rtl

continue3a anop
        lda playerRectBottom
        cmp yMissilePos
        bcs itsAHit3
        rtl

itsAHit3 anop

        stx savex
        sty savey
        jsl playExplode1Sound
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

        rtl
        


checkMissileAgainstSaucers entry

        jsr getSaucer
        tax

; check to see if the saucer is active
        lda lifetimeList,x
        cmp #0
        bne getSaucerPos1
        rtl

getSaucerPos1 anop
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

; hit test the missile point against the bounding box
        lda xMissilePos
        cmp saucerRectLeft
        bcs continue1b
        rtl

continue1b anop
        lda saucerRectRight
        cmp xMissilePos
        bcs continue2b
        rtl

continue2b anop

        lda yMissilePos
        cmp saucerRectTop
        bcs continue3b
        rtl

continue3b anop
        lda saucerRectBottom
        cmp yMissilePos
        bcs itsAHit4
        rtl

itsAHit4 anop

        stx savex
        sty savey
        jsl playExplode1Sound
        ldx savex
        ldy savey

; destroy the saucer
        jsr getSaucer
        tax
        lda #0
        sta lifetimeList,x

; throw some particles
        jsr getSaucer
        jsl startExplosion

; throw some wreckage
        jsr getSaucer
        jsl startWreckageExplosion

; add points (TODO: account for small saucer's points here)
        lda #200
        jsr addToScore

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
        
; see what type of rock we hit
        lda objectTypeList,y
        cmp #OBJECT_LARGE_ROCK
        beq largeRock
        jmp checkMediumRock
largeRock anop
        stx savex
        sty savey
        jsl playExplode1Sound
        ldx savex
        ldy savey
        lda #20
        sta tempScore
        jmp scoreDone
checkMediumRock anop
        cmp #OBJECT_MEDIUM_ROCK
        beq mediumRock
        jmp checkSmallRock
mediumRock anop
        stx savex
        sty savey
        jsl playExplode2Sound
        ldx savex
        ldy savey
        lda #50
        sta tempScore
        jmp scoreDone
checkSmallRock anop
        lda objectTypeList,y
        cmp #OBJECT_SMALL_ROCK
        beq smallRock
        jmp scoreDone
smallRock anop
        stx savex
        sty savey
        jsl playExplode3Sound
        ldx savex
        ldy savey
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

; play sound
        stx savex
        sty savey
        jsl playExplode1Sound
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



checkPlayerAgainstSaucers entry

        jsr getSaucer
        tay

; check to see if the saucer is active
        lda lifetimeList,y
        cmp #-1
        beq computeBoundingBox5
        rtl

computeBoundingBox5 anop
; compute the saucer bounding box
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
        sta xSaucerCenter

        lda yPosList,y
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta ySaucerCenter

        lda xSaucerCenter
        sec
        sbc size
        sta testRectLeft

        lda ySaucerCenter
        sec
        sbc size
        sta testRectTop

        lda xSaucerCenter
        clc
        adc size
        sta testRectRight

        lda ySaucerCenter
        clc
        adc size
        sta testRectBottom


; hit test the player rect against the saucer rect

; check playerRectLeft > testRectRight

        lda playerRectLeft
        cmp testRectRight
        bcs noIntersect5

; check playerRectRight < testRectLeft

        lda testRectLeft
        cmp playerRectRight
        bcs noIntersect5

; check playerRectTop > testRectBottom

        lda playerRectTop
        cmp testRectBottom
        bcs noIntersect5

; check playerRectBottom < testRectTop

        lda testRectTop
        cmp playerRectBottom
        bcs noIntersect5

        bra itsAHit5

noIntersect5 anop
        rtl

itsAHit5 anop

        stx savex
        sty savey
        jsl playExplode1Sound
        ldx savex
        ldy savey

; destroy the saucer
        jsr getSaucer
        tay
        lda #0
        sta lifetimeList,y

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
        jsr getSaucer
        jsl startWreckageExplosion

; set player respawn timer
        lda #100
        sta playerRespawnTimer

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
        jsl checkPlayerAgainstSaucers

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

        stx savex
        sty savey
        jsl playExplode1Sound
        ldx savex
        ldy savey

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
        




doAllCollisionChecks entry
        jsl collisionCheckMissiles
        jsl collisionCheckPlayer
        jsl collisionCheckSaucers
        rtl



        

missileCounter dc i2'0'
missileIndex dc i2'0'
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
xSaucerCenter dc i2'0'
ySaucerCenter dc i2'0'
tempScore dc i2'0'
isPlayerMissile dc i2'0'

savex dc i2'0'
savey dc i2'0'


        end
