;
;  prerendered.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 6/20/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;


        case on
        mcopy global.macros
        keep global

prerendered start
        using globalData
        using objectData
        using prerenderData
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
        lda #$00
        sta 23
        lda #$00
        sta 16
        lda #$00
        sta 16
        lda #$00
        sta 184
        lda #$00
        sta 183
        lda #$00
        sta 177
        lda #$00
        sta 176

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda #$00
        sta 24
        lda #$00
        sta 22
        lda #$00
        sta 17
        lda #$00
        sta 15
        lda #$00
        sta 185
        lda #$00
        sta 182
        lda #$00
        sta 178
        lda #$00
        sta 175

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 25
        lda #$00
        sta 21
        lda #$00
        sta 18
        lda #$00
        sta 14
        lda #$00
        sta 14
        lda #$00
        sta 186
        lda #$00
        sta 181
        lda #$00
        sta 179
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 20
        lda #$00
        sta 19
        lda #$00
        sta 13
        lda #$00
        sta 187
        lda #$00
        sta 180
        lda #$00
        sta 180
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 27
        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 12
        lda #$00
        sta 187
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 186
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 12
        lda #$00
        sta 186
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 12
        lda #$00
        sta 185
        lda #$00
        sta 185
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 12
        lda #$00
        sta 186
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 12
        lda #$00
        sta 186
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 187
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 187
        lda #$00
        sta 187
        lda #$00
        sta 172
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 13
        lda #$00
        sta 185
        lda #$00
        sta 186
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda #$00
        sta 24
        lda #$00
        sta 25
        lda #$00
        sta 14
        lda #$00
        sta 14
        lda #$00
        sta 183
        lda #$00
        sta 184
        lda #$00
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda #$00
        sta 22
        lda #$00
        sta 23
        lda #$00
        sta 15
        lda #$00
        sta 16
        lda #$00
        sta 176
        lda #$00
        sta 177
        lda #$00
        sta 177
        lda #$00
        sta 178
        lda #$00
        sta 178
        lda #$00
        sta 179
        lda #$00
        sta 179
        lda #$00
        sta 180
        lda #$00
        sta 180
        lda #$00
        sta 181
        lda #$00
        sta 181
        lda #$00
        sta 182
        lda #$00
        sta 182
        lda #$00
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
        lda #$00
        sta 16
        lda #$00
        sta 16
        lda #$00
        sta 17
        lda #$00
        sta 17
        lda #$00
        sta 18
        lda #$00
        sta 18
        lda #$00
        sta 19
        lda #$00
        sta 19
        lda #$00
        sta 20
        lda #$00
        sta 20
        lda #$00
        sta 21
        lda #$00
        sta 21
        lda #$00
        sta 21
        lda #$00
        sta 22
        lda #$00
        sta 176
        lda #$00
        sta 182
        lda #$00
        sta 183

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda #$00
        sta 16
        lda #$00
        sta 23
        lda #$00
        sta 24
        lda #$00
        sta 177
        lda #$00
        sta 184
        lda #$00
        sta 185

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 17
        lda #$00
        sta 25
        lda #$00
        sta 26
        lda #$00
        sta 177
        lda #$00
        sta 186
        lda #$00
        sta 187

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 18
        lda #$00
        sta 27
        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 12
        lda #$00
        sta 12
        lda #$00
        sta 13
        lda #$00
        sta 13
        lda #$00
        sta 14
        lda #$00
        sta 14
        lda #$00
        sta 15
        lda #$00
        sta 15
        lda #$00
        sta 16
        lda #$00
        sta 16
        lda #$00
        sta 17
        lda #$00
        sta 17
        lda #$00
        sta 18
        lda #$00
        sta 187
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 187
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 187
        lda #$00
        sta 187
        lda #$00
        sta 187
        lda #$00
        sta 186
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 25
        lda #$00
        sta 25
        lda #$00
        sta 24
        lda #$00
        sta 12
        lda #$00
        sta 184
        lda #$00
        sta 183
        lda #$00
        sta 183
        lda #$00
        sta 182
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 22
        lda #$00
        sta 21
        lda #$00
        sta 21
        lda #$00
        sta 12
        lda #$00
        sta 182
        lda #$00
        sta 182
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 23
        lda #$00
        sta 23
        lda #$00
        sta 12
        lda #$00
        sta 184
        lda #$00
        sta 184
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 25
        lda #$00
        sta 12
        lda #$00
        sta 185
        lda #$00
        sta 186
        lda #$00
        sta 172
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 27
        lda #$00
        sta 12
        lda #$00
        sta 187
        lda #$00
        sta 187
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 27
        lda #$00
        sta 13
        lda #$00
        sta 186
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 14
        lda #$00
        sta 185
        lda #$00
        sta 185
        lda #$00
        sta 181
        lda #$00
        sta 181
        lda #$00
        sta 181
        lda #$00
        sta 174

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda #$00
        sta 24
        lda #$00
        sta 22
        lda #$00
        sta 20
        lda #$00
        sta 20
        lda #$00
        sta 19
        lda #$00
        sta 15
        lda #$00
        sta 184
        lda #$00
        sta 182
        lda #$00
        sta 179
        lda #$00
        sta 178
        lda #$00
        sta 175

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda #$00
        sta 23
        lda #$00
        sta 22
        lda #$00
        sta 18
        lda #$00
        sta 17
        lda #$00
        sta 17
        lda #$00
        sta 15
        lda #$00
        sta 183
        lda #$00
        sta 183
        lda #$00
        sta 176
        lda #$00
        sta 176
        lda #$00
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
        lda #$00
        sta 16
        lda #$00
        sta 16
        lda #$00
        sta 23
        lda #$00
        sta 23
        lda #$00
        sta 23
        lda #$00
        sta 175
        lda #$00
        sta 177
        lda #$00
        sta 177
        lda #$00
        sta 178
        lda #$00
        sta 182
        lda #$00
        sta 182
        lda #$00
        sta 184

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda #$00
        sta 15
        lda #$00
        sta 18
        lda #$00
        sta 19
        lda #$00
        sta 21
        lda #$00
        sta 21
        lda #$00
        sta 24
        lda #$00
        sta 174
        lda #$00
        sta 179
        lda #$00
        sta 180
        lda #$00
        sta 180
        lda #$00
        sta 180
        lda #$00
        sta 185

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 14
        lda #$00
        sta 25
        lda #$00
        sta 174
        lda #$00
        sta 186

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 13
        lda #$00
        sta 26
        lda #$00
        sta 173
        lda #$00
        sta 187
        lda #$00
        sta 187

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 12
        lda #$00
        sta 12
        lda #$00
        sta 26
        lda #$00
        sta 26
        lda #$00
        sta 172
        lda #$00
        sta 185
        lda #$00
        sta 185

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 13
        lda #$00
        sta 24
        lda #$00
        sta 24
        lda #$00
        sta 183
        lda #$00
        sta 173
        lda #$00
        sta 183

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 24
        lda #$00
        sta 13
        lda #$00
        sta 184
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 25
        lda #$00
        sta 13
        lda #$00
        sta 185
        lda #$00
        sta 173
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 25
        lda #$00
        sta 13
        lda #$00
        sta 186
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 13
        lda #$00
        sta 187
        lda #$00
        sta 187
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 13
        lda #$00
        sta 186
        lda #$00
        sta 172

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 26
        lda #$00
        sta 12
        lda #$00
        sta 12
        lda #$00
        sta 185
        lda #$00
        sta 173

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 25
        lda #$00
        sta 13
        lda #$00
        sta 185
        lda #$00
        sta 174

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda #$00
        sta 24
        lda #$00
        sta 18
        lda #$00
        sta 17
        lda #$00
        sta 17
        lda #$00
        sta 14
        lda #$00
        sta 184
        lda #$00
        sta 180
        lda #$00
        sta 179
        lda #$00
        sta 179
        lda #$00
        sta 178
        lda #$00
        sta 177
        lda #$00
        sta 176
        lda #$00
        sta 174

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda #$00
        sta 24
        lda #$00
        sta 22
        lda #$00
        sta 21
        lda #$00
        sta 21
        lda #$00
        sta 20
        lda #$00
        sta 16
        lda #$00
        sta 15
        lda #$00
        sta 183
        lda #$00
        sta 183
        lda #$00
        sta 183
        lda #$00
        sta 182
        lda #$00
        sta 175
        lda #$00
        sta 175
        _spriteFooter
        rtl



