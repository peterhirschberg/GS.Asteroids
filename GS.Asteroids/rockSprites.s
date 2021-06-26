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

rockSprites start
        using globalData
        using lineData


spriteLargeRock1Odd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 24
        ora #$f0
        sta 24
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 184
        ora #$0f
        sta 184
        lda 183
        ora #$0f
        sta 183
        lda 177
        ora #$0f
        sta 177
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 25
        ora #$f0
        sta 25
        lda 23
        ora #$f0
        sta 23
        lda 18
        ora #$f0
        sta 18
        lda 16
        ora #$f0
        sta 16
        lda 185
        ora #$0f
        sta 185
        lda 182
        ora #$0f
        sta 182
        lda 178
        ora #$0f
        sta 178
        lda 175
        ora #$0f
        sta 175

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 26
        ora #$f0
        sta 26
        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$f0
        sta 19
        lda 15
        ora #$f0
        sta 15
        lda 14
        ora #$0f
        sta 14
        lda 186
        ora #$0f
        sta 186
        lda 181
        ora #$0f
        sta 181
        lda 179
        ora #$0f
        sta 179
        lda 174
        ora #$f0
        sta 174

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20
        lda 13
        ora #$0f
        sta 13
        lda 187
        ora #$0f
        sta 187
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 173
        ora #$f0
        sta 173

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 28
        ora #$f0
        sta 28
        lda 28
        ora #$f0
        sta 28
        lda 12
        ora #$0f
        sta 12
        lda 12
        ora #$0f
        sta 12
        lda 187
        ora #$0f
        sta 187
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 27
        ora #$0f
        sta 27
        lda 12
        ora #$0f
        sta 12
        lda 187
        ora #$f0
        sta 187
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 12
        ora #$0f
        sta 12
        lda 186
        ora #$0f
        sta 186
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 12
        ora #$0f
        sta 12
        lda 186
        ora #$f0
        sta 186
        lda 186
        ora #$f0
        sta 186
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 12
        ora #$0f
        sta 12
        lda 186
        ora #$0f
        sta 186
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 12
        ora #$0f
        sta 12
        lda 187
        ora #$f0
        sta 187
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 27
        ora #$0f
        sta 27
        lda 12
        ora #$0f
        sta 12
        lda 187
        ora #$0f
        sta 187
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 28
        ora #$f0
        sta 28
        lda 12
        ora #$0f
        sta 12
        lda 188
        ora #$f0
        sta 188
        lda 188
        ora #$f0
        sta 188
        lda 172
        ora #$0f
        sta 172
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 27
        ora #$0f
        sta 27
        lda 13
        ora #$f0
        sta 13
        lda 13
        ora #$0f
        sta 13
        lda 186
        ora #$f0
        sta 186
        lda 186
        ora #$0f
        sta 186
        lda 174
        ora #$f0
        sta 174

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 25
        ora #$f0
        sta 25
        lda 25
        ora #$0f
        sta 25
        lda 14
        ora #$0f
        sta 14
        lda 15
        ora #$f0
        sta 15
        lda 184
        ora #$f0
        sta 184
        lda 184
        ora #$0f
        sta 184
        lda 175
        ora #$0f
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

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
        lda 182
        ora #$0f
        sta 182
        lda 177
        ora #$f0
        sta 177
        _spriteFooter
        rtl


spriteLargeRock1Even entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 16
        ora #$0f
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 184
        ora #$f0
        sta 184
        lda 183
        ora #$f0
        sta 183
        lda 177
        ora #$f0
        sta 177
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 24
        ora #$0f
        sta 24
        lda 22
        ora #$0f
        sta 22
        lda 17
        ora #$0f
        sta 17
        lda 15
        ora #$0f
        sta 15
        lda 185
        ora #$f0
        sta 185
        lda 182
        ora #$f0
        sta 182
        lda 178
        ora #$f0
        sta 178
        lda 175
        ora #$f0
        sta 175

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 25
        ora #$0f
        sta 25
        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18
        lda 14
        ora #$0f
        sta 14
        lda 14
        ora #$f0
        sta 14
        lda 186
        ora #$f0
        sta 186
        lda 181
        ora #$f0
        sta 181
        lda 179
        ora #$f0
        sta 179
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 20
        ora #$0f
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 13
        ora #$f0
        sta 13
        lda 187
        ora #$f0
        sta 187
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 27
        ora #$0f
        sta 27
        lda 27
        ora #$0f
        sta 27
        lda 12
        ora #$f0
        sta 12
        lda 12
        ora #$f0
        sta 12
        lda 187
        ora #$f0
        sta 187
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 12
        ora #$f0
        sta 12
        lda 186
        ora #$0f
        sta 186
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 12
        ora #$f0
        sta 12
        lda 186
        ora #$f0
        sta 186
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 26
        ora #$f0
        sta 26
        lda 12
        ora #$f0
        sta 12
        lda 185
        ora #$0f
        sta 185
        lda 185
        ora #$0f
        sta 185
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 26
        ora #$f0
        sta 26
        lda 12
        ora #$f0
        sta 12
        lda 186
        ora #$f0
        sta 186
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 12
        ora #$f0
        sta 12
        lda 186
        ora #$0f
        sta 186
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 12
        ora #$f0
        sta 12
        lda 187
        ora #$f0
        sta 187
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 27
        ora #$0f
        sta 27
        lda 12
        ora #$f0
        sta 12
        lda 187
        ora #$0f
        sta 187
        lda 187
        ora #$0f
        sta 187
        lda 172
        ora #$f0
        sta 172
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 27
        ora #$f0
        sta 27
        lda 12
        ora #$0f
        sta 12
        lda 13
        ora #$f0
        sta 13
        lda 185
        ora #$0f
        sta 185
        lda 186
        ora #$f0
        sta 186
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 24
        ora #$0f
        sta 24
        lda 25
        ora #$f0
        sta 25
        lda 14
        ora #$f0
        sta 14
        lda 14
        ora #$0f
        sta 14
        lda 183
        ora #$0f
        sta 183
        lda 184
        ora #$f0
        sta 184
        lda 175
        ora #$f0
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 23
        ora #$f0
        sta 23
        lda 15
        ora #$0f
        sta 15
        lda 16
        ora #$f0
        sta 16
        lda 176
        ora #$0f
        sta 176
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
        ora #$f0
        sta 182
        lda 176
        ora #$0f
        sta 176
        _spriteFooter
        rtl


