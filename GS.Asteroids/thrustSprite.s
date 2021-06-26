;
;  thrustSprite.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 6/26/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global

thrustSprite start thrustSprite
        using globalData
        using lineData


spriteThrustOddAngle0 entry
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
        ora #$0f
        sta 20

        lda >drawAddress
        clc
        adc #-960
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
        adc #-800
        tcd

        lda 18
        ora #$0f
        sta 18
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
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spriteThrustEvenAngle0 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 20
        ora #$f0
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

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spriteThrustEraseAngle0 entry
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
        sta 21
        sta 19
        _spriteFooter
        rtl


spriteThrustOddAngle10 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
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
        lda 19
        ora #$0f
        sta 19
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
        _spriteFooter
        rtl


spriteThrustEvenAngle10 entry
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
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$f0
        sta 21
        _spriteFooter
        rtl


spriteThrustEraseAngle10 entry
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
        sta 21
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 21
        _spriteFooter
        rtl


spriteThrustOddAngle20 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
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
        adc #-960
        tcd

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
        _spriteFooter
        rtl


spriteThrustEvenAngle20 entry
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
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spriteThrustEraseAngle20 entry
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
        _spriteFooter
        rtl


spriteThrustOddAngle30 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
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
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
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
        _spriteFooter
        rtl


spriteThrustEvenAngle30 entry
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
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spriteThrustEraseAngle30 entry
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

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 21

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 21
        _spriteFooter
        rtl


spriteThrustOddAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
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

        lda >drawAddress
        clc
        adc #-960
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

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$f0
        sta 21
        _spriteFooter
        rtl


spriteThrustEvenAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-800
        tcd

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
        adc #-640
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle40 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 22
        sta 21

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 22
        sta 21
        sta 20

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle50 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
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
        adc #-960
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-800
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
        _spriteFooter
        rtl


spriteThrustEvenAngle50 entry
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
        adc #-640
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle50 entry
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
        sta 22

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle60 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$f0
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
        _spriteFooter
        rtl


spriteThrustEvenAngle60 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 22
        ora #$0f
        sta 22
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
        adc #-480
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle60 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 22
        sta 23
        sta 22
        sta 21

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle70 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-480
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
        _spriteFooter
        rtl


spriteThrustEvenAngle70 entry
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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle70 entry
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

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 23

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle80 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$f0
        sta 23

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
        _spriteFooter
        rtl


spriteThrustEvenAngle80 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

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

        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle80 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 22
        sta 21

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 23
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 23

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle90 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-320
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

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 24
        ora #$f0
        sta 24
        lda 23
        ora #$0f
        sta 23
        _spriteFooter
        rtl


spriteThrustEvenAngle90 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

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

        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle90 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 23

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle100 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$0f
        sta 23
        _spriteFooter
        rtl


spriteThrustEvenAngle100 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #160
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

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle100 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 22
        sta 23

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 21
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle110 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 23
        ora #$0f
        sta 23

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$0f
        sta 23

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 23
        ora #$0f
        sta 23

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$0f
        sta 23
        _spriteFooter
        rtl


spriteThrustEvenAngle110 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$f0
        sta 23

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
        lda 23
        ora #$f0
        sta 23
        _spriteFooter
        rtl


spriteThrustEraseAngle110 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 23

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 21
        sta 22
        sta 23
        _spriteFooter
        rtl


spriteThrustOddAngle120 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 23
        ora #$0f
        sta 23

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$f0
        sta 23

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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 23
        ora #$0f
        sta 23
        _spriteFooter
        rtl


spriteThrustEvenAngle120 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$f0
        sta 23

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
        lda 22
        ora #$0f
        sta 22
        lda 23
        ora #$f0
        sta 23
        _spriteFooter
        rtl


spriteThrustEraseAngle120 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 23

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 21
        sta 22
        sta 23
        _spriteFooter
        rtl


spriteThrustOddAngle130 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$0f
        sta 23

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 22
        ora #$0f
        sta 22

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

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 23
        ora #$f0
        sta 23
        _spriteFooter
        rtl


spriteThrustEvenAngle130 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #320
        tcd

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

        lda >drawAddress
        clc
        adc #640
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
        ora #$0f
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle130 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 20
        sta 21
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle140 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$0f
        sta 23

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 23
        ora #$0f
        sta 23
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 22
        ora #$0f
        sta 22
        _spriteFooter
        rtl


spriteThrustEvenAngle140 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #640
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

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 22
        ora #$f0
        sta 22
        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEraseAngle140 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 22

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 20
        sta 21
        sta 22

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 21
        sta 22
        _spriteFooter
        rtl