prLargeRock1DrawEven entry
        spriteGetDrawAddress

; enable direct page
        _spriteHeader

        lda >drawAddress
        tcd

        lda #$f0
        sta 0
        sta 1
        sta 164
        sta 165

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$f0
        sta 4
        sta 5
        sta 168
        sta 169

; exit direct page



        _spriteFooter

        rtl

nothing entry
        clc
        adc >SCREEN_ADDR
        sta drawAddress
        ldx #-2244
        lda drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -2243
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -2237
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -2236
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1925
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1922
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1918
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1915
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1766
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1601
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1599
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1594
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1447
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1280
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1280
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1273
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1128
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -1128
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -968
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -953
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -808
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -793
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -648
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -488
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -328
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -314
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -168
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -154
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx -8
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 152
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 166
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 312
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 326
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 472
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 632
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 792
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 807
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 952
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 967
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1112
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1272
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1272
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1433
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1447
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1606
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1754
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1765
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1915
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 1924
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2076
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2083
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2237
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2238
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2239
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2240
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2241
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2242
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        ldx 2242
        lda >drawAddress,x
        ora #$f0
        sta >drawAddress,x
        rtl


prerenderObject entry

        sta objectOffset
        asl a
        tax
        lda prerenderPixelData,x
        sta pixelCount

        lda #1
        sta counter

        inc objectOffset

        lda drawY
        asl a
        tax
        lda screenRowOffsets,x
        sta drawAddress
        lda drawX
        lsr a
        clc
        adc drawAddress
        sta drawAddress

