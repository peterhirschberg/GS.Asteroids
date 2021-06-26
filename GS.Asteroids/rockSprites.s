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
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda 24
        ora #$09
        sta 24
        lda 23
        ora #$09
        sta 23
        lda 17
        ora #$09
        sta 17
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 25
        ora #$90
        sta 25
        lda 23
        ora #$90
        sta 23
        lda 18
        ora #$90
        sta 18
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda 25
        ora #$09
        sta 25
        lda 22
        ora #$09
        sta 22
        lda 18
        ora #$09
        sta 18
        lda 15
        ora #$09
        sta 15

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 26
        ora #$90
        sta 26
        lda 22
        ora #$90
        sta 22
        lda 19
        ora #$90
        sta 19
        lda 15
        ora #$90
        sta 15
        lda 14
        ora #$09
        sta 14

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda 26
        ora #$09
        sta 26
        lda 21
        ora #$09
        sta 21
        lda 19
        ora #$09
        sta 19
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 27
        ora #$90
        sta 27
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$90
        sta 20
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 27
        ora #$09
        sta 27
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 28
        ora #$90
        sta 28
        lda 28
        ora #$90
        sta 28
        lda 12
        ora #$09
        sta 12
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 26
        ora #$90
        sta 26
        lda 26
        ora #$90
        sta 26
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 28
        ora #$90
        sta 28
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda 28
        ora #$90
        sta 28
        lda 28
        ora #$90
        sta 28
        lda 12
        ora #$09
        sta 12
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 27
        ora #$90
        sta 27
        lda 27
        ora #$09
        sta 27
        lda 13
        ora #$90
        sta 13
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda 26
        ora #$90
        sta 26
        lda 26
        ora #$09
        sta 26
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 25
        ora #$90
        sta 25
        lda 25
        ora #$09
        sta 25
        lda 14
        ora #$09
        sta 14
        lda 15
        ora #$90
        sta 15

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$09
        sta 24
        lda 15
        ora #$09
        sta 15

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$09
        sta 22
        lda 22
        ora #$09
        sta 22
        lda 17
        ora #$90
        sta 17
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
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda 24
        ora #$90
        sta 24
        lda 23
        ora #$90
        sta 23
        lda 17
        ora #$90
        sta 17
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 24
        ora #$09
        sta 24
        lda 22
        ora #$09
        sta 22
        lda 17
        ora #$09
        sta 17
        lda 15
        ora #$09
        sta 15

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda 25
        ora #$90
        sta 25
        lda 22
        ora #$90
        sta 22
        lda 18
        ora #$90
        sta 18
        lda 15
        ora #$90
        sta 15

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 25
        ora #$09
        sta 25
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$09
        sta 18
        lda 14
        ora #$09
        sta 14
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda 26
        ora #$90
        sta 26
        lda 21
        ora #$90
        sta 21
        lda 19
        ora #$90
        sta 19
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 26
        ora #$09
        sta 26
        lda 20
        ora #$09
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 27
        ora #$90
        sta 27
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$90
        sta 12
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 26
        ora #$90
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 26
        ora #$90
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 25
        ora #$09
        sta 25
        lda 25
        ora #$09
        sta 25
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 26
        ora #$90
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 26
        ora #$90
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$90
        sta 12
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 26
        ora #$09
        sta 26
        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$09
        sta 12
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda 25
        ora #$09
        sta 25
        lda 26
        ora #$90
        sta 26
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 24
        ora #$09
        sta 24
        lda 25
        ora #$90
        sta 25
        lda 14
        ora #$90
        sta 14
        lda 14
        ora #$09
        sta 14

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda 23
        ora #$09
        sta 23
        lda 24
        ora #$90
        sta 24
        lda 15
        ora #$90
        sta 15

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 22
        ora #$09
        sta 22
        lda 23
        ora #$90
        sta 23
        lda 15
        ora #$09
        sta 15
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 16
        ora #$09
        sta 16
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

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda #$00
        sta 24
        sta 23
        sta 17
        sta 16

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda #$00
        sta 24
        sta 22
        sta 17
        sta 15

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda #$00
        sta 25
        sta 22
        sta 18
        sta 15

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 25
        sta 21
        sta 18
        sta 14

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda #$00
        sta 26
        sta 21
        sta 19
        sta 13

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 26
        sta 20
        sta 19
        sta 13

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda #$00
        sta 27
        sta 20
        sta 12

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 25
        sta 12

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 26
        sta 27
        sta 12
        sta 13

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda #$00
        sta 25
        sta 26
        sta 13

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda #$00
        sta 24
        sta 25
        sta 14

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda #$00
        sta 23
        sta 24
        sta 15

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda #$00
        sta 22
        sta 23
        sta 15
        sta 16

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda #$00
        sta 16
        sta 17
        sta 18
        sta 19
        sta 20
        sta 21
        sta 22
        sta 16
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
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$09
        sta 22

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda 17
        ora #$90
        sta 17
        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$09
        sta 23

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 17
        ora #$90
        sta 17
        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$09
        sta 24

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda 17
        ora #$09
        sta 17
        lda 25
        ora #$90
        sta 25
        lda 25
        ora #$09
        sta 25

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 18
        ora #$90
        sta 18
        lda 26
        ora #$90
        sta 26
        lda 26
        ora #$09
        sta 26

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda 18
        ora #$90
        sta 18
        lda 27
        ora #$90
        sta 27
        lda 27
        ora #$09
        sta 27

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 18
        ora #$09
        sta 18
        lda 28
        ora #$90
        sta 28
        lda 28
        ora #$90
        sta 28
        lda 12
        ora #$09
        sta 12
        lda 12
        ora #$09
        sta 12
        lda 13
        ora #$90
        sta 13
        lda 13
        ora #$09
        sta 13
        lda 14
        ora #$90
        sta 14
        lda 14
        ora #$09
        sta 14
        lda 15
        ora #$90
        sta 15
        lda 15
        ora #$09
        sta 15
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 28
        ora #$90
        sta 28
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 28
        ora #$90
        sta 28
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 28
        ora #$90
        sta 28
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 28
        ora #$90
        sta 28
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 28
        ora #$90
        sta 28
        lda 28
        ora #$90
        sta 28
        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 26
        ora #$09
        sta 26
        lda 26
        ora #$90
        sta 26
        lda 25
        ora #$09
        sta 25
        lda 25
        ora #$90
        sta 25
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 24
        ora #$09
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$90
        sta 23
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$09
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$09
        sta 22
        lda 23
        ora #$90
        sta 23
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$09
        sta 23
        lda 24
        ora #$90
        sta 24
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 24
        ora #$09
        sta 24
        lda 25
        ora #$90
        sta 25
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 25
        ora #$09
        sta 25
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 26
        ora #$90
        sta 26
        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$09
        sta 12
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 27
        ora #$90
        sta 27
        lda 27
        ora #$09
        sta 27
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 28
        ora #$90
        sta 28
        lda 28
        ora #$90
        sta 28
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 27
        ora #$09
        sta 27
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda 27
        ora #$90
        sta 27
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 26
        ora #$09
        sta 26
        lda 14
        ora #$09
        sta 14

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda 26
        ora #$90
        sta 26
        lda 25
        ora #$09
        sta 25
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 15
        ora #$90
        sta 15

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 25
        ora #$90
        sta 25
        lda 22
        ora #$09
        sta 22
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 15
        ora #$09
        sta 15

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda 24
        ora #$09
        sta 24
        lda 23
        ora #$90
        sta 23
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 15
        ora #$09
        sta 15

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 24
        ora #$90
        sta 24
        lda 23
        ora #$90
        sta 23
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 17
        ora #$09
        sta 17
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 17
        ora #$90
        sta 17
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16
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
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda 16
        ora #$09
        sta 16
        lda 22
        ora #$09
        sta 22
        lda 23
        ora #$90
        sta 23

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 16
        ora #$09
        sta 16
        lda 23
        ora #$09
        sta 23
        lda 24
        ora #$90
        sta 24

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda 17
        ora #$90
        sta 17
        lda 24
        ora #$09
        sta 24
        lda 25
        ora #$90
        sta 25

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 17
        ora #$09
        sta 17
        lda 25
        ora #$09
        sta 25
        lda 26
        ora #$90
        sta 26

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda 17
        ora #$09
        sta 17
        lda 26
        ora #$09
        sta 26
        lda 27
        ora #$90
        sta 27

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 18
        ora #$90
        sta 18
        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$90
        sta 12
        lda 12
        ora #$90
        sta 12
        lda 12
        ora #$09
        sta 12
        lda 13
        ora #$90
        sta 13
        lda 13
        ora #$09
        sta 13
        lda 14
        ora #$90
        sta 14
        lda 14
        ora #$09
        sta 14
        lda 15
        ora #$90
        sta 15
        lda 15
        ora #$09
        sta 15
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 27
        ora #$09
        sta 27
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$90
        sta 27
        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 26
        ora #$90
        sta 26
        lda 25
        ora #$09
        sta 25
        lda 25
        ora #$90
        sta 25
        lda 24
        ora #$09
        sta 24
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 24
        ora #$90
        sta 24
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$90
        sta 23
        lda 22
        ora #$09
        sta 22
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$09
        sta 22
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$09
        sta 24
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 25
        ora #$90
        sta 25
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 25
        ora #$09
        sta 25
        lda 26
        ora #$90
        sta 26
        lda 12
        ora #$90
        sta 12
        lda 12
        ora #$90
        sta 12

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 26
        ora #$09
        sta 26
        lda 27
        ora #$90
        sta 27
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$09
        sta 27
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 27
        ora #$90
        sta 27
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda 26
        ora #$09
        sta 26
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 26
        ora #$90
        sta 26
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda 25
        ora #$09
        sta 25
        lda 25
        ora #$90
        sta 25
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 14
        ora #$09
        sta 14

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 24
        ora #$09
        sta 24
        lda 22
        ora #$90
        sta 22
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 15
        ora #$90
        sta 15

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda 24
        ora #$90
        sta 24
        lda 22
        ora #$09
        sta 22
        lda 19
        ora #$90
        sta 19
        lda 18
        ora #$09
        sta 18
        lda 15
        ora #$90
        sta 15

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 23
        ora #$09
        sta 23
        lda 22
        ora #$09
        sta 22
        lda 18
        ora #$90
        sta 18
        lda 17
        ora #$09
        sta 17
        lda 17
        ora #$90
        sta 17
        lda 15
        ora #$09
        sta 15

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16
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

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda #$00
        sta 16
        sta 22
        sta 23

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda #$00
        sta 16
        sta 23
        sta 24

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda #$00
        sta 17
        sta 24
        sta 25

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 17
        sta 25
        sta 26

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda #$00
        sta 17
        sta 26
        sta 27

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

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 27
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 26
        sta 25
        sta 24
        sta 12

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 24
        sta 23
        sta 22
        sta 12

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 22
        sta 21
        sta 12

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22
        sta 12

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 23
        sta 12

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 24
        sta 12

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 25
        sta 12

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 25
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 26
        sta 27
        sta 12

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 27
        sta 13

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 27
        sta 13

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda #$00
        sta 26
        sta 13

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 26
        sta 14

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda #$00
        sta 25
        sta 21
        sta 14

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

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda #$00
        sta 24
        sta 22
        sta 19
        sta 18
        sta 15

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

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda #$00
        sta 23
        sta 16
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
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17
        lda 23
        ora #$09
        sta 23
        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda 16
        ora #$90
        sta 16
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 22
        ora #$09
        sta 22
        lda 23
        ora #$90
        sta 23
        lda 24
        ora #$09
        sta 24

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 15
        ora #$09
        sta 15
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22
        lda 25
        ora #$90
        sta 25

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda 15
        ora #$90
        sta 15
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 25
        ora #$09
        sta 25

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 14
        ora #$09
        sta 14
        lda 26
        ora #$90
        sta 26

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda 14
        ora #$09
        sta 14
        lda 26
        ora #$09
        sta 26

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 14
        ora #$90
        sta 14
        lda 27
        ora #$90
        sta 27

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 13
        ora #$09
        sta 13
        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$09
        sta 27

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 13
        ora #$90
        sta 13
        lda 13
        ora #$90
        sta 13
        lda 27
        ora #$90
        sta 27
        lda 26
        ora #$09
        sta 26

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 13
        ora #$90
        sta 13
        lda 26
        ora #$90
        sta 26
        lda 25
        ora #$09
        sta 25

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 13
        ora #$09
        sta 13
        lda 25
        ora #$90
        sta 25
        lda 24
        ora #$09
        sta 24

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 24
        ora #$90
        sta 24
        lda 13
        ora #$09
        sta 13
        lda 24
        ora #$90
        sta 24

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 24
        ora #$09
        sta 24
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 25
        ora #$90
        sta 25
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 25
        ora #$09
        sta 25
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 25
        ora #$09
        sta 25
        lda 14
        ora #$90
        sta 14
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 26
        ora #$90
        sta 26
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 26
        ora #$09
        sta 26
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 27
        ora #$90
        sta 27
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 27
        ora #$09
        sta 27
        lda 27
        ora #$09
        sta 27
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 27
        ora #$90
        sta 27
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 27
        ora #$90
        sta 27
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 26
        ora #$09
        sta 26
        lda 13
        ora #$90
        sta 13
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda 26
        ora #$90
        sta 26
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 26
        ora #$90
        sta 26
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda 25
        ora #$09
        sta 25
        lda 14
        ora #$09
        sta 14

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 25
        ora #$90
        sta 25
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 14
        ora #$09
        sta 14

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda 24
        ora #$09
        sta 24
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 17
        ora #$09
        sta 17
        lda 17
        ora #$90
        sta 17
        lda 15
        ora #$90
        sta 15

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 24
        ora #$09
        sta 24
        lda 22
        ora #$09
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 16
        ora #$09
        sta 16
        lda 15
        ora #$09
        sta 15

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16
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
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda 15
        ora #$09
        sta 15
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$09
        sta 22
        lda 24
        ora #$90
        sta 24

        lda >drawAddress
        clc
        adc #-2080
        tcd

        lda 15
        ora #$90
        sta 15
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 24
        ora #$09
        sta 24

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda 14
        ora #$09
        sta 14
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 25
        ora #$90
        sta 25

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda 14
        ora #$90
        sta 14
        lda 25
        ora #$09
        sta 25

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda 14
        ora #$90
        sta 14
        lda 26
        ora #$90
        sta 26

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda 13
        ora #$09
        sta 13
        lda 26
        ora #$09
        sta 26

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda 13
        ora #$90
        sta 13
        lda 27
        ora #$90
        sta 27
        lda 27
        ora #$90
        sta 27

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 12
        ora #$09
        sta 12
        lda 12
        ora #$09
        sta 12
        lda 26
        ora #$09
        sta 26
        lda 26
        ora #$90
        sta 26

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 12
        ora #$09
        sta 12
        lda 25
        ora #$09
        sta 25
        lda 25
        ora #$90
        sta 25

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 13
        ora #$90
        sta 13
        lda 24
        ora #$09
        sta 24
        lda 24
        ora #$90
        sta 24

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$09
        sta 23
        lda 13
        ora #$90
        sta 13
        lda 23
        ora #$09
        sta 23

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 24
        ora #$90
        sta 24
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 24
        ora #$09
        sta 24
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 25
        ora #$90
        sta 25
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 25
        ora #$90
        sta 25
        lda 13
        ora #$09
        sta 13
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 25
        ora #$09
        sta 25
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 26
        ora #$90
        sta 26
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 26
        ora #$09
        sta 26
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 27
        ora #$90
        sta 27
        lda 27
        ora #$90
        sta 27
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 26
        ora #$09
        sta 26
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 26
        ora #$09
        sta 26
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 26
        ora #$90
        sta 26
        lda 12
        ora #$09
        sta 12
        lda 12
        ora #$09
        sta 12

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda 25
        ora #$09
        sta 25
        lda 13
        ora #$90
        sta 13

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda 25
        ora #$09
        sta 25
        lda 13
        ora #$09
        sta 13

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda 25
        ora #$90
        sta 25
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda 24
        ora #$09
        sta 24
        lda 18
        ora #$90
        sta 18
        lda 17
        ora #$09
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 14
        ora #$90
        sta 14

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda 24
        ora #$90
        sta 24
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 18
        ora #$09
        sta 18
        lda 17
        ora #$90
        sta 17
        lda 16
        ora #$09
        sta 16
        lda 14
        ora #$09
        sta 14

        lda >drawAddress
        clc
        adc #2080
        tcd

        lda 24
        ora #$90
        sta 24
        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 16
        ora #$90
        sta 16
        lda 15
        ora #$90
        sta 15

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$90
        sta 23
        lda 22
        ora #$09
        sta 22
        lda 15
        ora #$09
        sta 15
        lda 15
        ora #$09
        sta 15
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

        lda >drawAddress
        clc
        adc #-2240
        tcd

        lda #$00
        sta 15
        sta 17
        sta 18
        sta 22
        sta 24

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

        lda >drawAddress
        clc
        adc #-1920
        tcd

        lda #$00
        sta 14
        sta 19
        sta 20
        sta 25

        lda >drawAddress
        clc
        adc #-1760
        tcd

        lda #$00
        sta 14
        sta 25

        lda >drawAddress
        clc
        adc #-1600
        tcd

        lda #$00
        sta 14
        sta 26

        lda >drawAddress
        clc
        adc #-1440
        tcd

        lda #$00
        sta 13
        sta 26

        lda >drawAddress
        clc
        adc #-1280
        tcd

        lda #$00
        sta 13
        sta 27

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 12
        sta 26

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 12
        sta 25

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 13
        sta 24

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 23
        sta 13
        sta 23

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 24
        sta 13

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 24
        sta 13

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 25
        sta 13

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 25
        sta 13

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 25
        sta 13

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 26
        sta 13

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 26
        sta 13

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 27
        sta 13

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 26
        sta 13

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 26
        sta 12

        lda >drawAddress
        clc
        adc #1280
        tcd

        lda #$00
        sta 25
        sta 13

        lda >drawAddress
        clc
        adc #1440
        tcd

        lda #$00
        sta 25
        sta 13

        lda >drawAddress
        clc
        adc #1600
        tcd

        lda #$00
        sta 25
        sta 14

        lda >drawAddress
        clc
        adc #1760
        tcd

        lda #$00
        sta 24
        sta 18
        sta 17
        sta 14

        lda >drawAddress
        clc
        adc #1920
        tcd

        lda #$00
        sta 24
        sta 20
        sta 19
        sta 18
        sta 17
        sta 16
        sta 14

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

        lda >drawAddress
        clc
        adc #2240
        tcd

        lda #$00
        sta 23
        sta 22
        sta 15
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
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 22
        ora #$09
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 19
        ora #$90
        sta 19
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 23
        ora #$90
        sta 23
        lda 21
        ora #$09
        sta 21
        lda 19
        ora #$09
        sta 19
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 23
        ora #$09
        sta 23
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$90
        sta 20
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 24
        ora #$90
        sta 24
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$09
        sta 22
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$09
        sta 18
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
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$90
        sta 21
        lda 18
        ora #$09
        sta 18
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 22
        ora #$09
        sta 22
        lda 21
        ora #$90
        sta 21
        lda 19
        ora #$90
        sta 19
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 23
        ora #$90
        sta 23
        lda 20
        ora #$09
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$09
        sta 22
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$09
        sta 22
        lda 22
        ora #$09
        sta 22
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 22
        ora #$09
        sta 22
        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 18
        ora #$90
        sta 18
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

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 22
        sta 21
        sta 18
        sta 17

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 22
        sta 21
        sta 19
        sta 17

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 23
        sta 20
        sta 19
        sta 16

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 23
        sta 20
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 22
        sta 16

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 22
        sta 23
        sta 16
        sta 17

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 21
        sta 22
        sta 17

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 18
        sta 19
        sta 20
        sta 21
        sta 18
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
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 19
        ora #$90
        sta 19
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$09
        sta 22

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 19
        ora #$90
        sta 19
        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$09
        sta 23

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 19
        ora #$09
        sta 19
        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 24
        ora #$90
        sta 24
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 24
        ora #$90
        sta 24
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$90
        sta 23
        lda 22
        ora #$09
        sta 22
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$09
        sta 22
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$90
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$09
        sta 23
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 23
        ora #$90
        sta 23
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$09
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 19
        ora #$90
        sta 19
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18
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
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 18
        ora #$09
        sta 18
        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 18
        ora #$09
        sta 18
        lda 22
        ora #$09
        sta 22
        lda 23
        ora #$90
        sta 23

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 19
        ora #$90
        sta 19
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$09
        sta 17
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$90
        sta 23
        lda 22
        ora #$09
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$90
        sta 22
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 22
        ora #$09
        sta 22
        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$90
        sta 23
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 22
        ora #$09
        sta 22
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$90
        sta 21
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18
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

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 18
        sta 21
        sta 22

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 18
        sta 22
        sta 23

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 19
        sta 23
        sta 16
        sta 17
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 23
        sta 22
        sta 16

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 21
        sta 20
        sta 16

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 21
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 22
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 22
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 23
        sta 17

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 22
        sta 20
        sta 17

        lda >drawAddress
        clc
        adc #960
        tcd

        lda #$00
        sta 22
        sta 21
        sta 19
        sta 17

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 21
        sta 18
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
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 18
        ora #$90
        sta 18
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$09
        sta 22

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 17
        ora #$09
        sta 17
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 23
        ora #$90
        sta 23

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 17
        ora #$90
        sta 17
        lda 23
        ora #$09
        sta 23

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16
        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 23
        ora #$09
        sta 23

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 16
        ora #$09
        sta 16
        lda 23
        ora #$90
        sta 23
        lda 22
        ora #$09
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$90
        sta 22
        lda 17
        ora #$90
        sta 17
        lda 22
        ora #$90
        sta 22

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$09
        sta 22
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 23
        ora #$90
        sta 23
        lda 17
        ora #$90
        sta 17
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$09
        sta 23
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 24
        ora #$90
        sta 24
        lda 24
        ora #$90
        sta 24
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 23
        ora #$90
        sta 23
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 23
        ora #$90
        sta 23
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$09
        sta 22
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 18
        ora #$09
        sta 18
        lda 17
        ora #$09
        sta 17

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18
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
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda 17
        ora #$09
        sta 17
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 22
        ora #$90
        sta 22

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda 17
        ora #$90
        sta 17
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 22
        ora #$09
        sta 22

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda 16
        ora #$09
        sta 16
        lda 23
        ora #$90
        sta 23

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$90
        sta 23

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 16
        ora #$90
        sta 16
        lda 22
        ora #$09
        sta 22
        lda 22
        ora #$90
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$09
        sta 21
        lda 16
        ora #$09
        sta 16
        lda 21
        ora #$09
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$90
        sta 22
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 22
        ora #$09
        sta 22
        lda 16
        ora #$09
        sta 16
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 23
        ora #$09
        sta 23
        lda 23
        ora #$09
        sta 23
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 23
        ora #$90
        sta 23
        lda 16
        ora #$90
        sta 16
        lda 16
        ora #$90
        sta 16

        lda >drawAddress
        clc
        adc #640
        tcd

        lda 22
        ora #$09
        sta 22
        lda 16
        ora #$09
        sta 16

        lda >drawAddress
        clc
        adc #800
        tcd

        lda 22
        ora #$09
        sta 22
        lda 19
        ora #$90
        sta 19
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #960
        tcd

        lda 22
        ora #$90
        sta 22
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 18
        ora #$90
        sta 18
        lda 17
        ora #$90
        sta 17

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 17
        ora #$09
        sta 17
        lda 17
        ora #$09
        sta 17
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

        lda >drawAddress
        clc
        adc #-1120
        tcd

        lda #$00
        sta 17
        sta 19
        sta 20
        sta 21
        sta 22

        lda >drawAddress
        clc
        adc #-960
        tcd

        lda #$00
        sta 17
        sta 20
        sta 22

        lda >drawAddress
        clc
        adc #-800
        tcd

        lda #$00
        sta 16
        sta 23

        lda >drawAddress
        clc
        adc #-640
        tcd

        lda #$00
        sta 16
        sta 23

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 16
        sta 22

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 16
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 22
        sta 16

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 22
        sta 16

        lda >drawAddress
        clc
        adc #160
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #320
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 23
        sta 16

        lda >drawAddress
        clc
        adc #640
        tcd

        lda #$00
        sta 22
        sta 16

        lda >drawAddress
        clc
        adc #800
        tcd

        lda #$00
        sta 22
        sta 19
        sta 18
        sta 17

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

        lda >drawAddress
        clc
        adc #1120
        tcd

        lda #$00
        sta 21
        sta 17
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
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$09
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$90
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$90
        sta 22
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 19
        ora #$09
        sta 19
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
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$90
        sta 19

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$90
        sta 21
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 19
        ora #$90
        sta 19
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

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 21
        sta 20
        sta 19
        sta 18

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 20
        sta 18

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
        sta 18

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 19
        sta 20
        sta 21
        sta 19
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
        ora #$09
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 20
        ora #$90
        sta 20
        lda 21
        ora #$09
        sta 21
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 22
        ora #$90
        sta 22
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$09
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$90
        sta 19

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$09
        sta 19
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
        ora #$90
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$09
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 19
        ora #$09
        sta 19
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$90
        sta 19
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

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 19
        sta 21
        sta 18
        sta 19

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda #$00
        sta 21
        sta 18

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda #$00
        sta 21
        sta 20
        sta 18

        lda >drawAddress
        clc
        adc #0
        tcd

        lda #$00
        sta 20
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
        sta 20
        sta 19
        sta 18

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 20
        sta 19
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
        ora #$09
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$90
        sta 20
        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 19
        ora #$90
        sta 19
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 21
        ora #$09
        sta 21

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18
        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 21
        ora #$09
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 21
        ora #$90
        sta 21
        lda 18
        ora #$09
        sta 18
        lda 21
        ora #$90
        sta 21

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 22
        ora #$90
        sta 22
        lda 22
        ora #$90
        sta 22
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$09
        sta 21
        lda 20
        ora #$90
        sta 20
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$90
        sta 19

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 21
        ora #$90
        sta 21
        lda 21
        ora #$90
        sta 21
        lda 20
        ora #$09
        sta 20
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$90
        sta 19
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
        ora #$90
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$09
        sta 19
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda 18
        ora #$09
        sta 18
        lda 20
        ora #$90
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 21
        ora #$90
        sta 21

        lda >drawAddress
        clc
        adc #-320
        tcd

        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$90
        sta 21

        lda >drawAddress
        clc
        adc #-160
        tcd

        lda 20
        ora #$09
        sta 20
        lda 18
        ora #$90
        sta 18
        lda 20
        ora #$09
        sta 20

        lda >drawAddress
        clc
        adc #0
        tcd

        lda 21
        ora #$90
        sta 21
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #160
        tcd

        lda 21
        ora #$09
        sta 21
        lda 21
        ora #$09
        sta 21
        lda 18
        ora #$90
        sta 18
        lda 18
        ora #$90
        sta 18

        lda >drawAddress
        clc
        adc #320
        tcd

        lda 21
        ora #$90
        sta 21
        lda 19
        ora #$09
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 19
        ora #$90
        sta 19
        lda 18
        ora #$09
        sta 18

        lda >drawAddress
        clc
        adc #480
        tcd

        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$09
        sta 20
        lda 20
        ora #$90
        sta 20
        lda 18
        ora #$09
        sta 18
        lda 18
        ora #$09
        sta 18
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

        lda >drawAddress
        clc
        adc #-480
        tcd

        lda #$00
        sta 18
        sta 20
        sta 21

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
        sta 20
        sta 18
        sta 20

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
        sta 19
        sta 18

        lda >drawAddress
        clc
        adc #480
        tcd

        lda #$00
        sta 20
        sta 18
        _spriteFooter
        rtl


drawAddress dc i4'0'


        end