spriteLargeRock1Erase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda #$00
        sta 23
        sta 16
        sta 184
        sta 183
        sta 177
        sta 176

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda #$00
        sta 24
        sta 22
        sta 17
        sta 15
        sta 185
        sta 182
        sta 178
        sta 175

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 25
        sta 21
        sta 18
        sta 14
        sta 186
        sta 181
        sta 179
        sta 173

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 26
        sta 20
        sta 19
        sta 13
        sta 187
        sta 180
        sta 172

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 27
        sta 12
        sta 187
        sta 172

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 27
        sta 12
        sta 186
        sta 172

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 26
        sta 12
        sta 186
        sta 172

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 26
        sta 12
        sta 185
        sta 172

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 26
        sta 12
        sta 186
        sta 172

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 26
        sta 12
        sta 186
        sta 172

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 27
        sta 12
        sta 187
        sta 172

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 27
        sta 12
        sta 187
        sta 172

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 26
        sta 27
        sta 12
        sta 13
        sta 185
        sta 186
        sta 173

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda #$00
        sta 24
        sta 25
        sta 14
        sta 183
        sta 184
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda #$00
        sta 22
        sta 23
        sta 15
        sta 16
        sta 176
        sta 177
        sta 178
        sta 179
        sta 180
        sta 181
        sta 182
        sta 176
        _spriteFooter
        rtl


spriteLargeRock2Odd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda 16
        ora #$0f
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
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
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 177
        ora #$f0
        sta 177
        lda 183
        ora #$f0
        sta 183
        lda 183
        ora #$0f
        sta 183

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 24
        ora #$f0
        sta 24
        lda 24
        ora #$0f
        sta 24
        lda 177
        ora #$0f
        sta 177
        lda 185
        ora #$f0
        sta 185
        lda 185
        ora #$0f
        sta 185

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 26
        ora #$f0
        sta 26
        lda 26
        ora #$0f
        sta 26
        lda 178
        ora #$f0
        sta 178
        lda 187
        ora #$f0
        sta 187
        lda 187
        ora #$0f
        sta 187

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 28
        ora #$f0
        sta 28
        lda 28
        ora #$f0
        sta 28
        lda 12
        ora #$0f
        sta 12
        lda 12
        ora #$0f
        sta 12
        lda 13
        ora #$f0
        sta 13
        lda 13
        ora #$0f
        sta 13
        lda 14
        ora #$f0
        sta 14
        lda 14
        ora #$0f
        sta 14
        lda 15
        ora #$f0
        sta 15
        lda 15
        ora #$0f
        sta 15
        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18
        lda 188
        ora #$f0
        sta 188
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 28
        ora #$f0
        sta 28
        lda 12
        ora #$0f
        sta 12
        lda 188
        ora #$f0
        sta 188
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 28
        ora #$f0
        sta 28
        lda 12
        ora #$0f
        sta 12
        lda 188
        ora #$f0
        sta 188
        lda 188
        ora #$f0
        sta 188
        lda 187
        ora #$0f
        sta 187
        lda 187
        ora #$f0
        sta 187
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 26
        ora #$f0
        sta 26
        lda 25
        ora #$0f
        sta 25
        lda 25
        ora #$f0
        sta 25
        lda 12
        ora #$0f
        sta 12
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
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 12
        ora #$0f
        sta 12
        lda 182
        ora #$0f
        sta 182
        lda 183
        ora #$f0
        sta 183
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 24
        ora #$f0
        sta 24
        lda 12
        ora #$0f
        sta 12
        lda 184
        ora #$0f
        sta 184
        lda 185
        ora #$f0
        sta 185
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 25
        ora #$0f
        sta 25
        lda 12
        ora #$0f
        sta 12
        lda 186
        ora #$f0
        sta 186
        lda 186
        ora #$0f
        sta 186
        lda 172
        ora #$0f
        sta 172
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 27
        ora #$0f
        sta 27
        lda 13
        ora #$f0
        sta 13
        lda 188
        ora #$f0
        sta 188
        lda 188
        ora #$f0
        sta 188
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 27
        ora #$0f
        sta 27
        lda 13
        ora #$0f
        sta 13
        lda 187
        ora #$f0
        sta 187
        lda 174
        ora #$f0
        sta 174

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 14
        ora #$0f
        sta 14
        lda 186
        ora #$f0
        sta 186
        lda 185
        ora #$0f
        sta 185
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$f0
        sta 182
        lda 181
        ora #$0f
        sta 181
        lda 175
        ora #$f0
        sta 175

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 25
        ora #$f0
        sta 25
        lda 22
        ora #$0f
        sta 22
        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 15
        ora #$0f
        sta 15
        lda 184
        ora #$0f
        sta 184
        lda 183
        ora #$f0
        sta 183
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$f0
        sta 179
        lda 175
        ora #$0f
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 23
        ora #$f0
        sta 23
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 16
        ora #$f0
        sta 16
        lda 183
        ora #$0f
        sta 183
        lda 183
        ora #$0f
        sta 183
        lda 177
        ora #$f0
        sta 177
        lda 176
        ora #$0f
        sta 176
        lda 176
        ora #$0f
        sta 176
        _spriteFooter
        rtl


