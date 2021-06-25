;
;  rockSprites.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 6/24/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global

shipSprites2 start
        using globalData
        using lineData


spritePlayerOddAngle184 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-88
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #72
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #225
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #381
        tcd

        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spritePlayerEvenAngle184 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-244
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-84
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #68
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #225
        tcd

        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle184 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-244
        tcd

        lda #$00
        sta 21
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-84
        tcd

        lda #$00
        sta 20
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #68
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #225
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle192 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-356
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-196
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-36
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #124
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #195
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #299
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle192 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-300
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-140
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #20
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #180
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #252
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #355
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle192 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-300
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-140
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #20
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #180
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #252
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #355
        tcd

        lda #$00
        sta 20
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-436
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-296
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-144
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 178
        ora #$f0
        sta 178
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$f0
        sta 179
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #16
        tcd

        lda 21
        ora #$f0
        sta 21
        _spriteFooter
        rtl


spritePlayerEvenAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-296
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-156
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #-5
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$f0
        sta 19
        lda 178
        ora #$f0
        sta 178
        lda 178
        ora #$0f
        sta 178
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$f0
        sta 179
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #155
        tcd

        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-296
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-156
        tcd

        lda #$00
        sta 19
        sta 178

        lda >drawAddress
        clc
        adc #-5
        tcd

        lda #$00
        sta 20
        sta 19
        sta 178
        sta 179
        sta 180

        lda >drawAddress
        clc
        adc #155
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle208 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-352
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-192
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-59
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #31
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #191
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$0f
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #351
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle208 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-449
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-289
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-157
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-67
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #93
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #253
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle208 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-449
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #-289
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-157
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-67
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #93
        tcd

        lda #$00
        sta 19
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #253
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle216 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-119
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #41
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #201
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #341
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #452
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle216 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-230
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-70
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #90
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #229
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #341
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle216 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-230
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-70
        tcd

        lda #$00
        sta 20
        sta 181
        sta 180

        lda >drawAddress
        clc
        adc #90
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #229
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #341
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle224 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-317
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-157
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #-4
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #156
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #316
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEvenAngle224 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-187
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-27
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #126
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #286
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #446
        tcd

        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle224 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-187
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-27
        tcd

        lda #$00
        sta 19
        sta 178

        lda >drawAddress
        clc
        adc #126
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #286
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #446
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle232 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-432
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-358
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-270
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-110
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #50
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #210
        tcd

        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle232 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-358
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-285
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-196
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #-36
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #124
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #284
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle232 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-358
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-285
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-196
        tcd

        lda #$00
        sta 20
        sta 178

        lda >drawAddress
        clc
        adc #-36
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #124
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #284
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle240 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-256
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-96
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #64
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #224
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 178
        ora #$0f
        sta 178
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$f0
        sta 179
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle240 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-407
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-247
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-87
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #73
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$f0
        sta 179
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 181
        ora #$f0
        sta 181
        _spriteFooter
        rtl


spritePlayerEraseAngle240 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-407
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #-247
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-87
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #73
        tcd

        lda #$00
        sta 19
        sta 179
        sta 180
        sta 181
        _spriteFooter
        rtl


spritePlayerOddAngle248 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-285
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-125
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #35
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #195
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #314
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #355
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 178
        ora #$0f
        sta 178
        _spriteFooter
        rtl


spritePlayerEvenAngle248 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-315
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-155
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #5
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #165
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #284
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #325
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spritePlayerEraseAngle248 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-315
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-155
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #5
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #165
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #284
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #325
        tcd

        lda #$00
        sta 19
        sta 179
        _spriteFooter
        rtl


spritePlayerOddAngle256 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-308
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 181
        ora #$0f
        sta 181
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-148
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #12
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #172
        tcd

        lda 18
        ora #$0f
        sta 18
        _spriteFooter
        rtl


spritePlayerEvenAngle256 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-148
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 181
        ora #$0f
        sta 181
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #12
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #172
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #332
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle256 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-148
        tcd

        lda #$00
        sta 18
        sta 181
        sta 180
        sta 179

        lda >drawAddress
        clc
        adc #12
        tcd

        lda #$00
        sta 21
        sta 178

        lda >drawAddress
        clc
        adc #172
        tcd

        lda #$00
        sta 20
        sta 178

        lda >drawAddress
        clc
        adc #332
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl





drawAddress dc i4'0'


        end
