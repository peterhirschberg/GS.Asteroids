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

shipSprites3 start
        using globalData
        using lineData

spritePlayerEraseAngle88 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-332
        tcd

        lda #$00
        sta 18
        sta 179

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-172
        tcd

        lda #$00
        sta 18
        sta 180

        lda >drawAddress
        clc
        adc #-12
        tcd

        lda #$00
        sta 18
        sta 180

        lda >drawAddress
        clc
        adc #148
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #308
        tcd

        lda #$00
        sta 19
        sta 179
        _spriteFooter
        rtl


spritePlayerOddAngle96 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-100
        tcd

        lda 21
        ora #$f0
        sta 21
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
        adc #60
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
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #215
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 179
        ora #$f0
        sta 179
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #372
        tcd

        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spritePlayerEvenAngle96 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-258
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #-98
        tcd

        lda 19
        ora #$f0
        sta 19
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
        adc #57
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
        adc #215
        tcd

        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spritePlayerEraseAngle96 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-258
        tcd

        lda #$00
        sta 21
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #-98
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #57
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #215
        tcd

        lda #$00
        sta 21
        _spriteFooter
        rtl


spritePlayerOddAngle104 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-355
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-195
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-35
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #125
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #200
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #302
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle104 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-303
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-143
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #17
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #177
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #251
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #354
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle104 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-303
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-143
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #17
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #177
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #251
        tcd

        lda #$00
        sta 18
        sta 179

        lda >drawAddress
        clc
        adc #354
        tcd

        lda #$00
        sta 20
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle112 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-431
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-289
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$0f
        sta 180
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-146
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
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #3
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle112 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-289
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-146
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180
        lda 179
        ora #$f0
        sta 179

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
        adc #145
        tcd

        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle112 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-289
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-146
        tcd

        lda #$00
        sta 19
        sta 180
        sta 179

        lda >drawAddress
        clc
        adc #-4
        tcd

        lda #$00
        sta 19
        sta 178
        sta 179
        sta 180

        lda >drawAddress
        clc
        adc #145
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle120 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-354
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-194
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-75
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #33
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #193
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
        adc #353
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle120 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-447
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-287
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-168
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-60
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #100
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #260
        tcd

        lda 18
        ora #$0f
        sta 18
        _spriteFooter
        rtl


spritePlayerEraseAngle120 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-447
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-287
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #-168
        tcd

        lda #$00
        sta 21
        sta 179

        lda >drawAddress
        clc
        adc #-60
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #100
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #260
        tcd

        lda #$00
        sta 18
        _spriteFooter
        rtl


spritePlayerOddAngle128 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-107
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
        adc #53
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
        adc #213
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #337
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


spritePlayerEvenAngle128 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-222
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
        adc #-62
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
        adc #98
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #221
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #337
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle128 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-222
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-62
        tcd

        lda #$00
        sta 20
        sta 181
        sta 180

        lda >drawAddress
        clc
        adc #98
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #221
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #337
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle136 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-323
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-163
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-57
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #69
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #196
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle136 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-197
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
        adc #-37
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #69
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #196
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #322
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spritePlayerEraseAngle136 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-197
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-37
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #69
        tcd

        lda #$00
        sta 18
        sta 179

        lda >drawAddress
        clc
        adc #196
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #322
        tcd

        lda #$00
        sta 20
        sta 179
        _spriteFooter
        rtl


spritePlayerOddAngle144 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-436
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-280
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-201
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-41
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #119
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 181
        ora #$0f
        sta 181
        _spriteFooter
        rtl


spritePlayerEvenAngle144 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-358
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-202
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #-122
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #38
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #198
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle144 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-358
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-202
        tcd

        lda #$00
        sta 19

        lda >drawAddress
        clc
        adc #-122
        tcd

        lda #$00
        sta 18
        sta 179

        lda >drawAddress
        clc
        adc #38
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #198
        tcd

        lda #$00
        sta 20
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle152 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-265
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-105
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #55
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #215
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


spritePlayerEvenAngle152 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-414
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-254
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-94
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #66
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


spritePlayerEraseAngle152 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-414
        tcd

        lda #$00
        sta 21
        sta 180

        lda >drawAddress
        clc
        adc #-254
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #-94
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #66
        tcd

        lda #$00
        sta 19
        sta 178
        sta 179
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle160 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-278
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-118
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #42
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #202
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #312
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #362
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179
        _spriteFooter
        rtl


spritePlayerEvenAngle160 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-313
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-153
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #7
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #167
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #277
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #327
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle160 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-313
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-153
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #7
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #167
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #277
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #327
        tcd

        lda #$00
        sta 19
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle168 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-296
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
        adc #-137
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #23
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #183
        tcd

        lda 18
        ora #$0f
        sta 18
        _spriteFooter
        rtl


spritePlayerEvenAngle168 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-136
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$0f
        sta 179
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #23
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #183
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #343
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle168 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-136
        tcd

        lda #$00
        sta 19
        sta 180
        sta 179
        sta 178

        lda >drawAddress
        clc
        adc #23
        tcd

        lda #$00
        sta 20

        lda >drawAddress
        clc
        adc #183
        tcd

        lda #$00
        sta 19
        sta 20
        sta 178

        lda >drawAddress
        clc
        adc #343
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle176 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-331
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-308
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #-171
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-11
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #149
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #309
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spritePlayerEvenAngle176 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-342
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-182
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-22
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #138
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #298
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle176 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-342
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-182
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-22
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #138
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #298
        tcd

        lda #$00
        sta 19
        sta 180
        _spriteFooter
        rtl


drawAddress dc i4'0'


        end