loop1 anop

        lda objectOffset
        asl a
        tax

        lda prerenderEvenOddData,x
        sta evenOdd

        lda prerenderPixelData,x
        clc
        adc drawAddress
        tax

        lda evenOdd
        and #1
        cmp #1
        beq odd1

; even
        pixelLeft
        bra next1
odd1 anop
        pixelRight
next1 anop
        inc objectOffset
        inc counter
        lda counter
        cmp pixelCount
        beq done1
        jmp loop1

done1 anop
        rtl


prerenderTranslucentObject entry

        sta objectOffset
        asl a
        tax
        lda prerenderPixelData,x
        sta pixelCount

        lda #1
        sta counter

        inc objectOffset

        lda drawY
        asl a
        tax
        lda screenRowOffsets,x
        sta drawAddress
        lda drawX
        lsr a
        clc
        adc drawAddress
        sta drawAddress

loop2 anop

        lda objectOffset
        asl a
        tax

        lda prerenderEvenOddData,x
        sta evenOdd

        lda prerenderPixelData,x
        clc
        adc drawAddress
        tax

        lda evenOdd
        and #1
        cmp #1
        beq odd2

; even
        pixelLeftTranslucent
        bra next2
odd2 anop
        pixelRightTranslucent
next2 anop
        inc objectOffset
        inc counter
        lda counter
        cmp pixelCount
        beq done2
        jmp loop2

done2 anop
        rtl


prerenderEraseObject entry

        sta objectOffset
        asl a
        tax
        lda prerenderPixelData,x
        sta pixelCount

        lda #1
        sta counter

        inc objectOffset

        lda drawY
        asl a
        tax
        lda screenRowOffsets,x
        sta drawAddress
        lda drawX
        lsr a
        clc
        adc drawAddress
        sta drawAddress

loop3 anop

        lda objectOffset
        asl a
        tax

        lda prerenderEvenOddData,x
        sta evenOdd

        lda prerenderPixelData,x
        clc
        adc drawAddress
        tax

        lda #$00
        sta >SCREEN_ADDR,x

        inc objectOffset
        inc counter
        lda counter
        cmp pixelCount
        beq done3
        jmp loop3

done3 anop
        rtl


drawAddress dc i4'0'
evenOdd dc i4'0'
counter dc i2'0'
pixelCount dc i2'0'
objectOffset dc i2'0'
tempColor dc i2'0'

SCREEN gequ $2000

        end

prerenderData data

