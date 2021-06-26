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
        using gameData
        using controlsData
        using playerData


; takes a value in A
; reduces it
; returns in A

slowDownA entry

        bmi slowDownNeg

slowDownPos anop
        dec a
        dec a
        bmi resetToZero
        rtl

slowDownNeg anop
        eor #$ffff
        inc a

        dec a
        dec a

        bmi resetToZero

        eor #$ffff
        inc a

        rtl

resetToZero anop
        lda #0
        rtl



spawnPlayer entry

        lda hyperspaceTimer
        cmp #0
        beq alreadyAliveCheck
        rtl

alreadyAliveCheck anop
        ldx #OBJECT_PLAYER
        lda lifetimeList,x
        cmp #0
        beq continueSpawnPlayer
; player is already alive
        rtl

continueSpawnPlayer anop

        jsl usePlayerLife

        lda #MIDSCREEN_X
        sta xPosList,x

        lda #MIDSCREEN_Y
        sta yPosList,x

        lda #0
        sta xSpeedList,x
        sta ySpeedList,x
        sta rotationSpeed,x

        lda #180
        sta angleList,x

        lda #-1
        sta lifetimeList,x

        ldx #OBJECT_THRUST

        lda #MIDSCREEN_X
        sta xPosList,x

        lda #MIDSCREEN_Y
        sta yPosList,x

        lda #0
        sta xSpeedList,x
        sta ySpeedList,x
        sta rotationSpeed,x

        lda #180
        sta angleList,x

        lda #-1
        sta lifetimeList,x

        stz hyperspaceTimer

        rtl



runPlayerShip entry

        ldx #OBJECT_PLAYER

        lda hyperspaceTimer
        cmp #0
        beq notInHyperspaceShort

        dec hyperspaceTimer
        lda hyperspaceTimer
        cmp #0
        beq exitHyperspace
        rtl

notInHyperspaceShort anop
        brl notInHyperspace

exitHyperspace anop

        stx savex
        sty savey
        lda #300
        pha
        jsl getRandom
        ldx savex
        ldy savey
        clc
        adc #10
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta xPosList,x

        stx savex
        sty savey
        lda #180
        pha
        jsl getRandom
        ldx savex
        ldy savey
        clc
        adc #10
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta yPosList,x

        stz xSpeedList,x
        stz ySpeedList,x

; chance of blowing up after hyperspace
        stx savex
        sty savey
        lda #3
        pha
        jsl getRandom
        sta temp
        ldx savex
        ldy savey
        lda temp
        cmp #0
        beq blowUp
        bra dontBlowUp

blowUp anop

        jsl playExplode1Sound

; throw some particles
        lda #OBJECT_PLAYER
        jsl startExplosion

; throw some wreckage
        lda #OBJECT_PLAYER
        jsl startWreckageExplosion

        rtl

dontBlowUp anop

        lda #-1
        sta lifetimeList,x

        stx savex
        lda #-1
        ldx #OBJECT_THRUST
        sta lifetimeList,x
        ldx savex

        rtl

notInHyperspace anop

; see if we are dead x_x

        lda lifetimeList,x
        cmp #0
        beq playerDead
        jmp notDead

playerDead anop
        jsl stopThrustSound
        dec playerRespawnTimer
        lda playerRespawnTimer
        bmi checkForRespawnKey
        rtl

; wait for the player to hit the fire button and respawn them
checkForRespawnKey anop

        lda hyperspaceTimer
        cmp #0
        beq check2
        rtl

check2 anop
        lda keydownFire
        cmp #1
        beq playerToRespawn
        rtl

playerToRespawn anop

        jsl spawnPlayer
        rtl

notDead anop

; zero out rotation speed
        lda #0
        sta rotationSpeedList,x

; apply "friction" to the ship if the player is not pressing thrust
        lda keydownThrust
        cmp #1
        beq dontSlowDown

        stx savex
        sty savey
        jsl stopThrustSound
        ldx savex
        ldy savey

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

        lda angleList,x
        sta playerAngle

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
        beq thrustShortJump

        cmp keydownFire
        beq onKeydownFire

        cmp keydownHyperspace
        beq onKeydownHyperspace

        rtl

thrustShortJump anop
        jmp onKeydownThrust

        rtl

onKeydownHyperspace anop
        lda hyperspaceTimer
        cmp #0
        beq startHyperspace
        rtl

startHyperspace anop
        lda #50
        sta hyperspaceTimer

        ldx #OBJECT_PLAYER
        stz lifetimeList,x
        stx savex
        ldx #OBJECT_THRUST
        stz lifetimeList,x
        ldx savex

        rtl

onKeydownLeft anop
        lda #-10
        sta rotationSpeedList,x
        rtl

onKeydownRight anop
        lda #10
        sta rotationSpeedList,x
        rtl

onKeydownFire anop
        ldx #OBJECT_PLAYER

        lda xPosList,x
        sta xpos

        lda yPosList,x
        sta ypos

        lda xSpeedList,x
        sta xspeed

        lda ySpeedList,x
        sta yspeed

;        lda angleList,x
;        sta playerAngle

; ask for a player missile - accumulator will be -1 if none available
        stx savex
        jsr getAvailablePlayerMissile
        ldx savex
        cmp #-1
        bne fireMissile
        rtl

fireMissile anop
        tax

        lda xpos
        sta xPosList,x

        lda ypos
        sta yPosList,x

; vector the missile x/y speed to the angle of the ship
; this also adds the player ship's speed to the missile speed
        lda #0
        sta param1
        lda #MISSILE_SPEED
        sta param2

        lda playerAngle
        sta param3

        stx savex
        sty savey
        jsl rotate
        ldx savex
        ldy savey

        lda result1
        asl a
        asl a
        clc
        adc xspeed
        sta xSpeedList,x

        lda result2
        asl a
        asl a
        clc
        adc yspeed
        sta ySpeedList,x

        lda #MISSILE_LIFETIME
        sta lifetimeList,x

; play fire sound
        jsl playFireSound

        rtl


onKeydownThrust anop

        stx savex
        sty savey
        jsl startThrustSound
        ldx savex
        ldy savey

; vector the thrust
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

savex dc i2'0'
savey dc i2'0'

temp dc i2'0'

speedLimit gequ $0600

        end


playerData data

playerAngle dc i2'0'

hyperspaceTimer dc i2'0'

        end