spriteThrustOddAngle150 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$f0
        sta 23

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$0f
        sta 22
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
        lda 22
        ora #$f0
        sta 22

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$f0
        sta 22
        _spriteFooter
        rtl


spriteThrustEvenAngle150 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #640
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
        adc #800
        tcd

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
        adc #960
        tcd

        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spriteThrustEraseAngle150 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 20
        sta 21

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 21

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 21
        _spriteFooter
        rtl


spriteThrustOddAngle160 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 23
        ora #$f0
        sta 23
        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 21
        ora #$0f
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

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 21
        ora #$0f
        sta 21
        lda 21
        ora #$0f
        sta 21
        _spriteFooter
        rtl


spriteThrustEvenAngle160 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 19
        ora #$0f
        sta 19
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
        lda 21
        ora #$f0
        sta 21
        _spriteFooter
        rtl


spriteThrustEraseAngle160 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 19
        sta 21

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 20
        sta 21

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 20
        sta 21
        _spriteFooter
        rtl


spriteThrustOddAngle170 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$0f
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$0f
        sta 22
        lda 21
        ora #$0f
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
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 21
        ora #$f0
        sta 21
        lda 21
        ora #$f0
        sta 21
        _spriteFooter
        rtl


spriteThrustEvenAngle170 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 21
        ora #$f0
        sta 21

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
        ora #$0f
        sta 20
        _spriteFooter
        rtl


spriteThrustEraseAngle170 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 21

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 19
        sta 21

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
        _spriteFooter
        rtl


spriteThrustOddAngle180 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$0f
        sta 22
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
        lda 21
        ora #$f0
        sta 21

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 21
        ora #$f0
        sta 21
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
        _spriteFooter
        rtl


spriteThrustEvenAngle180 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 19
        ora #$f0
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
        _spriteFooter
        rtl


spriteThrustEraseAngle180 entry
        spriteGetDrawAddress
        _spriteHeader

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


spriteThrustOddAngle190 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 20
        ora #$0f
        sta 20

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
        lda 21
        ora #$f0
        sta 21
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 20
        ora #$0f
        sta 20
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        _spriteFooter
        rtl


spriteThrustEvenAngle190 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 18
        ora #$0f
        sta 18
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
        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spriteThrustEraseAngle190 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 18

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 18
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 19

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 19
        _spriteFooter
        rtl


spriteThrustOddAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #960
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
        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spriteThrustEvenAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18
        _spriteFooter
        rtl


spriteThrustEraseAngle200 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 18

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


spriteThrustOddAngle210 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 20
        ora #$f0
        sta 20

        lda >drawAddress
        clc
        adc #960
        tcd

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
        ora #$0f
        sta 18
        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spriteThrustEvenAngle210 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #640
        tcd

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

        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18
        _spriteFooter
        rtl


spriteThrustEraseAngle210 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 18

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 18

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


spriteThrustOddAngle220 entry
        spriteGetDrawAddress
        _spriteHeader

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

        lda 18
        ora #$0f
        sta 18
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
        adc #960
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spriteThrustEvenAngle220 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 17
        ora #$0f
        sta 17
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

        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spriteThrustEraseAngle220 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 17
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 17
        sta 18
        _spriteFooter
        rtl


spriteThrustOddAngle230 entry
        spriteGetDrawAddress
        _spriteHeader

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
        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #960
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
        _spriteFooter
        rtl


spriteThrustEvenAngle230 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 17
        ora #$f0
        sta 17
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
        _spriteFooter
        rtl


spriteThrustEraseAngle230 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 17
        sta 18
        _spriteFooter
        rtl


spriteThrustOddAngle240 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 17
        ora #$0f
        sta 17
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

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spriteThrustEvenAngle240 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 17
        ora #$f0
        sta 17
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
        _spriteFooter
        rtl


spriteThrustEraseAngle240 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 17
        sta 16
        sta 17
        sta 18
        _spriteFooter
        rtl


spriteThrustOddAngle250 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 17
        ora #$f0
        sta 17
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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 18
        ora #$0f
        sta 18
        _spriteFooter
        rtl


spriteThrustEvenAngle250 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 16
        ora #$0f
        sta 16

        lda >drawAddress
        clc
        adc #320
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
        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spriteThrustEraseAngle250 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 16
        sta 17
        sta 18
        _spriteFooter
        rtl


