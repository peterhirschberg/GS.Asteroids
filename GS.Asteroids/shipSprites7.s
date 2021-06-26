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

shipSprites7 start shipSprites7Seg
        using globalData
        using lineData







spritePlayerOddAngle180 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 22
        ora #$0f
        sta 22
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
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$0f
        sta 18
        _spriteFooter
        rtl


spritePlayerEvenAngle180 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$f0
        sta 19

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

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

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
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spritePlayerEraseAngle180 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 21
        sta 18
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 22
        sta 18
        sta 19
        sta 20
        sta 21
        sta 22

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 22
        sta 18

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 18
        _spriteFooter
        rtl


spritePlayerOddAngle190 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 22
        ora #$f0
        sta 22
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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$f0
        sta 22
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
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spritePlayerEvenAngle190 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$f0
        sta 19

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

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$0f
        sta 21
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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21
        _spriteFooter
        rtl


spritePlayerEraseAngle190 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 21
        sta 18
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 21
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 21
        sta 17
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 21
        _spriteFooter
        rtl


spritePlayerOddAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$0f
        sta 21
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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spritePlayerEvenAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$f0
        sta 21
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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 21
        ora #$f0
        sta 21
        _spriteFooter
        rtl


spritePlayerEraseAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 21

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 21
        sta 17
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 21
        sta 17
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 21
        _spriteFooter
        rtl












drawAddress dc i4'0'


        end