spriteLargeRock2Even entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
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
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22
        lda 176
        ora #$0f
        sta 176
        lda 182
        ora #$0f
        sta 182
        lda 183
        ora #$f0
        sta 183

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 16
        ora #$0f
        sta 16
        lda 23
        ora #$0f
        sta 23
        lda 24
        ora #$f0
        sta 24
        lda 177
        ora #$f0
        sta 177
        lda 184
        ora #$0f
        sta 184
        lda 185
        ora #$f0
        sta 185

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 25
        ora #$0f
        sta 25
        lda 26
        ora #$f0
        sta 26
        lda 177
        ora #$0f
        sta 177
        lda 186
        ora #$0f
        sta 186
        lda 187
        ora #$f0
        sta 187

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 27
        ora #$0f
        sta 27
        lda 27
        ora #$0f
        sta 27
        lda 12
        ora #$f0
        sta 12
        lda 12
        ora #$f0
        sta 12
        lda 12
        ora #$0f
        sta 12
        lda 13
        ora #$f0
        sta 13
        lda 13
        ora #$0f
        sta 13
        lda 14
        ora #$f0
        sta 14
        lda 14
        ora #$0f
        sta 14
        lda 15
        ora #$f0
        sta 15
        lda 15
        ora #$0f
        sta 15
        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        lda 187
        ora #$0f
        sta 187
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 27
        ora #$0f
        sta 27
        lda 12
        ora #$f0
        sta 12
        lda 187
        ora #$0f
        sta 187
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 27
        ora #$0f
        sta 27
        lda 12
        ora #$f0
        sta 12
        lda 187
        ora #$0f
        sta 187
        lda 187
        ora #$0f
        sta 187
        lda 187
        ora #$f0
        sta 187
        lda 186
        ora #$0f
        sta 186
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 26
        ora #$f0
        sta 26
        lda 25
        ora #$0f
        sta 25
        lda 25
        ora #$f0
        sta 25
        lda 24
        ora #$0f
        sta 24
        lda 12
        ora #$f0
        sta 12
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
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 12
        ora #$f0
        sta 12
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$0f
        sta 182
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 12
        ora #$f0
        sta 12
        lda 184
        ora #$f0
        sta 184
        lda 184
        ora #$0f
        sta 184
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 25
        ora #$f0
        sta 25
        lda 12
        ora #$f0
        sta 12
        lda 185
        ora #$0f
        sta 185
        lda 186
        ora #$f0
        sta 186
        lda 172
        ora #$f0
        sta 172
        lda 172
        ora #$f0
        sta 172

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 27
        ora #$f0
        sta 27
        lda 12
        ora #$0f
        sta 12
        lda 187
        ora #$0f
        sta 187
        lda 187
        ora #$0f
        sta 187
        lda 173
        ora #$f0
        sta 173

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 13
        ora #$f0
        sta 13
        lda 186
        ora #$0f
        sta 186
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 26
        ora #$f0
        sta 26
        lda 14
        ora #$f0
        sta 14
        lda 185
        ora #$0f
        sta 185
        lda 185
        ora #$f0
        sta 185
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 174
        ora #$0f
        sta 174

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 24
        ora #$0f
        sta 24
        lda 22
        ora #$f0
        sta 22
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 15
        ora #$f0
        sta 15
        lda 184
        ora #$f0
        sta 184
        lda 182
        ora #$0f
        sta 182
        lda 179
        ora #$f0
        sta 179
        lda 178
        ora #$0f
        sta 178
        lda 175
        ora #$f0
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 23
        ora #$0f
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
        ora #$f0
        sta 17
        lda 15
        ora #$0f
        sta 15
        lda 183
        ora #$f0
        sta 183
        lda 183
        ora #$f0
        sta 183
        lda 176
        ora #$0f
        sta 176
        lda 176
        ora #$f0
        sta 176
        lda 176
        ora #$f0
        sta 176
        _spriteFooter
        rtl