prerenderPixelData anop
; large rock 1
        dc i2'102'
        dc i2'2236'
        dc i2'2237'
        dc i2'2237'
        dc i2'2238'
        dc i2'2238'
        dc i2'2239'
        dc i2'2239'
        dc i2'2240'
        dc i2'2240'
        dc i2'2241'
        dc i2'2241'
        dc i2'2242'
        dc i2'2242'
        dc i2'2082'
        dc i2'2083'
        dc i2'1923'
        dc i2'1924'
        dc i2'1764'
        dc i2'1765'
        dc i2'1605'
        dc i2'1606'
        dc i2'1446'
        dc i2'1447'
        dc i2'1287'
        dc i2'1287'
        dc i2'1127'
        dc i2'967'
        dc i2'807'
        dc i2'646'
        dc i2'486'
        dc i2'326'
        dc i2'166'
        dc i2'5'
        dc i2'5'
        dc i2'-154'
        dc i2'-314'
        dc i2'-474'
        dc i2'-634'
        dc i2'-793'
        dc i2'-953'
        dc i2'-1113'
        dc i2'-1113'
        dc i2'-1273'
        dc i2'-1434'
        dc i2'-1594'
        dc i2'-1755'
        dc i2'-1915'
        dc i2'-2076'
        dc i2'-2236'
        dc i2'-2397'
        dc i2'-2397'
        dc i2'-2237'
        dc i2'-2078'
        dc i2'-1918'
        dc i2'-1759'
        dc i2'-1599'
        dc i2'-1440'
        dc i2'-1280'
        dc i2'-1280'
        dc i2'-1441'
        dc i2'-1601'
        dc i2'-1762'
        dc i2'-1922'
        dc i2'-2083'
        dc i2'-2243'
        dc i2'-2404'
        dc i2'-2404'
        dc i2'-2244'
        dc i2'-2085'
        dc i2'-1925'
        dc i2'-1766'
        dc i2'-1766'
        dc i2'-1607'
        dc i2'-1447'
        dc i2'-1288'
        dc i2'-1128'
        dc i2'-1128'
        dc i2'-968'
        dc i2'-808'
        dc i2'-648'
        dc i2'-488'
        dc i2'-328'
        dc i2'-168'
        dc i2'-8'
        dc i2'152'
        dc i2'312'
        dc i2'472'
        dc i2'632'
        dc i2'792'
        dc i2'952'
        dc i2'1112'
        dc i2'1272'
        dc i2'1272'
        dc i2'1432'
        dc i2'1433'
        dc i2'1593'
        dc i2'1754'
        dc i2'1754'
        dc i2'1915'
        dc i2'2075'
        dc i2'2076'
        dc i2'2236'