spriteThrustOddAngle260 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #320
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

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spriteThrustEvenAngle260 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 16
        ora #$0f
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 16
        ora #$0f
        sta 16
        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spriteThrustEraseAngle260 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 16
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 17
        sta 18
        _spriteFooter
        rtl


spriteThrustOddAngle270 entry
        spriteGetDrawAddress
        _spriteHeader

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

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spriteThrustEvenAngle270 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #0
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

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18
        _spriteFooter
        rtl


spriteThrustEraseAngle270 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 16
        sta 17

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 17
        sta 18
        _spriteFooter
        rtl


spriteThrustOddAngle280 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$f0
        sta 17

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

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 17
        ora #$0f
        sta 17
        _spriteFooter
        rtl


spriteThrustEvenAngle280 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 16
        ora #$0f
        sta 16
        lda 16
        ora #$0f
        sta 16

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 17
        ora #$0f
        sta 17
        _spriteFooter
        rtl


spriteThrustEraseAngle280 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 18
        sta 17

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 17
        sta 16

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 17
        _spriteFooter
        rtl


spriteThrustOddAngle290 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 17
        ora #$f0
        sta 17
        _spriteFooter
        rtl


spriteThrustEvenAngle290 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

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
        adc #-480
        tcd

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

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$0f
        sta 17
        _spriteFooter
        rtl


spriteThrustEraseAngle290 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 18
        sta 17
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17
        _spriteFooter
        rtl


spriteThrustOddAngle300 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 17
        ora #$0f
        sta 17

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

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 17
        ora #$f0
        sta 17
        _spriteFooter
        rtl


spriteThrustEvenAngle300 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
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
        lda 17
        ora #$f0
        sta 17
        lda 16
        ora #$0f
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

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

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$f0
        sta 17
        _spriteFooter
        rtl


spriteThrustEraseAngle300 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 18
        sta 17
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 17
        _spriteFooter
        rtl


spriteThrustOddAngle310 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 17
        ora #$f0
        sta 17
        _spriteFooter
        rtl


spriteThrustEvenAngle310 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
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

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 17
        ora #$f0
        sta 17

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$0f
        sta 17
        _spriteFooter
        rtl


spriteThrustEraseAngle310 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 19
        sta 18
        sta 17

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 17
        _spriteFooter
        rtl


spriteThrustOddAngle320 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 17
        ora #$f0
        sta 17
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 17
        ora #$f0
        sta 17
        _spriteFooter
        rtl


spriteThrustEvenAngle320 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 17
        ora #$0f
        sta 17
        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18
        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 17
        ora #$0f
        sta 17

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 17
        ora #$0f
        sta 17
        _spriteFooter
        rtl


spriteThrustEraseAngle320 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 18
        sta 17

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 19
        sta 18
        sta 17

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 17

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 17
        _spriteFooter
        rtl


spriteThrustOddAngle330 entry
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
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 17
        ora #$0f
        sta 17
        _spriteFooter
        rtl


spriteThrustEvenAngle330 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 18
        ora #$0f
        sta 18
        lda 18
        ora #$f0
        sta 18
        lda 18
        ora #$f0
        sta 18

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19
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
        _spriteFooter
        rtl


spriteThrustEraseAngle330 entry
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

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 19
        sta 18

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 18
        _spriteFooter
        rtl


spriteThrustOddAngle340 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 19
        ora #$f0
        sta 19

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
        ora #$f0
        sta 18
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 17
        ora #$0f
        sta 17
        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spriteThrustEvenAngle340 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 19
        ora #$f0
        sta 19
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 18
        ora #$0f
        sta 18

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 20
        ora #$f0
        sta 20
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
        _spriteFooter
        rtl


spriteThrustEraseAngle340 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 19
        sta 18

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 19
        sta 18

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 20
        sta 18

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 18
        _spriteFooter
        rtl


spriteThrustOddAngle350 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$0f
        sta 19

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
        lda 19
        ora #$0f
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 18
        ora #$f0
        sta 18
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 19
        ora #$f0
        sta 19
        _spriteFooter
        rtl


spriteThrustEvenAngle350 entry
        spriteGetDrawAddress
        _spriteHeader

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 19
        ora #$0f
        sta 19
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 20
        ora #$f0
        sta 20
        lda 19
        ora #$f0
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 20
        ora #$0f
        sta 20
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
        _spriteFooter
        rtl


spriteThrustEraseAngle350 entry
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
        sta 20
        sta 19

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 20
        sta 18

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 18
        _spriteFooter
        rtl


drawAddress dc i4'0'


        end