spriteLargeRock2Erase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda #$00
        sta 16
        sta 17
        sta 18
        sta 19
        sta 20
        sta 21
        sta 22
        sta 176
        sta 182
        sta 183

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda #$00
        sta 16
        sta 23
        sta 24
        sta 177
        sta 184
        sta 185

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 17
        sta 25
        sta 26
        sta 177
        sta 186
        sta 187

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 18
        sta 27
        sta 12
        sta 13
        sta 14
        sta 15
        sta 16
        sta 17
        sta 18
        sta 187
        sta 172

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 27
        sta 12
        sta 187
        sta 172

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 27
        sta 12
        sta 187
        sta 186
        sta 172

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 26
        sta 25
        sta 24
        sta 12
        sta 184
        sta 183
        sta 182
        sta 172

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 22
        sta 21
        sta 12
        sta 182
        sta 172

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 23
        sta 12
        sta 184
        sta 172

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 25
        sta 12
        sta 185
        sta 186
        sta 172

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 26
        sta 27
        sta 12
        sta 187
        sta 173

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 27
        sta 13
        sta 186
        sta 173

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 26
        sta 14
        sta 185
        sta 181
        sta 174

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda #$00
        sta 24
        sta 22
        sta 20
        sta 19
        sta 15
        sta 184
        sta 182
        sta 179
        sta 178
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda #$00
        sta 23
        sta 22
        sta 18
        sta 17
        sta 15
        sta 183
        sta 176
        _spriteFooter
        rtl


spriteLargeRock3Odd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda 16
        ora #$0f
        sta 16
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
        lda 24
        ora #$f0
        sta 24
        lda 176
        ora #$f0
        sta 176
        lda 177
        ora #$0f
        sta 177
        lda 178
        ora #$f0
        sta 178
        lda 178
        ora #$0f
        sta 178
        lda 182
        ora #$0f
        sta 182
        lda 183
        ora #$f0
        sta 183
        lda 184
        ora #$0f
        sta 184

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 15
        ora #$0f
        sta 15
        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22
        lda 25
        ora #$f0
        sta 25
        lda 175
        ora #$f0
        sta 175
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 181
        ora #$f0
        sta 181
        lda 185
        ora #$0f
        sta 185

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 14
        ora #$0f
        sta 14
        lda 26
        ora #$f0
        sta 26
        lda 174
        ora #$0f
        sta 174
        lda 186
        ora #$0f
        sta 186

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 14
        ora #$f0
        sta 14
        lda 27
        ora #$f0
        sta 27
        lda 173
        ora #$0f
        sta 173
        lda 187
        ora #$0f
        sta 187
        lda 187
        ora #$0f
        sta 187

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 13
        ora #$f0
        sta 13
        lda 13
        ora #$f0
        sta 13
        lda 27
        ora #$f0
        sta 27
        lda 26
        ora #$0f
        sta 26
        lda 173
        ora #$f0
        sta 173
        lda 186
        ora #$f0
        sta 186
        lda 185
        ora #$0f
        sta 185

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 13
        ora #$0f
        sta 13
        lda 25
        ora #$f0
        sta 25
        lda 24
        ora #$0f
        sta 24
        lda 184
        ora #$f0
        sta 184
        lda 173
        ora #$0f
        sta 173
        lda 184
        ora #$f0
        sta 184

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 24
        ora #$0f
        sta 24
        lda 13
        ora #$0f
        sta 13
        lda 185
        ora #$f0
        sta 185
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 25
        ora #$0f
        sta 25
        lda 14
        ora #$f0
        sta 14
        lda 185
        ora #$0f
        sta 185
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

        lda 26
        ora #$f0
        sta 26
        lda 14
        ora #$f0
        sta 14
        lda 186
        ora #$0f
        sta 186
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 13
        ora #$0f
        sta 13
        lda 187
        ora #$0f
        sta 187
        lda 187
        ora #$0f
        sta 187
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 27
        ora #$f0
        sta 27
        lda 13
        ora #$0f
        sta 13
        lda 187
        ora #$f0
        sta 187
        lda 173
        ora #$f0
        sta 173

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 13
        ora #$f0
        sta 13
        lda 13
        ora #$f0
        sta 13
        lda 186
        ora #$f0
        sta 186
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 26
        ora #$f0
        sta 26
        lda 14
        ora #$f0
        sta 14
        lda 185
        ora #$0f
        sta 185
        lda 174
        ora #$0f
        sta 174

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 25
        ora #$f0
        sta 25
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 14
        ora #$0f
        sta 14
        lda 184
        ora #$0f
        sta 184
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
        lda 177
        ora #$0f
        sta 177
        lda 177
        ora #$f0
        sta 177
        lda 175
        ora #$f0
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 24
        ora #$0f
        sta 24
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
        lda 16
        ora #$0f
        sta 16
        lda 15
        ora #$0f
        sta 15
        lda 184
        ora #$f0
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
        lda 176
        ora #$f0
        sta 176
        lda 176
        ora #$f0
        sta 176
        _spriteFooter
        rtl