; large rock 2
        dc i2'129'
        dc i2'-1442'
        dc i2'-1603'
        dc i2'-1763'
        dc i2'-1923'
        dc i2'-2084'
        dc i2'-2244'
        dc i2'-2404'
        dc i2'-2404'
        dc i2'-2404'
        dc i2'-2403'
        dc i2'-2403'
        dc i2'-2402'
        dc i2'-2402'
        dc i2'-2401'
        dc i2'-2401'
        dc i2'-2400'
        dc i2'-2400'
        dc i2'-2399'
        dc i2'-2399'
        dc i2'-2399'
        dc i2'-2398'
        dc i2'-2238'
        dc i2'-2237'
        dc i2'-2077'
        dc i2'-2076'
        dc i2'-1916'
        dc i2'-1915'
        dc i2'-1755'
        dc i2'-1754'
        dc i2'-1594'
        dc i2'-1593'
        dc i2'-1433'
        dc i2'-1433'
        dc i2'-1273'
        dc i2'-1113'
        dc i2'-953'
        dc i2'-793'
        dc i2'-633'
        dc i2'-633'
        dc i2'-633'
        dc i2'-634'
        dc i2'-474'
        dc i2'-475'
        dc i2'-475'
        dc i2'-476'
        dc i2'-316'
        dc i2'-317'
        dc i2'-317'
        dc i2'-318'
        dc i2'-158'
        dc i2'-159'
        dc i2'-159'
        dc i2'2'
        dc i2'2'
        dc i2'163'
        dc i2'163'
        dc i2'324'
        dc i2'324'
        dc i2'485'
        dc i2'645'
        dc i2'646'
        dc i2'806'
        dc i2'807'
        dc i2'967'
        dc i2'967'
        dc i2'1127'
        dc i2'1286'
        dc i2'1446'
        dc i2'1605'
        dc i2'1605'
        dc i2'1764'
        dc i2'1924'
        dc i2'2083'
        dc i2'2243'
        dc i2'2243'
        dc i2'2082'
        dc i2'1922'
        dc i2'1762'
        dc i2'1601'
        dc i2'1601'
        dc i2'1601'
        dc i2'1760'
        dc i2'1760'
        dc i2'1759'
        dc i2'1919'
        dc i2'1918'
        dc i2'2078'
        dc i2'2077'
        dc i2'2077'
        dc i2'2236'
        dc i2'2236'
        dc i2'2236'
        dc i2'2075'
        dc i2'1915'
        dc i2'1755'
        dc i2'1594'
        dc i2'1434'
        dc i2'1273'
        dc i2'1113'
        dc i2'953'
        dc i2'792'
        dc i2'632'
        dc i2'632'
        dc i2'472'
        dc i2'312'
        dc i2'152'
        dc i2'-8'
        dc i2'-168'
        dc i2'-328'
        dc i2'-488'
        dc i2'-648'
        dc i2'-808'
        dc i2'-968'
        dc i2'-1128'
        dc i2'-1288'
        dc i2'-1448'
        dc i2'-1448'
        dc i2'-1448'
        dc i2'-1447'
        dc i2'-1447'
        dc i2'-1446'
        dc i2'-1446'
        dc i2'-1445'
        dc i2'-1445'
        dc i2'-1444'
        dc i2'-1444'
        dc i2'-1443'
        dc i2'-1443'
        dc i2'-1442'
; large rock 3
        dc i2'104'
        dc i2'-637'
        dc i2'-476'
        dc i2'-316'
        dc i2'-155'
        dc i2'5'
        dc i2'165'
        dc i2'326'
        dc i2'486'
        dc i2'647'
        dc i2'647'
        dc i2'806'
        dc i2'966'
        dc i2'1126'
        dc i2'1285'
        dc i2'1445'
        dc i2'1605'
        dc i2'1764'
        dc i2'1924'
        dc i2'2084'
        dc i2'2243'
        dc i2'2243'
        dc i2'2243'
        dc i2'2242'
        dc i2'2082'
        dc i2'2081'
        dc i2'2081'
        dc i2'2080'
        dc i2'1920'
        dc i2'1919'
        dc i2'1919'
        dc i2'1918'
        dc i2'1758'
        dc i2'1757'
        dc i2'1757'
        dc i2'1917'
        dc i2'1916'
        dc i2'2076'
        dc i2'2235'
        dc i2'2235'
        dc i2'2075'
        dc i2'1914'
        dc i2'1754'
        dc i2'1594'
        dc i2'1433'
        dc i2'1273'
        dc i2'1112'
        dc i2'1112'
        dc i2'952'
        dc i2'793'
        dc i2'633'
        dc i2'473'
        dc i2'313'
        dc i2'153'
        dc i2'-7'
        dc i2'-7'
        dc i2'-167'
        dc i2'-327'
        dc i2'-487'
        dc i2'-647'
        dc i2'-807'
        dc i2'-968'
        dc i2'-1128'
        dc i2'-1128'
        dc i2'-1287'
        dc i2'-1447'
        dc i2'-1606'
        dc i2'-1766'
        dc i2'-1926'
        dc i2'-2085'
        dc i2'-2245'
        dc i2'-2404'
        dc i2'-2404'
        dc i2'-2404'
        dc i2'-2243'
        dc i2'-2243'
        dc i2'-2242'
        dc i2'-2082'
        dc i2'-2081'
        dc i2'-1921'
        dc i2'-1920'
        dc i2'-1920'
        dc i2'-1920'
        dc i2'-2079'
        dc i2'-2079'
        dc i2'-2238'
        dc i2'-2238'
        dc i2'-2397'
        dc i2'-2397'
        dc i2'-2397'
        dc i2'-2236'
        dc i2'-2076'
        dc i2'-1915'
        dc i2'-1755'
        dc i2'-1594'
        dc i2'-1434'
        dc i2'-1273'
        dc i2'-1273'
        dc i2'-1114'
        dc i2'-1114'
        dc i2'-955'
        dc i2'-955'
        dc i2'-796'
        dc i2'-796'
        dc i2'-637'
