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

saucerSprites start
        using globalData
        using lineData



; Saucers ---------------------------

spriteLargeSaucerOdd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 19
        ora #$f0
        sta 19
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
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 178
        ora #$0f
        sta 178
        lda 182
        ora #$f0
        sta 182

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 22
        ora #$f0
        sta 22
        lda 178
        ora #$f0
        sta 178
        lda 182
        ora #$0f
        sta 182

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 22
        ora #$0f
        sta 22
        lda 177
        ora #$0f
        sta 177
        lda 177
        ora #$0f
        sta 177
        lda 183
        ora #$f0
        sta 183
        lda 183
        ora #$f0
        sta 183
        lda 177
        ora #$0f
        sta 177
        lda 177
        ora #$0f
        sta 177
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
        ora #$0f
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
        lda 181
        ora #$0f
        sta 181
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$0f
        sta 182
        lda 183
        ora #$f0
        sta 183

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 16
        ora #$0f
        sta 16
        lda 17
        ora #$f0
        sta 17
        lda 23
        ora #$0f
        sta 23
        lda 24
        ora #$f0
        sta 24
        lda 16
        ora #$0f
        sta 16
        lda 17
        ora #$f0
        sta 17
        lda 176
        ora #$f0
        sta 176
        lda 184
        ora #$0f
        sta 184
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 15
        ora #$f0
        sta 15
        lda 15
        ora #$0f
        sta 15
        lda 25
        ora #$f0
        sta 25
        lda 25
        ora #$0f
        sta 25
        lda 15
        ora #$f0
        sta 15
        lda 15
        ora #$0f
        sta 15
        lda 186
        ora #$f0
        sta 186
        lda 185
        ora #$0f
        sta 185
        lda 174
        ora #$0f
        sta 174
        lda 174
        ora #$0f
        sta 174
        lda 186
        ora #$f0
        sta 186
        lda 186
        ora #$f0
        sta 186
        lda 185
        ora #$0f
        sta 185
        lda 185
        ora #$f0
        sta 185
        lda 184
        ora #$0f
        sta 184
        lda 184
        ora #$f0
        sta 184
        lda 183
        ora #$0f
        sta 183
        lda 183
        ora #$f0
        sta 183
        lda 182
        ora #$0f
        sta 182
        lda 182
        ora #$f0
        sta 182
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
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
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$f0
        sta 178
        lda 177
        ora #$0f
        sta 177
        lda 177
        ora #$f0
        sta 177
        lda 176
        ora #$0f
        sta 176
        lda 176
        ora #$f0
        sta 176
        lda 175
        ora #$0f
        sta 175
        lda 175
        ora #$f0
        sta 175
        lda 174
        ora #$0f
        sta 174
        lda 174
        ora #$0f
        sta 174

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 25
        ora #$f0
        sta 25
        lda 24
        ora #$0f
        sta 24
        lda 15
        ora #$0f
        sta 15
        lda 15
        ora #$f0
        sta 15
        lda 184
        ora #$f0
        sta 184
        lda 183
        ora #$0f
        sta 183
        lda 176
        ora #$0f
        sta 176
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
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
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$f0
        sta 17
        _spriteFooter
        rtl