spriteLargeRock3Even entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda 16
        ora #$f0
        sta 16
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
        lda 23
        ora #$0f
        sta 23
        lda 175
        ora #$0f
        sta 175
        lda 177
        ora #$f0
        sta 177
        lda 177
        ora #$0f
        sta 177
        lda 178
        ora #$f0
        sta 178
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$0f
        sta 182
        lda 184
        ora #$f0
        sta 184

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 15
        ora #$f0
        sta 15
        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 24
        ora #$0f
        sta 24
        lda 174
        ora #$0f
        sta 174
        lda 179
        ora #$0f
        sta 179
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 185
        ora #$f0
        sta 185

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 14
        ora #$f0
        sta 14
        lda 25
        ora #$0f
        sta 25
        lda 174
        ora #$f0
        sta 174
        lda 186
        ora #$f0
        sta 186

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 13
        ora #$0f
        sta 13
        lda 26
        ora #$0f
        sta 26
        lda 173
        ora #$f0
        sta 173
        lda 187
        ora #$f0
        sta 187
        lda 187
        ora #$f0
        sta 187

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 12
        ora #$0f
        sta 12
        lda 12
        ora #$0f
        sta 12
        lda 26
        ora #$0f
        sta 26
        lda 26
        ora #$f0
        sta 26
        lda 172
        ora #$0f
        sta 172
        lda 185
        ora #$0f
        sta 185
        lda 185
        ora #$f0
        sta 185

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 13
        ora #$f0
        sta 13
        lda 24
        ora #$0f
        sta 24
        lda 24
        ora #$f0
        sta 24
        lda 183
        ora #$0f
        sta 183
        lda 173
        ora #$f0
        sta 173
        lda 183
        ora #$0f
        sta 183

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 13
        ora #$f0
        sta 13
        lda 184
        ora #$0f
        sta 184
        lda 173
        ora #$f0
        sta 173

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 25
        ora #$f0
        sta 25
        lda 13
        ora #$0f
        sta 13
        lda 185
        ora #$f0
        sta 185
        lda 173
        ora #$0f
        sta 173
        lda 173
        ora #$0f
        sta 173

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 25
        ora #$0f
        sta 25
        lda 13
        ora #$0f
        sta 13
        lda 186
        ora #$f0
        sta 186
        lda 173
        ora #$f0
        sta 173

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 13
        ora #$f0
        sta 13
        lda 187
        ora #$f0
        sta 187
        lda 187
        ora #$f0
        sta 187
        lda 173
        ora #$f0
        sta 173

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 26
        ora #$0f
        sta 26
        lda 13
        ora #$f0
        sta 13
        lda 186
        ora #$0f
        sta 186
        lda 172
        ora #$0f
        sta 172

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 26
        ora #$f0
        sta 26
        lda 12
        ora #$0f
        sta 12
        lda 12
        ora #$0f
        sta 12
        lda 185
        ora #$0f
        sta 185
        lda 173
        ora #$f0
        sta 173

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 25
        ora #$0f
        sta 25
        lda 13
        ora #$0f
        sta 13
        lda 185
        ora #$f0
        sta 185
        lda 174
        ora #$f0
        sta 174

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 24
        ora #$0f
        sta 24
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 14
        ora #$f0
        sta 14
        lda 184
        ora #$f0
        sta 184
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
        lda 177
        ora #$f0
        sta 177
        lda 176
        ora #$0f
        sta 176
        lda 174
        ora #$0f
        sta 174

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 24
        ora #$f0
        sta 24
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
        lda 16
        ora #$f0
        sta 16
        lda 15
        ora #$f0
        sta 15
        lda 183
        ora #$0f
        sta 183
        lda 183
        ora #$0f
        sta 183
        lda 183
        ora #$f0
        sta 183
        lda 182
        ora #$0f
        sta 182
        lda 175
        ora #$0f
        sta 175
        lda 175
        ora #$0f
        sta 175
        _spriteFooter
        rtl


spriteLargeRock3Erase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-2400
        tcd

        lda #$00
        sta 16
        sta 23
        sta 175
        sta 177
        sta 178
        sta 182
        sta 184

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda #$00
        sta 15
        sta 18
        sta 19
        sta 21
        sta 24
        sta 174
        sta 179
        sta 180
        sta 185

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 14
        sta 25
        sta 174
        sta 186

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 13
        sta 26
        sta 173
        sta 187

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 12
        sta 26
        sta 172
        sta 185

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 13
        sta 24
        sta 183
        sta 173
        sta 183

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 24
        sta 13
        sta 184
        sta 173

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 25
        sta 13
        sta 185
        sta 173

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 25
        sta 13
        sta 186
        sta 173

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 26
        sta 13
        sta 187
        sta 173

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 26
        sta 13
        sta 186
        sta 172

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 26
        sta 12
        sta 185
        sta 173

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 25
        sta 13
        sta 185
        sta 174

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda #$00
        sta 24
        sta 18
        sta 17
        sta 14
        sta 184
        sta 180
        sta 179
        sta 178
        sta 177
        sta 176
        sta 174

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda #$00
        sta 24
        sta 22
        sta 21
        sta 20
        sta 16
        sta 15
        sta 183
        sta 182
        sta 175
        _spriteFooter
        rtl