; medium rock 1
        dc i2'57'
        dc i2'1118'
        dc i2'1118'
        dc i2'1119'
        dc i2'1119'
        dc i2'1120'
        dc i2'1120'
        dc i2'1121'
        dc i2'1121'
        dc i2'961'
        dc i2'962'
        dc i2'802'
        dc i2'803'
        dc i2'643'
        dc i2'643'
        dc i2'483'
        dc i2'323'
        dc i2'163'
        dc i2'2'
        dc i2'2'
        dc i2'-158'
        dc i2'-317'
        dc i2'-477'
        dc i2'-637'
        dc i2'-637'
        dc i2'-797'
        dc i2'-958'
        dc i2'-1118'
        dc i2'-1279'
        dc i2'-1279'
        dc i2'-1119'
        dc i2'-959'
        dc i2'-800'
        dc i2'-640'
        dc i2'-640'
        dc i2'-801'
        dc i2'-961'
        dc i2'-1122'
        dc i2'-1282'
        dc i2'-1282'
        dc i2'-1123'
        dc i2'-963'
        dc i2'-804'
        dc i2'-644'
        dc i2'-644'
        dc i2'-484'
        dc i2'-324'
        dc i2'-164'
        dc i2'-4'
        dc i2'156'
        dc i2'316'
        dc i2'476'
        dc i2'636'
        dc i2'636'
        dc i2'796'
        dc i2'797'
        dc i2'957'
        dc i2'1118'
; medium rock 2
        dc i2'70'
        dc i2'-801'
        dc i2'-962'
        dc i2'-1122'
        dc i2'-1282'
        dc i2'-1282'
        dc i2'-1282'
        dc i2'-1281'
        dc i2'-1281'
        dc i2'-1280'
        dc i2'-1280'
        dc i2'-1280'
        dc i2'-1279'
        dc i2'-1119'
        dc i2'-1118'
        dc i2'-958'
        dc i2'-957'
        dc i2'-797'
        dc i2'-797'
        dc i2'-637'
        dc i2'-477'
        dc i2'-317'
        dc i2'-317'
        dc i2'-317'
        dc i2'-318'
        dc i2'-318'
        dc i2'-159'
        dc i2'-159'
        dc i2'-160'
        dc i2'-160'
        dc i2'1'
        dc i2'1'
        dc i2'162'
        dc i2'322'
        dc i2'323'
        dc i2'483'
        dc i2'483'
        dc i2'643'
        dc i2'802'
        dc i2'962'
        dc i2'1121'
        dc i2'1121'
        dc i2'961'
        dc i2'800'
        dc i2'800'
        dc i2'800'
        dc i2'959'
        dc i2'959'
        dc i2'1118'
        dc i2'1118'
        dc i2'1118'
        dc i2'957'
        dc i2'797'
        dc i2'637'
        dc i2'476'
        dc i2'316'
        dc i2'316'
        dc i2'156'
        dc i2'-4'
        dc i2'-164'
        dc i2'-324'
        dc i2'-484'
        dc i2'-644'
        dc i2'-804'
        dc i2'-804'
        dc i2'-804'
        dc i2'-803'
        dc i2'-803'
        dc i2'-802'
        dc i2'-802'
        dc i2'-801'
