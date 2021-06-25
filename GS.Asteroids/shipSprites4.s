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

shipSprites4 start
        using globalData
        using lineData

spritePlayerOddAngle264 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-336
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-302
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-176
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-16
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #144
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #304
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle264 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-353
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-319
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-193
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-33
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #127
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #287
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle264 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-353
        tcd

        lda #$00
        sta 18
        sta 179

        lda >drawAddress
        clc
        adc #-319
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-193
        tcd

        lda #$00
        sta 18
        sta 180

        lda >drawAddress
        clc
        adc #-33
        tcd

        lda #$00
        sta 18
        sta 180

        lda >drawAddress
        clc
        adc #127
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #287
        tcd

        lda #$00
        sta 19
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle272 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-76
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
        adc #79
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #235
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
        _spriteFooter
        rtl


spritePlayerEvenAngle272 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-231
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
        adc #-76
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #80
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$0f
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle272 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-231
        tcd

        lda #$00
        sta 21
        sta 20
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-76
        tcd

        lda #$00
        sta 21
        sta 180

        lda >drawAddress
        clc
        adc #80
        tcd

        lda #$00
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle280 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-358
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-198
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-38
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #122
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #197
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #294
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle280 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-295
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-135
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #25
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #185
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #259
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #357
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle280 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-295
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-135
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #25
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #185
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #259
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #357
        tcd

        lda #$00
        sta 20
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle288 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-440
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-292
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-132
        tcd

        lda 20
        ora #$0f
        sta 20
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
        adc #28
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle288 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-303
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-155
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #5
        tcd

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
        adc #165
        tcd

        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle288 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-303
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-155
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #5
        tcd

        lda #$00
        sta 20
        sta 178
        sta 179
        sta 180

        lda >drawAddress
        clc
        adc #165
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle296 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-349
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-189
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #-43
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #28
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #188
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #348
        tcd

        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spritePlayerEvenAngle296 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-451
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-291
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-145
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-74
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #86
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
        adc #246
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle296 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-451
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-291
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-145
        tcd

        lda #$00
        sta 21
        sta 180

        lda >drawAddress
        clc
        adc #-74
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #86
        tcd

        lda #$00
        sta 19
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #246
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle304 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-131
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
        adc #29
        tcd

        lda 18
        ora #$f0
        sta 18
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
        adc #189
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #344
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
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


spritePlayerEvenAngle304 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-238
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
        adc #-78
        tcd

        lda 18
        ora #$0f
        sta 18
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
        adc #82
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #237
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #344
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle304 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-238
        tcd

        lda #$00
        sta 18
        sta 179

        lda >drawAddress
        clc
        adc #-78
        tcd

        lda #$00
        sta 18
        sta 181
        sta 180

        lda >drawAddress
        clc
        adc #82
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #237
        tcd

        lda #$00
        sta 21
        sta 179

        lda >drawAddress
        clc
        adc #344
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle312 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-311
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
        adc #-151
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-10
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #150
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #310
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEvenAngle312 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-178
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-18
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #123
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #283
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #443
        tcd

        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle312 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-178
        tcd

        lda #$00
        sta 21
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-18
        tcd

        lda #$00
        sta 20
        sta 19
        sta 178

        lda >drawAddress
        clc
        adc #123
        tcd

        lda #$00
        sta 20
        sta 178

        lda >drawAddress
        clc
        adc #283
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #443
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle320 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-427
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
        adc #-260
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-100
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
        adc #60
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #220
        tcd

        lda 20
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spritePlayerEvenAngle320 entry
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
        adc #-290
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #-191
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #-31
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

        lda >drawAddress
        clc
        adc #129
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #289
        tcd

        lda 20
        ora #$f0
        sta 20
        _spriteFooter
        rtl


spritePlayerEraseAngle320 entry
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
        adc #-290
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-191
        tcd

        lda #$00
        sta 20
        sta 178

        lda >drawAddress
        clc
        adc #-31
        tcd

        lda #$00
        sta 20
        sta 178
        sta 179

        lda >drawAddress
        clc
        adc #129
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #289
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle328 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-247
        tcd

        lda 20
        ora #$0f
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
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #73
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #233
        tcd

        lda 18
        ora #$0f
        sta 18
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
        lda 181
        ora #$f0
        sta 181
        _spriteFooter
        rtl


spritePlayerEvenAngle328 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-400
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-240
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-80
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #80
        tcd

        lda 19
        ora #$0f
        sta 19
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
        lda 181
        ora #$f0
        sta 181
        _spriteFooter
        rtl


spritePlayerEraseAngle328 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-400
        tcd

        lda #$00
        sta 21
        sta 180

        lda >drawAddress
        clc
        adc #-240
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-80
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #80
        tcd

        lda #$00
        sta 19
        sta 179
        sta 180
        sta 181
        _spriteFooter
        rtl


spritePlayerOddAngle336 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-293
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-133
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #27
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #187
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #316
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #347
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 179
        ora #$0f
        sta 179
        _spriteFooter
        rtl


spritePlayerEvenAngle336 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-317
        tcd

        lda 19
        ora #$f0
        sta 19
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
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #3
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #163
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #292
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #323
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEraseAngle336 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-317
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-157
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #3
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #163
        tcd

        lda #$00
        sta 19
        sta 181

        lda >drawAddress
        clc
        adc #292
        tcd

        lda #$00
        sta 21
        sta 180

        lda >drawAddress
        clc
        adc #323
        tcd

        lda #$00
        sta 19
        sta 180
        _spriteFooter
        rtl


spritePlayerOddAngle344 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-319
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
        adc #-159
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #1
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
        adc #161
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEvenAngle344 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-159
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
        adc #1
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$0f
        sta 179

        lda >drawAddress
        clc
        adc #161
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
        adc #321
        tcd

        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle344 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-159
        tcd

        lda #$00
        sta 19
        sta 180
        sta 179
        sta 178

        lda >drawAddress
        clc
        adc #1
        tcd

        lda #$00
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #161
        tcd

        lda #$00
        sta 19
        sta 20
        sta 179

        lda >drawAddress
        clc
        adc #321
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle352 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-340
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-295
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #-180
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-20
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #140
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #300
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 180
        ora #$f0
        sta 180
        _spriteFooter
        rtl


spritePlayerEvenAngle352 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-362
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-317
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-202
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #-42
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 180
        ora #$f0
        sta 180

        lda >drawAddress
        clc
        adc #118
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #278
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spritePlayerEraseAngle352 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-362
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #-317
        tcd

        lda #$00
        sta 20
        sta 180

        lda >drawAddress
        clc
        adc #-202
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #-42
        tcd

        lda #$00
        sta 19
        sta 180

        lda >drawAddress
        clc
        adc #118
        tcd

        lda #$00
        sta 19
        sta 179

        lda >drawAddress
        clc
        adc #278
        tcd

        lda #$00
        sta 19
        sta 179
        _spriteFooter
        rtl


drawAddress dc i4'0'


        end
