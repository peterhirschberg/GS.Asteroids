;
;  playerShip.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

playerShip start
        using globalData
        using objectData
        using controlsData


; takes a value in A
; reduces it
; returns in A

slowDownA entry

        bmi slowDownNeg

slowDownPos anop
        dec a
        dec a
        dec a
        bmi resetToZero
        rtl

slowDownNeg anop
        eor #$ffff
        inc a

        dec a
        dec a
        dec a

        bmi resetToZero

        eor #$ffff
        inc a

        rtl

resetToZero anop
        lda #0
        rtl


runPlayerShip entry

        ldx #OBJECT_PLAYER

; zero out rotation speed
        lda #0
        sta rotationSpeedList,x

; apply "friction" to the ship
        lda keydownThrust
        cmp #1
        beq dontSlowDown

        lda xSpeedList,x
        jsl slowDownA
        sta xSpeedList,x

        lda ySpeedList,x
        jsl slowDownA
        sta ySpeedList,x


dontSlowDown anop


; check the controls
        jsl checkKeys


; get the ship data to update the thrust object with

        ldx #OBJECT_PLAYER

        lda xPosList,x
        sta xpos

        lda yPosList,x
        sta ypos

        lda xSpeedList,x
        sta xspeed

        lda ySpeedList,x
        sta yspeed

        lda rotationSpeedList,x
        sta rotationSpeed

; update the thrust object
        ldx #OBJECT_THRUST

; set x position
        lda xpos
        sta xPosList,x

; set y position
        lda ypos
        sta yPosList,x

; set x speed
        lda xspeed
        sta xSpeedList,x

; set y speed
        lda yspeed
        sta ySpeedList,x

; set rotation speed
        lda rotationSpeed
        sta rotationSpeedList,x

; set the color (based on thrust key)

        lda keydownThrust
        cmp #1
        beq setThrustColorOn

        lda #$00
        sta colorList,x

        rtl

setThrustColorOn anop

        lda #$ff
        sta colorList,x

        rtl


checkKeys entry

        lda #1
        cmp keydownLeft
        beq onKeydownLeft

        cmp keydownRight
        beq onKeydownRight

        cmp keydownThrust
        beq onKeydownThrust

        rtl


onKeydownLeft anop
        lda #-12
        sta rotationSpeedList,x
        rtl

onKeydownRight anop
        lda #12
        sta rotationSpeedList,x
        rtl

onKeydownThrust anop

        lda #0
        sta param1
        lda #4
        sta param2

        lda angleList,x
        sta param3

        stx savex
        sty savey
        jsl rotate
        ldx savex
        ldy savey

        lda result1
        bmi xNegSpeed

xPosSpeed anop
        asl a
        asl a

        sta fixedSpeedX
        lda xSpeedList,x
        clc
        adc fixedSpeedX
        sta xSpeedList,x

        bra doYSpeed

xNegSpeed anop
        eor #$ffff
        inc a

        asl a
        asl a

        eor #$ffff
        inc a

        sta fixedSpeedX
        lda xSpeedList,x
        clc
        adc fixedSpeedX
        sta xSpeedList,x

doYSpeed anop
        lda result2
        bmi yNegSpeed

yPosSpeed anop
        asl a
        asl a

        sta fixedSpeedY
        lda ySpeedList,x
        clc
        adc fixedSpeedY
        sta ySpeedList,x

        bra xCheckLimit

yNegSpeed anop

        eor #$ffff
        inc a

        asl a
        asl a

        eor #$ffff
        inc a

        sta fixedSpeedY
        lda ySpeedList,x
        clc
        adc fixedSpeedY
        sta ySpeedList,x

xCheckLimit anop
        lda xSpeedList,x
        bmi xCheckLimitNeg

xCheckLimitPos anop
        cmp #speedLimit
        bcs xLimitPos
        bra yCheckLimit

xLimitPos anop
        lda #speedLimit
        sta xSpeedList,x
        bra yCheckLimit

xCheckLimitNeg anop
        eor #$ffff
        inc a

        cmp #speedLimit
        bcs xLimitNeg
        bra yCheckLimit

xLimitNeg anop
        lda #speedLimit

        eor #$ffff
        inc a

        sta xSpeedList,x

yCheckLimit anop
        lda ySpeedList,x
        bmi yCheckLimitNeg

yCheckLimitPos anop
        cmp #speedLimit
        bcs yLimitPos
        bra speedDone

yLimitPos anop
        lda #speedLimit
        sta ySpeedList,x
        bra speedDone

yCheckLimitNeg anop

        eor #$ffff
        inc a

        cmp #speedLimit
        bcs yLimitNeg
        bra speedDone

yLimitNeg anop
        lda #speedLimit

        eor #$ffff
        inc a

        sta ySpeedList,x

speedDone anop

        rtl


fixedSpeedX dc i2'0'
fixedSpeedY dc i2'0'

objectBaseAddr dc a4'0'

xpos dc i2'0'
ypos dc i2'0'
xspeed dc i2'0'
yspeed dc i2'0'
rotationSpeed dc i2'0'

savex               dc i2'0'
savey               dc i2'0'

speedLimit gequ $0600

        end