spriteLargeSaucerEven entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18
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
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 178
        ora #$f0
        sta 178
        lda 181
        ora #$0f
        sta 181

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 21
        ora #$0f
        sta 21
        lda 177
        ora #$0f
        sta 177
        lda 182
        ora #$f0
        sta 182

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 22
        ora #$f0
        sta 22
        lda 177
        ora #$f0
        sta 177
        lda 177
        ora #$f0
        sta 177
        lda 182
        ora #$0f
        sta 182
        lda 182
        ora #$0f
        sta 182
        lda 177
        ora #$f0
        sta 177
        lda 177
        ora #$f0
        sta 177
        lda 177
        ora #$0f
        sta 177
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
        ora #$0f
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
        lda 181
        ora #$0f
        sta 181
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$0f
        sta 182

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 175
        ora #$0f
        sta 175
        lda 184
        ora #$f0
        sta 184
        lda 175
        ora #$0f
        sta 175

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 14
        ora #$0f
        sta 14
        lda 15
        ora #$f0
        sta 15
        lda 24
        ora #$0f
        sta 24
        lda 25
        ora #$f0
        sta 25
        lda 14
        ora #$0f
        sta 14
        lda 15
        ora #$f0
        sta 15
        lda 185
        ora #$0f
        sta 185
        lda 185
        ora #$f0
        sta 185
        lda 174
        ora #$f0
        sta 174
        lda 174
        ora #$f0
        sta 174
        lda 185
        ora #$0f
        sta 185
        lda 185
        ora #$0f
        sta 185
        lda 185
        ora #$f0
        sta 185
        lda 184
        ora #$0f
        sta 184
        lda 184
        ora #$f0
        sta 184
        lda 183
        ora #$0f
        sta 183
        lda 183
        ora #$f0
        sta 183
        lda 182
        ora #$0f
        sta 182
        lda 182
        ora #$f0
        sta 182
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
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
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$f0
        sta 178
        lda 177
        ora #$0f
        sta 177
        lda 177
        ora #$f0
        sta 177
        lda 176
        ora #$0f
        sta 176
        lda 176
        ora #$f0
        sta 176
        lda 175
        ora #$0f
        sta 175
        lda 175
        ora #$f0
        sta 175
        lda 174
        ora #$0f
        sta 174
        lda 174
        ora #$f0
        sta 174
        lda 174
        ora #$f0
        sta 174

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 24
        ora #$0f
        sta 24
        lda 24
        ora #$f0
        sta 24
        lda 15
        ora #$f0
        sta 15
        lda 14
        ora #$0f
        sta 14
        lda 183
        ora #$0f
        sta 183
        lda 183
        ora #$f0
        sta 183
        lda 176
        ora #$f0
        sta 176
        lda 175
        ora #$0f
        sta 175

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
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
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 16
        ora #$0f
        sta 16
        _spriteFooter
        rtl


spriteLargeSaucerErase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 18
        sta 19
        sta 20
        sta 21
        sta 178
        sta 181

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 18
        sta 21
        sta 177
        sta 182

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 17
        sta 22
        sta 177
        sta 182
        sta 177
        sta 178
        sta 179
        sta 180
        sta 181
        sta 182

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 16
        sta 23
        sta 16
        sta 175
        sta 184
        sta 175

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 14
        sta 15
        sta 24
        sta 25
        sta 14
        sta 15
        sta 185
        sta 174
        sta 185
        sta 184
        sta 183
        sta 182
        sta 181
        sta 180
        sta 179
        sta 178
        sta 177
        sta 176
        sta 175
        sta 174

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 24
        sta 15
        sta 14
        sta 183
        sta 176
        sta 175

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 22
        sta 21
        sta 20
        sta 19
        sta 18
        sta 17
        sta 16
        _spriteFooter
        rtl


spriteSmallSaucerOdd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 179
        ora #$f0
        sta 179
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$f0
        sta 19
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
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 178
        ora #$f0
        sta 178
        lda 178
        ora #$0f
        sta 178
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$0f
        sta 182
        lda 178
        ora #$f0
        sta 178
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
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
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 182
        ora #$f0
        sta 182
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
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
        lda 179
        ora #$f0
        sta 179
        lda 178
        ora #$0f
        sta 178
        _spriteFooter
        rtl


spriteSmallSaucerEven entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 19
        ora #$f0
        sta 19
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
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 178
        ora #$0f
        sta 178
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18
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
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 177
        ora #$0f
        sta 177
        lda 178
        ora #$f0
        sta 178
        lda 181
        ora #$0f
        sta 181
        lda 182
        ora #$f0
        sta 182
        lda 177
        ora #$0f
        sta 177
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
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
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
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
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$f0
        sta 178
        _spriteFooter
        rtl


spriteSmallSaucerErase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 19
        sta 20
        sta 178
        sta 180

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 18
        sta 21
        sta 18
        sta 19
        sta 20
        sta 21
        sta 177
        sta 178
        sta 181
        sta 182
        sta 177
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22
        sta 17
        sta 22
        sta 21
        sta 20
        sta 19
        sta 18
        sta 17
        sta 181
        sta 180
        sta 179
        sta 178
        _spriteFooter
        rtl




drawAddress dc i4'0'


        end
