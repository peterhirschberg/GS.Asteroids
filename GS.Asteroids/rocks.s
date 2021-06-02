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

spawnRocks entry

; TODO: this needs a lot of work - this is all just placeholder stuff

; top
        lda #OBJECT_LARGE_ROCK1
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

; bottom
        lda #OBJECT_LARGE_ROCK2
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

; right
        lda #OBJECT_LARGE_ROCK3
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

; left
        lda #OBJECT_LARGE_ROCK4
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


index dc i2'0'
count dc i2'0'
rockCounter dc i2'0'

        end
