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


        rtl

index dc i2'0'

        end