spriteMediumRock1Odd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18
        lda 182
        ora #$0f
        sta 182
        lda 181
        ora #$0f
        sta 181
        lda 179
        ora #$f0
        sta 179
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$0f
        sta 19
        lda 17
        ora #$0f
        sta 17
        lda 183
        ora #$0f
        sta 183
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$f0
        sta 180
        lda 177
        ora #$f0
        sta 177

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 24
        ora #$f0
        sta 24
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 16
        ora #$0f
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 183
        ora #$0f
        sta 183
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 16
        ora #$0f
        sta 16
        lda 183
        ora #$f0
        sta 183
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$f0
        sta 23
        lda 16
        ora #$0f
        sta 16
        lda 183
        ora #$0f
        sta 183
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 16
        ora #$0f
        sta 16
        lda 184
        ora #$f0
        sta 184
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 24
        ora #$f0
        sta 24
        lda 16
        ora #$0f
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 183
        ora #$f0
        sta 183
        lda 183
        ora #$0f
        sta 183
        lda 177
        ora #$f0
        sta 177
        lda 177
        ora #$0f
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 18
        ora #$f0
        sta 18
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
        lda 181
        ora #$0f
        sta 181
        lda 178
        ora #$0f
        sta 178
        _spriteFooter
        rtl


spriteMediumRock1Even entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 182
        ora #$f0
        sta 182
        lda 181
        ora #$f0
        sta 181
        lda 178
        ora #$0f
        sta 178
        lda 177
        ora #$0f
        sta 177

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$f0
        sta 19
        lda 17
        ora #$f0
        sta 17
        lda 183
        ora #$f0
        sta 183
        lda 180
        ora #$0f
        sta 180
        lda 179
        ora #$0f
        sta 179
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$f0
        sta 16
        lda 183
        ora #$f0
        sta 183
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 16
        ora #$f0
        sta 16
        lda 182
        ora #$0f
        sta 182
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 16
        ora #$f0
        sta 16
        lda 183
        ora #$f0
        sta 183
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 16
        ora #$f0
        sta 16
        lda 183
        ora #$0f
        sta 183
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$f0
        sta 16
        lda 182
        ora #$0f
        sta 182
        lda 183
        ora #$f0
        sta 183
        lda 176
        ora #$0f
        sta 176
        lda 177
        ora #$f0
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22
        lda 17
        ora #$0f
        sta 17
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
        ora #$f0
        sta 181
        lda 178
        ora #$f0
        sta 178
        _spriteFooter
        rtl


spriteMediumRock1Erase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda #$00
        sta 21
        sta 18
        sta 182
        sta 181
        sta 178
        sta 177

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 22
        sta 21
        sta 19
        sta 17
        sta 183
        sta 180
        sta 179
        sta 176

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 23
        sta 20
        sta 16
        sta 183
        sta 176

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 23
        sta 16
        sta 182
        sta 176

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22
        sta 16
        sta 183
        sta 176

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 23
        sta 16
        sta 183
        sta 176

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 23
        sta 16
        sta 182
        sta 183
        sta 176
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 21
        sta 22
        sta 17
        sta 178
        sta 179
        sta 180
        sta 181
        sta 178
        _spriteFooter
        rtl


spriteMediumRock2Odd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
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
        lda 21
        ora #$0f
        sta 21
        lda 179
        ora #$f0
        sta 179
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$0f
        sta 182

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 179
        ora #$0f
        sta 179
        lda 184
        ora #$f0
        sta 184
        lda 184
        ora #$f0
        sta 184
        lda 176
        ora #$0f
        sta 176
        lda 176
        ora #$0f
        sta 176
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

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 16
        ora #$0f
        sta 16
        lda 184
        ora #$f0
        sta 184
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 24
        ora #$f0
        sta 24
        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22
        lda 16
        ora #$0f
        sta 16
        lda 182
        ora #$f0
        sta 182
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22
        lda 16
        ora #$0f
        sta 16
        lda 182
        ora #$0f
        sta 182
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 16
        ora #$0f
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 184
        ora #$f0
        sta 184
        lda 184
        ora #$f0
        sta 184
        lda 177
        ora #$f0
        sta 177

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 17
        ora #$0f
        sta 17
        lda 183
        ora #$f0
        sta 183
        lda 181
        ora #$f0
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
        sta 180
        lda 177
        ora #$0f
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 18
        ora #$f0
        sta 18
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$f0
        sta 182
        lda 179
        ora #$f0
        sta 179
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$0f
        sta 178
        _spriteFooter
        rtl


