;
;  rocks.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

rocks start
        using globalData
        using objectData

getRandSpeed entry
        lda #180
        pha
        jsl getRandom
        sec
        sbc #90
        bmi isNeg
        clc
        adc #30
        rtl
isNeg anop
        sec
        sbc #30
        rtl


getLargeRock entry
        lda #0
        sta rockCounter
        ldy #OBJECT_LARGE_ROCK1

rockLoop1 anop

; check to see if this rock is active
        lda lifetimeList,y
        cmp #-1
        bne rockIsAvailable1
        jmp rockNext1

rockIsAvailable1 anop
        tya
        rts

rockNext1 anop
        inc rockCounter
        lda rockCounter
        cmp #NUM_LARGE_ROCKS
        beq rocksDone1
        iny
        iny
        jmp rockLoop1

rocksDone1 anop
        lda #-1
        rts


getMediumRock entry
        lda #0
        sta rockCounter
        ldy #OBJECT_MEDIUM_ROCK1

rockLoop2 anop

; check to see if this rock is active
        lda lifetimeList,y
        cmp #-1
        bne rockIsAvailable2
        jmp rockNext2

rockIsAvailable2 anop
        tya
        rts

rockNext2 anop
        inc rockCounter
        lda rockCounter
        cmp #NUM_MEDIUM_ROCKS
        beq rocksDone2
        iny
        iny
        jmp rockLoop2

rocksDone2 anop
        lda #-1
        rts


getSmallRock entry
        lda #0
        sta rockCounter
        ldy #OBJECT_SMALL_ROCK1

rockLoop3 anop

; check to see if this rock is active
        lda lifetimeList,y
        cmp #-1
        bne rockIsAvailable3
        jmp rockNext3

rockIsAvailable3 anop
        tya
        rts

rockNext3 anop
        inc rockCounter
        lda rockCounter
        cmp #NUM_SMALL_ROCKS
        beq rocksDone3
        iny
        iny
        jmp rockLoop3

rocksDone3 anop
        lda #-1
        rts



spawnRockTop entry
        jsr getLargeRock
        sta index
        lda #SCREEN_XMAX
        pha
        jsl getRandom
        ldx index
        sta xPosList,x
        lda #0
        sta yPosList,x
        jsl getRandSpeed
        ldx index
        sta xSpeedList,x
        jsl getRandSpeed
        ldx index
        sta ySpeedList,x
; set the lifetime to infinity
        lda #-1
        sta lifetimeList,x
        rts

spawnRockBottom entry
        jsr getLargeRock
        sta index
        lda #SCREEN_XMAX
        pha
        jsl getRandom
        ldx index
        sta xPosList,x
        lda #SCREEN_YMAX
        sta yPosList,x
        jsl getRandSpeed
        ldx index
        sta xSpeedList,x
        jsl getRandSpeed
        ldx index
        sta ySpeedList,x
; set the lifetime to infinity
        lda #-1
        sta lifetimeList,x
        rts

spawnRockLeft entry
        jsr getLargeRock
        sta index
        lda #0
        ldx index
        sta xPosList,x
        lda #SCREEN_YMAX
        pha
        jsl getRandom
        ldx index
        sta yPosList,x
        jsl getRandSpeed
        ldx index
        sta xSpeedList,x
        jsl getRandSpeed
        ldx index
        sta ySpeedList,x
; set the lifetime to infinity
        lda #-1
        sta lifetimeList,x
        rts

spawnRockRight entry
        jsr getLargeRock
        sta index
        lda #SCREEN_XMAX
        ldx index
        sta xPosList,x
        lda #SCREEN_YMAX
        pha
        jsl getRandom
        ldx index
        sta yPosList,x
        jsl getRandSpeed
        ldx index
        sta xSpeedList,x
        jsl getRandSpeed
        ldx index
        sta ySpeedList,x
; set the lifetime to infinity
        lda #-1
        sta lifetimeList,x
        rts



spawnInitialRocks entry

        lda numToSpawn
        sta count

spawnLoop anop

        lda #4
        pha
        jsl getRandom
        cmp #0
        beq spawnLeft
        cmp #1
        beq spawnTop
        cmp #2
        beq spawnRight
        cmp #3
        beq spawnBottom

spawnLeft anop
        jsr spawnRockLeft
        jmp spawnNext

spawnTop anop
        jsr spawnRockTop
        jmp spawnNext

spawnRight anop
        jsr spawnRockRight
        jmp spawnNext

spawnBottom anop
        jsr spawnRockBottom

spawnNext anop
        dec count
        lda count
        cmp #0
        beq spawnDone
        jmp spawnLoop

spawnDone anop

        rtl



destroyRock entry

        tax

        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta xOrigin

        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta yOrigin

        lda #0
        sta lifetimeList,x

        lda objectTypeList,x
        cmp #OBJECT_LARGE_ROCK
        beq destroyLargeRock
        cmp #OBJECT_MEDIUM_ROCK
        beq destroyMediumRock
        jmp destroySmallRock

destroyLargeRock anop

        jsr getMediumRock

        sta newRockIndex
        tay

        lda xOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta xPosList,y

        lda yOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta yPosList,y

        jsl getRandSpeed
        ldy newRockIndex
        sta xSpeedList,y
        jsl getRandSpeed
        ldy newRockIndex
        sta ySpeedList,y
; set the lifetime to infinity
        lda #-1
        sta lifetimeList,y


        jsr getMediumRock

        sta newRockIndex
        tay

        lda xOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta xPosList,y

        lda yOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta yPosList,y

        jsl getRandSpeed
        ldy newRockIndex
        sta xSpeedList,y
        jsl getRandSpeed
        ldy newRockIndex
        sta ySpeedList,y
; set the lifetime to infinity
        lda #-1
        sta lifetimeList,y

        rtl

destroyMediumRock anop

        jsr getSmallRock

        sta newRockIndex
        tay

        lda xOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta xPosList,y

        lda yOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta yPosList,y

        jsl getRandSpeed
        ldy newRockIndex
        sta xSpeedList,y
        jsl getRandSpeed
        ldy newRockIndex
        sta ySpeedList,y
; set the lifetime to infinity
        lda #-1
        sta lifetimeList,y

        jsr getSmallRock

        sta newRockIndex
        tay

        lda xOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta xPosList,y

        lda yOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta yPosList,y

        jsl getRandSpeed
        ldy newRockIndex
        sta xSpeedList,y
        jsl getRandSpeed
        ldy newRockIndex
        sta ySpeedList,y
; set the lifetime to infinity
        lda #-1
        sta lifetimeList,y


        rtl

destroySmallRock anop

        lda #0
        sta lifetimeList,y

        rtl


numActiveRocks entry

        lda #0
        sta count
        sta rockCounter
        ldy #OBJECT_LARGE_ROCK1

rockLoop anop

; check to see if this rock is active
        lda lifetimeList,y
        cmp #-1
        beq rockIsActive
        jmp rockNext

rockIsActive anop
        inc count

rockNext anop
        inc rockCounter
        lda rockCounter
        cmp #NUM_ROCKS
        beq rocksDone
        iny
        iny
        jmp rockLoop

rocksDone anop
        lda count

        rtl


savex dc i2'0'
savey dc i2'0'

index dc i2'0'
count dc i2'0'
rockCounter dc i2'0'

numToSpawn dc i2'4'

xOrigin dc i2'0'
yOrigin dc i2'0'

newRockIndex dc i2'0'

        end
