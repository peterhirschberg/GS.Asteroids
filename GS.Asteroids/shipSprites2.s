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

shipSprites2 start shipSprites2Seg
        using globalData
        using lineData








spritePlayerOddAngle30 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

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
        ora #$0f
        sta 19
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
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 22
        ora #$f0
        sta 22

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
        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21

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
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 19
        ora #$f0
        sta 19
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


spritePlayerEvenAngle30 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$0f
        sta 19

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

        lda 19
        ora #$f0
        sta 19
        lda 22
        ora #$0f
        sta 22
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21

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
        ora #$f0
        sta 20
        lda 20
        ora #$0f
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
        ora #$f0
        sta 19

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

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spritePlayerEraseAngle30 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 19

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 19
        sta 22
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 19
        sta 22
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 19
        sta 22

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

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 18
        _spriteFooter
        rtl


spritePlayerOddAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

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
        adc #-480
        tcd

        lda 20
        ora #$f0
        sta 20
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
        ora #$0f
        sta 19
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

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$0f
        sta 22

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
        lda 21
        ora #$0f
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

        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$0f
        sta 19
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
        lda 18
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spritePlayerEvenAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

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
        adc #-480
        tcd

        lda 19
        ora #$0f
        sta 19
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

        lda 19
        ora #$f0
        sta 19
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

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22

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
        lda 21
        ora #$f0
        sta 21

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
        ora #$f0
        sta 18
        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #640
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

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 17
        ora #$0f
        sta 17
        _spriteFooter
        rtl


spritePlayerEraseAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 19
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 19
        sta 23
        sta 22
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 19
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 18
        sta 21
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 18
        sta 20
        sta 21

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

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 17
        _spriteFooter
        rtl


spritePlayerOddAngle50 entry
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

        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 19
        ora #$f0
        sta 19
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

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 22
        ora #$0f
        sta 22
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22

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
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

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
        adc #640
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spritePlayerEvenAngle50 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 19
        ora #$0f
        sta 19
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
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 18
        ora #$0f
        sta 18
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

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 18
        ora #$f0
        sta 18
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
        adc #640
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
        _spriteFooter
        rtl


spritePlayerEraseAngle50 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 20

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 18
        sta 23
        sta 22
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 18
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 18
        sta 20
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 18
        sta 19
        sta 20

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 17
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 17
        _spriteFooter
        rtl

















drawAddress dc i4'0'


        end