spriteMediumRock2Even entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
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
        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 178
        ora #$0f
        sta 178
        lda 181
        ora #$0f
        sta 181
        lda 182
        ora #$f0
        sta 182

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 22
        ora #$0f
        sta 22
        lda 23
        ora #$f0
        sta 23
        lda 179
        ora #$f0
        sta 179
        lda 183
        ora #$0f
        sta 183
        lda 183
        ora #$0f
        sta 183
        lda 176
        ora #$f0
        sta 176
        lda 176
        ora #$f0
        sta 176
        lda 176
        ora #$0f
        sta 176
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

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 16
        ora #$f0
        sta 16
        lda 183
        ora #$0f
        sta 183
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$0f
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
        lda 16
        ora #$f0
        sta 16
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
        ora #$0f
        sta 180
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 16
        ora #$f0
        sta 16
        lda 182
        ora #$f0
        sta 182
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 23
        ora #$f0
        sta 23
        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$f0
        sta 16
        lda 183
        ora #$0f
        sta 183
        lda 183
        ora #$0f
        sta 183
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 17
        ora #$f0
        sta 17
        lda 182
        ora #$0f
        sta 182
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 177
        ora #$f0
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 17
        ora #$0f
        sta 17
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$f0
        sta 178
        lda 178
        ora #$f0
        sta 178
        _spriteFooter
        rtl


spriteMediumRock2Erase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda #$00
        sta 18
        sta 19
        sta 20
        sta 21
        sta 178
        sta 181
        sta 182

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 18
        sta 22
        sta 23
        sta 179
        sta 183
        sta 176
        sta 177
        sta 178
        sta 179

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 23
        sta 16
        sta 183
        sta 176

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 23
        sta 22
        sta 16
        sta 181
        sta 180
        sta 176

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 21
        sta 16
        sta 182
        sta 176

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 22
        sta 23
        sta 16
        sta 183
        sta 176

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 23
        sta 17
        sta 182
        sta 180
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 22
        sta 21
        sta 19
        sta 17
        sta 181
        sta 178
        _spriteFooter
        rtl


spriteMediumRock3Odd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
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
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 178
        ora #$f0
        sta 178
        lda 179
        ora #$0f
        sta 179
        lda 180
        ora #$f0
        sta 180
        lda 181
        ora #$f0
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 182
        ora #$0f
        sta 182

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 23
        ora #$f0
        sta 23
        lda 177
        ora #$f0
        sta 177
        lda 183
        ora #$0f
        sta 183

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 16
        ora #$0f
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 24
        ora #$f0
        sta 24
        lda 24
        ora #$f0
        sta 24
        lda 23
        ora #$0f
        sta 23
        lda 176
        ora #$0f
        sta 176
        lda 183
        ora #$f0
        sta 183
        lda 182
        ora #$0f
        sta 182

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 17
        ora #$f0
        sta 17
        lda 22
        ora #$f0
        sta 22
        lda 182
        ora #$0f
        sta 182
        lda 177
        ora #$f0
        sta 177

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 183
        ora #$0f
        sta 183
        lda 177
        ora #$f0
        sta 177

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 24
        ora #$f0
        sta 24
        lda 16
        ora #$0f
        sta 16
        lda 183
        ora #$0f
        sta 183
        lda 176
        ora #$0f
        sta 176
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 17
        ora #$f0
        sta 17
        lda 183
        ora #$f0
        sta 183
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$f0
        sta 179
        lda 177
        ora #$0f
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 18
        ora #$0f
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$f0
        sta 182
        lda 181
        ora #$0f
        sta 181
        lda 178
        ora #$f0
        sta 178
        lda 178
        ora #$f0
        sta 178
        _spriteFooter
        rtl


spriteMediumRock3Even entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 177
        ora #$0f
        sta 177
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$0f
        sta 179
        lda 180
        ora #$0f
        sta 180
        lda 181
        ora #$f0
        sta 181
        lda 182
        ora #$f0
        sta 182

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 22
        ora #$0f
        sta 22
        lda 176
        ora #$0f
        sta 176
        lda 183
        ora #$f0
        sta 183

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 16
        ora #$f0
        sta 16
        lda 16
        ora #$f0
        sta 16
        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$f0
        sta 23
        lda 176
        ora #$f0
        sta 176
        lda 182
        ora #$0f
        sta 182
        lda 182
        ora #$f0
        sta 182

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 16
        ora #$0f
        sta 16
        lda 21
        ora #$0f
        sta 21
        lda 182
        ora #$f0
        sta 182
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 16
        ora #$0f
        sta 16
        lda 16
        ora #$0f
        sta 16
        lda 183
        ora #$f0
        sta 183
        lda 176
        ora #$0f
        sta 176

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 16
        ora #$f0
        sta 16
        lda 183
        ora #$f0
        sta 183
        lda 176
        ora #$f0
        sta 176
        lda 176
        ora #$f0
        sta 176

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 16
        ora #$0f
        sta 16
        lda 182
        ora #$0f
        sta 182
        lda 179
        ora #$f0
        sta 179
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$0f
        sta 178
        lda 177
        ora #$f0
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$f0
        sta 17
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 177
        ora #$0f
        sta 177
        lda 177
        ora #$0f
        sta 177
        _spriteFooter
        rtl