; medium rock 3
        dc i2'59'
        dc i2'-319'
        dc i2'-158'
        dc i2'2'
        dc i2'163'
        dc i2'323'
        dc i2'323'
        dc i2'483'
        dc i2'642'
        dc i2'802'
        dc i2'962'
        dc i2'1121'
        dc i2'1121'
        dc i2'1121'
        dc i2'960'
        dc i2'960'
        dc i2'959'
        dc i2'799'
        dc i2'798'
        dc i2'798'
        dc i2'958'
        dc i2'1117'
        dc i2'1117'
        dc i2'957'
        dc i2'797'
        dc i2'636'
        dc i2'476'
        dc i2'476'
        dc i2'316'
        dc i2'156'
        dc i2'-4'
        dc i2'-4'
        dc i2'-164'
        dc i2'-324'
        dc i2'-484'
        dc i2'-644'
        dc i2'-644'
        dc i2'-804'
        dc i2'-963'
        dc i2'-1123'
        dc i2'-1282'
        dc i2'-1282'
        dc i2'-1282'
        dc i2'-1121'
        dc i2'-1121'
        dc i2'-960'
        dc i2'-960'
        dc i2'-1120'
        dc i2'-1119'
        dc i2'-1279'
        dc i2'-1279'
        dc i2'-1118'
        dc i2'-958'
        dc i2'-797'
        dc i2'-637'
        dc i2'-637'
        dc i2'-637'
        dc i2'-478'
        dc i2'-478'
        dc i2'-319'
; small rock 1
        dc i2'33'
        dc i2'479'
        dc i2'479'
        dc i2'480'
        dc i2'480'
        dc i2'480'
        dc i2'481'
        dc i2'321'
        dc i2'321'
        dc i2'161'
        dc i2'1'
        dc i2'1'
        dc i2'-159'
        dc i2'-319'
        dc i2'-319'
        dc i2'-479'
        dc i2'-640'
        dc i2'-640'
        dc i2'-480'
        dc i2'-320'
        dc i2'-320'
        dc i2'-481'
        dc i2'-641'
        dc i2'-641'
        dc i2'-482'
        dc i2'-322'
        dc i2'-322'
        dc i2'-162'
        dc i2'-2'
        dc i2'158'
        dc i2'318'
        dc i2'318'
        dc i2'318'
        dc i2'479'
; small rock 2
        dc i2'40'
        dc i2'-481'
        dc i2'-641'
        dc i2'-641'
        dc i2'-641'
        dc i2'-640'
        dc i2'-640'
        dc i2'-640'
        dc i2'-479'
        dc i2'-479'
        dc i2'-479'
        dc i2'-319'
        dc i2'-159'
        dc i2'-159'
        dc i2'-159'
        dc i2'-160'
        dc i2'-160'
        dc i2'-160'
        dc i2'0'
        dc i2'1'
        dc i2'161'
        dc i2'161'
        dc i2'321'
        dc i2'480'
        dc i2'480'
        dc i2'320'
        dc i2'320'
        dc i2'319'
        dc i2'479'
        dc i2'479'
        dc i2'318'
        dc i2'158'
        dc i2'158'
        dc i2'-2'
        dc i2'-162'
        dc i2'-322'
        dc i2'-482'
        dc i2'-482'
        dc i2'-482'
        dc i2'-481'
        dc i2'-481'
; small rock 3
        dc i2'34'
        dc i2'-160'
        dc i2'1'
        dc i2'161'
        dc i2'161'
        dc i2'321'
        dc i2'480'
        dc i2'480'
        dc i2'480'
        dc i2'319'
        dc i2'319'
        dc i2'319'
        dc i2'478'
        dc i2'478'
        dc i2'318'
        dc i2'158'
        dc i2'158'
        dc i2'-2'
        dc i2'-2'
        dc i2'-162'
        dc i2'-322'
        dc i2'-322'
        dc i2'-482'
        dc i2'-641'
        dc i2'-641'
        dc i2'-641'
        dc i2'-480'
        dc i2'-480'
        dc i2'-640'
        dc i2'-640'
        dc i2'-479'
        dc i2'-319'
        dc i2'-319'
        dc i2'-319'
        dc i2'-160'
