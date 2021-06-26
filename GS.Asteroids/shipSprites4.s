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

shipSprites4 start shipSprites4Seg
        using globalData
        using lineData




spritePlayerOddAngle90 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
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

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
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
        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #320
        tcd

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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22
        _spriteFooter
        rtl


spritePlayerEvenAngle90 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
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

        lda >drawAddress
        clc
        adc #-640
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
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
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

        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 16
        ora #$0f
        sta 16
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 16
        ora #$0f
        sta 16
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #160
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
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spritePlayerEraseAngle90 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 22
        sta 21

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 21
        sta 20
        sta 21

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
        sta 18
        sta 17
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17
        sta 16
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 16
        sta 17
        sta 21

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 18
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 20
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 22
        _spriteFooter
        rtl


spritePlayerOddAngle100 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

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

        lda >drawAddress
        clc
        adc #-480
        tcd

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
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
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
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22
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
        lda 22
        ora #$0f
        sta 22
        _spriteFooter
        rtl


spritePlayerEvenAngle100 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

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

        lda >drawAddress
        clc
        adc #-480
        tcd

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
        lda 16
        ora #$0f
        sta 16
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 16
        ora #$0f
        sta 16
        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17
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
        lda 19
        ora #$0f
        sta 19
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

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
        adc #640
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spritePlayerEraseAngle100 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 22
        sta 21
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 19
        sta 18
        sta 17
        sta 16
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 16
        sta 21
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17
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
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 20
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 21
        sta 22

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 22
        _spriteFooter
        rtl


spritePlayerOddAngle110 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 18
        ora #$f0
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
        lda 22
        ora #$0f
        sta 22

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

        lda 20
        ora #$f0
        sta 20
        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spritePlayerEvenAngle110 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

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
        ora #$f0
        sta 17
        lda 16
        ora #$0f
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
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
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spritePlayerEraseAngle110 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 23
        sta 22
        sta 21
        sta 20
        sta 19
        sta 18
        sta 17
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 17
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17
        sta 18
        sta 21
        sta 22

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
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 19
        sta 20
        sta 21

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 20
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 21

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 21
        _spriteFooter
        rtl





drawAddress dc i4'0'


        end