spriteMediumRock3Erase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda #$00
        sta 18
        sta 21
        sta 177
        sta 179
        sta 180
        sta 181
        sta 182

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 17
        sta 20
        sta 22
        sta 176
        sta 183

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 16
        sta 23
        sta 176
        sta 182

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 16
        sta 21
        sta 182
        sta 176

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22
        sta 16
        sta 183
        sta 176

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 23
        sta 16
        sta 183
        sta 176

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 22
        sta 16
        sta 182
        sta 179
        sta 178
        sta 177

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 22
        sta 20
        sta 19
        sta 18
        sta 17
        sta 181
        sta 177
        _spriteFooter
        rtl


spriteSmallRock1Odd entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$f0
        sta 180
        lda 179
        ora #$f0
        sta 179

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18
        lda 181
        ora #$0f
        sta 181
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18
        lda 182
        ora #$f0
        sta 182
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19
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
        ora #$f0
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 179
        ora #$0f
        sta 179
        _spriteFooter
        rtl


spriteSmallRock1Even entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
        sta 180
        lda 179
        ora #$0f
        sta 179
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 181
        ora #$f0
        sta 181
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 18
        ora #$f0
        sta 18
        lda 181
        ora #$0f
        sta 181
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18
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
        lda 180
        ora #$0f
        sta 180
        lda 181
        ora #$f0
        sta 181
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spriteSmallRock1Erase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 20
        sta 19
        sta 181
        sta 180
        sta 179
        sta 178

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 20
        sta 18
        sta 181
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 21
        sta 18
        sta 181
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 21
        sta 18
        sta 179
        sta 180
        sta 181
        sta 179
        _spriteFooter
        rtl


spriteSmallRock2Odd entry
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
        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 180
        ora #$f0
        sta 180
        lda 181
        ora #$0f
        sta 181
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$f0
        sta 182
        lda 178
        ora #$0f
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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 18
        ora #$0f
        sta 18
        lda 182
        ora #$f0
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
        ora #$0f
        sta 180
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$f0
        sta 182
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$0f
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
        lda 19
        ora #$f0
        sta 19
        lda 181
        ora #$f0
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 179
        ora #$0f
        sta 179
        lda 179
        ora #$0f
        sta 179
        _spriteFooter
        rtl


spriteSmallRock2Even entry
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
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 179
        ora #$0f
        sta 179
        lda 181
        ora #$f0
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 178
        ora #$f0
        sta 178
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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$f0
        sta 18
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
        lda 180
        ora #$f0
        sta 180
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 18
        ora #$f0
        sta 18
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 178
        ora #$f0
        sta 178
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spriteSmallRock2Erase entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 19
        sta 20
        sta 179
        sta 181
        sta 178
        sta 179

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 18
        sta 181
        sta 180
        sta 178

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 20
        sta 21
        sta 18
        sta 181
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 21
        sta 20
        sta 19
        sta 18
        sta 180
        sta 179
        _spriteFooter
        rtl


spriteSmallRock3Odd entry
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
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 179
        ora #$f0
        sta 179
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 181
        ora #$0f
        sta 181

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
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
        lda 181
        ora #$f0
        sta 181
        lda 178
        ora #$0f
        sta 178
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18
        lda 182
        ora #$f0
        sta 182
        lda 182
        ora #$f0
        sta 182
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$0f
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$0f
        sta 21
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
        lda 181
        ora #$f0
        sta 181
        lda 181
        ora #$f0
        sta 181
        lda 180
        ora #$0f
        sta 180
        lda 179
        ora #$f0
        sta 179
        lda 179
        ora #$f0
        sta 179
        _spriteFooter
        rtl


spriteSmallRock3Even entry
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
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 178
        ora #$0f
        sta 178
        lda 180
        ora #$f0
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 181
        ora #$f0
        sta 181

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 180
        ora #$0f
        sta 180
        lda 178
        ora #$f0
        sta 178
        lda 180
        ora #$0f
        sta 180

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 181
        ora #$0f
        sta 181
        lda 181
        ora #$0f
        sta 181
        lda 178
        ora #$f0
        sta 178
        lda 178
        ora #$f0
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$0f
        sta 180
        lda 180
        ora #$f0
        sta 180
        lda 178
        ora #$0f
        sta 178
        lda 178
        ora #$0f
        sta 178
        _spriteFooter
        rtl


spriteSmallRock3Erase entry
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
        sta 181

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 18
        sta 21
        sta 180
        sta 178
        sta 180

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 21
        sta 18
        sta 181
        sta 178

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 21
        sta 19
        sta 18
        sta 180
        sta 178
        _spriteFooter
        rtl



drawAddress dc i4'0'


        end
