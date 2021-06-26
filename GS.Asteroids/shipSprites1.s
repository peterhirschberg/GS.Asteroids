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

shipSprites1 start shipSprites1Seg
        using globalData
        using lineData


spritePlayerOddAngle0 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
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
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #1120
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
        adc #-800
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$0f
        sta 21
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
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #1120
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
        adc #-800
        tcd

        lda #$00
        sta 18
        sta 22
        sta 18

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 18
        sta 22
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 18
        sta 21
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 18
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 18
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 20

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 20
        _spriteFooter
        rtl


spritePlayerOddAngle10 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 18
        ora #$0f
        sta 18
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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spritePlayerEvenAngle10 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 18
        ora #$f0
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
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 18
        ora #$f0
        sta 18
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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spritePlayerEraseAngle10 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 18

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 18
        sta 22
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 18
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 18
        sta 21
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 18
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 18
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 18
        sta 19
        _spriteFooter
        rtl


spritePlayerOddAngle20 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 19
        ora #$f0
        sta 19
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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spritePlayerEvenAngle20 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 18
        ora #$0f
        sta 18
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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 18
        ora #$0f
        sta 18
        _spriteFooter
        rtl


spritePlayerEraseAngle20 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 18

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 18
        sta 22
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 18
        sta 22
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 18
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 18
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 18
        sta 21

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 18
        _spriteFooter
        rtl













drawAddress dc i4'0'


        end