; large saucer
        dc i2'101'
        dc i2'5'
        dc i2'5'
        dc i2'164'
        dc i2'164'
        dc i2'323'
        dc i2'323'
        dc i2'482'
        dc i2'482'
        dc i2'482'
        dc i2'481'
        dc i2'481'
        dc i2'480'
        dc i2'480'
        dc i2'479'
        dc i2'479'
        dc i2'478'
        dc i2'478'
        dc i2'477'
        dc i2'477'
        dc i2'477'
        dc i2'476'
        dc i2'316'
        dc i2'315'
        dc i2'155'
        dc i2'154'
        dc i2'-6'
        dc i2'-6'
        dc i2'-166'
        dc i2'-165'
        dc i2'-325'
        dc i2'-484'
        dc i2'-484'
        dc i2'-643'
        dc i2'-643'
        dc i2'-803'
        dc i2'-963'
        dc i2'-1122'
        dc i2'-1282'
        dc i2'-1442'
        dc i2'-1442'
        dc i2'-1441'
        dc i2'-1441'
        dc i2'-1440'
        dc i2'-1440'
        dc i2'-1439'
        dc i2'-1439'
        dc i2'-1279'
        dc i2'-1119'
        dc i2'-958'
        dc i2'-798'
        dc i2'-638'
        dc i2'-638'
        dc i2'-477'
        dc i2'-477'
        dc i2'-316'
        dc i2'-156'
        dc i2'-155'
        dc i2'5'
        dc i2'5'
        dc i2'5'
        dc i2'4'
        dc i2'4'
        dc i2'3'
        dc i2'3'
        dc i2'2'
        dc i2'2'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'-1'
        dc i2'-1'
        dc i2'-2'
        dc i2'-2'
        dc i2'-3'
        dc i2'-3'
        dc i2'-4'
        dc i2'-4'
        dc i2'-5'
        dc i2'-5'
        dc i2'-6'
        dc i2'-6'
        dc i2'-6'
        dc i2'-166'
        dc i2'-165'
        dc i2'-325'
        dc i2'-484'
        dc i2'-484'
        dc i2'-643'
        dc i2'-643'
        dc i2'-643'
        dc i2'-642'
        dc i2'-642'
        dc i2'-641'
        dc i2'-641'
        dc i2'-640'
        dc i2'-640'
        dc i2'-639'
        dc i2'-639'
        dc i2'-638'
        dc i2'-638'
; small saucer
        dc i2'54'
        dc i2'2'
        dc i2'2'
        dc i2'161'
        dc i2'161'
        dc i2'161'
        dc i2'160'
        dc i2'160'
        dc i2'159'
        dc i2'159'
        dc i2'158'
        dc i2'158'
        dc i2'158'
        dc i2'-3'
        dc i2'-3'
        dc i2'-3'
        dc i2'-163'
        dc i2'-162'
        dc i2'-322'
        dc i2'-322'
        dc i2'-482'
        dc i2'-641'
        dc i2'-641'
        dc i2'-641'
        dc i2'-640'
        dc i2'-640'
        dc i2'-640'
        dc i2'-480'
        dc i2'-319'
        dc i2'-319'
        dc i2'-159'
        dc i2'-158'
        dc i2'2'
        dc i2'2'
        dc i2'2'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'-1'
        dc i2'-1'
        dc i2'-2'
        dc i2'-2'
        dc i2'-3'
        dc i2'-3'
        dc i2'-3'
        dc i2'-163'
        dc i2'-162'
        dc i2'-322'
        dc i2'-322'
        dc i2'-321'
        dc i2'-321'
        dc i2'-320'
        dc i2'-320'
        dc i2'-319'


prerenderEvenOddData anop
; large rock 1
        dc i2'102'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
; large rock 2
        dc i2'129'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
; large rock 3
        dc i2'104'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
; medium rock 1
        dc i2'57'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
; medium rock 2
        dc i2'70'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
; medium rock 3
        dc i2'59'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
; small rock 1
        dc i2'33'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
; small rock 2
        dc i2'40'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
; small rock 3
        dc i2'34'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
; large saucer
        dc i2'101'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
; small saucer
        dc i2'54'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'


PR_LARGE_ROCK1 gequ 0
PR_LARGE_ROCK2 gequ 103
PR_LARGE_ROCK3 gequ 233
PR_MEDIUM_ROCK1 gequ 338
PR_MEDIUM_ROCK2 gequ 396
PR_MEDIUM_ROCK3 gequ 467
PR_SMALL_ROCK1 gequ 527
PR_SMALL_ROCK2 gequ 561
PR_SMALL_ROCK3 gequ 602
PR_LARGE_SAUCER gequ 637
PR_SMALL_SAUCER gequ 739




        end
