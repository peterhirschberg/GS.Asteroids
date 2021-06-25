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

shipSprites1 start
        using globalData
        using lineData


spritePlayerOddAngle0 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 20
        ora #$f0
        sta 20
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
        adc #320
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle0 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle0 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 19
        sta 20
        sta 19
        sta 179
        sta 180

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 19
        sta 20
        sta 179
        sta 180

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle8 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-112
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
        adc #48
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
        adc #204
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #363
        tcd

        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle8 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-271
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
        adc #-111
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
        adc #46
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
        adc #204
        tcd

        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle8 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-271
        tcd

        lda #$00
        sta 21
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #-111
        tcd

        lda #$00
        sta 179

        lda >drawAddress
        clc
        adc #46
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #204
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle16 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-353
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-193
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-33
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #127
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #214
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #306
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spritePlayerEvenAngle16 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-307
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-147
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #13
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #173
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #260
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #352
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle16 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-307
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-147
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #13
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #173
        tcd

        lda #$00
        sta 18
        sta 180

        lda >drawAddress
        clc
        adc #260
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #352
        tcd

        lda #$00
        sta 19
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle24 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-426
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-281
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
        adc #-136
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #9
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spritePlayerEvenAngle24 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-281
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-136
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
        adc #9
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #154
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle24 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-281
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-136
        tcd

        lda #$00
        sta 19
        sta 180
        sta 179

        lda >drawAddress
        clc
        adc #9
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #154
        tcd

        lda #$00
        sta 18
        sta 19
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle32 entry
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
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-196
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-91
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #35
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #195
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
        adc #355
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle32 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-444
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-284
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-179
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-54
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #106
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #266
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle32 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-444
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-284
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-179
        tcd

        lda #$00
        sta 21
        sta 179

        lda >drawAddress
        clc
        adc #-54
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #106
        tcd

        lda #$00
        sta 19
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #266
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-95
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
        adc #65
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

        lda 21
        ora #$0f
        sta 21
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #332
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #451
        tcd

        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spritePlayerEvenAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-214
        tcd

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
        adc #-54
        tcd

        lda 19
        ora #$f0
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
        adc #94
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #213
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #332
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-214
        tcd

        lda #$00
        sta 18
        sta 179

        lda >drawAddress
        clc
        adc #-54
        tcd

        lda #$00
        sta 19
        sta 181
        sta 180

        lda >drawAddress
        clc
        adc #94
        tcd

        lda #$00
        sta 21
        sta 179

        lda >drawAddress
        clc
        adc #213
        tcd

        lda #$00
        sta 21
        sta 179

        lda >drawAddress
        clc
        adc #332
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle48 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-328
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-168
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-41
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #81
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #204
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spritePlayerEvenAngle48 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-205
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
        adc #-45
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
        adc #81
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #204
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #327
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spritePlayerEraseAngle48 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-205
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-45
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #81
        tcd

        lda #$00
        sta 18
        sta 179

        lda >drawAddress
        clc
        adc #204
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #327
        tcd

        lda #$00
        sta 19
        sta 179
        _spriteFooter
        rtl


spritePlayerOddAngle56 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-440
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-291
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-190
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-30
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #130
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$0f
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle56 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-357
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-207
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-107
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #53
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #213
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle56 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-357
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-207
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #-107
        tcd

        lda #$00
        sta 18
        sta 180

        lda >drawAddress
        clc
        adc #53
        tcd

        lda #$00
        sta 18
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #213
        tcd

        lda #$00
        sta 19
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle64 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-273
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-113
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #47
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #207
        tcd

        lda 20
        ora #$f0
        sta 20
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


spritePlayerEvenAngle64 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-420
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-260
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-100
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #60
        tcd

        lda 19
        ora #$f0
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


spritePlayerEraseAngle64 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-420
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #-260
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-100
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #60
        tcd

        lda #$00
        sta 19
        sta 179
        sta 180
        sta 181
        _spriteFooter
        rtl


spritePlayerOddAngle72 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-269
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-109
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #51
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #211
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #309
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #371
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179
        _spriteFooter
        rtl


spritePlayerEvenAngle72 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-310
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-150
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #10
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #170
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #268
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #330
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spritePlayerEraseAngle72 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-310
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-150
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #10
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #170
        tcd

        lda #$00
        sta 20
        sta 181

        lda >drawAddress
        clc
        adc #268
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #330
        tcd

        lda #$00
        sta 20
        sta 179
        _spriteFooter
        rtl


spritePlayerOddAngle80 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-283
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
        adc #-126
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #34
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #194
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEvenAngle80 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-124
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
        adc #33
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #193
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #353
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle80 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-124
        tcd

        lda #$00
        sta 19
        sta 180
        sta 179
        sta 178

        lda >drawAddress
        clc
        adc #33
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #193
        tcd

        lda #$00
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #353
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle88 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-326
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-315
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-166
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-6
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #154
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #314
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle88 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-332
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-172
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-12
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #148
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #308
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl







drawAddress dc i4'0'


        end
