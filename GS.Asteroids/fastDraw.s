;
;  fastDraw.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 6/25/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global

fastDraw start
        using globalData
        using objectData
        using playerData


fastDrawObject entry

        lda #SHAPE_OFFSET_PLAYER
        cmp objectShapeDataIndex
        bne checkThrust
        jsl fastDrawPlayerShip
        rtl

checkThrust anop
        lda #SHAPE_OFFSET_THRUST
        cmp objectShapeDataIndex
        bne next0
        jsl fastDrawThrust
        rtl

drawThrust anop
        jsl fastDrawThrust
        rtl

next0 anop
        lda #SHAPE_OFFSET_LARGE_ROCK1
        cmp objectShapeDataIndex
        beq prerenderedLargeRock1Short
        jmp next1
prerenderedLargeRock1Short anop
        brl prerenderedLargeRock1
next1 anop
        lda #SHAPE_OFFSET_LARGE_ROCK2
        cmp objectShapeDataIndex
        beq prerenderedLargeRock2Short
        jmp next2
prerenderedLargeRock2Short anop
        brl prerenderedLargeRock2
next2 anop
        lda #SHAPE_OFFSET_LARGE_ROCK3
        cmp objectShapeDataIndex
        beq prerenderedLargeRock3Short
        jmp next3
prerenderedLargeRock3Short anop
        jmp prerenderedLargeRock3
next3 anop
        lda #SHAPE_OFFSET_MEDIUM_ROCK1
       cmp objectShapeDataIndex
       beq prerenderedMediumRock1Short
        jmp next4
prerenderedMediumRock1Short anop
        jmp prerenderedMediumRock1
next4 anop
        lda #SHAPE_OFFSET_MEDIUM_ROCK2
       cmp objectShapeDataIndex
       beq prerenderedMediumRock2Short
        bra next5
prerenderedMediumRock2Short anop
        brl prerenderedMediumRock2
next5 anop
        lda #SHAPE_OFFSET_MEDIUM_ROCK3
       cmp objectShapeDataIndex
       beq prerenderedMediumRock3Short
        jmp next6
prerenderedMediumRock3Short anop
        brl prerenderedMediumRock3
next6 anop
        lda #SHAPE_OFFSET_SMALL_ROCK1
        cmp objectShapeDataIndex
        beq prerenderedSmallRock1Short
        jmp next7
prerenderedSmallRock1Short anop
        brl prerenderedSmallRock1
next7 anop
        lda #SHAPE_OFFSET_SMALL_ROCK2
        cmp objectShapeDataIndex
        beq prerenderedSmallRock2Short
        jmp next8
prerenderedSmallRock2Short anop
        brl prerenderedSmallRock2
next8 anop
        lda #SHAPE_OFFSET_SMALL_ROCK3
        cmp objectShapeDataIndex
        beq prerenderedSmallRock3Short
        jmp next9
prerenderedSmallRock3Short anop
        brl prerenderedSmallRock3
next9 anop
        lda #SHAPE_OFFSET_LARGE_SAUCER
        cmp objectShapeDataIndex
        beq prerenderedLargeSaucerShort
        jmp next10
prerenderedLargeSaucerShort anop
        brl prerenderedLargeSaucer
        rtl
next10 anop
        lda #SHAPE_OFFSET_DOT
        cmp objectShapeDataIndex
        beq doDrawDot
        rtl
doDrawDot anop
        lda #$0f
        sta currentColorRight
        lda #$f0
        sta currentColorLeft
        lda drawX
        sta x1
        lda drawY
        sta y1
        jsl drawDot
        rtl

prerenderedLargeRock1 anop
        lda drawX
        and #1
        cmp #1
        beq doOddLargeRock1
        jsl spriteLargeRock1Even
        rtl
doOddLargeRock1 anop
        jsl spriteLargeRock1Odd
        rtl
prerenderedLargeRock2 anop
        lda drawX
        and #1
        cmp #1
        beq doOddLargeRock2
        jsl spriteLargeRock2Even
        rtl
doOddLargeRock2 anop
        jsl spriteLargeRock2Odd
        rtl
prerenderedLargeRock3 anop
        lda drawX
        and #1
        cmp #1
        beq doOddLargeRock3
        jsl spriteLargeRock3Even
        rtl
doOddLargeRock3 anop
        jsl spriteLargeRock3Odd
        rtl

prerenderedMediumRock1 anop
       lda drawX
       and #1
       cmp #1
       beq doOddMediumRock1
       jsl spriteMediumRock1Even
       rtl
doOddMediumRock1 anop
       jsl spriteMediumRock1Odd
       rtl
prerenderedMediumRock2 anop
       lda drawX
       and #1
       cmp #1
       beq doOddMediumRock2
       jsl spriteMediumRock2Even
       rtl
doOddMediumRock2 anop
       jsl spriteMediumRock2Odd
       rtl
prerenderedMediumRock3 anop
       lda drawX
       and #1
       cmp #1
       beq doOddMediumRock3
       jsl spriteMediumRock3Even
       rtl
doOddMediumRock3 anop
       jsl spriteMediumRock3Odd
       rtl

prerenderedSmallRock1 anop
       lda drawX
       and #1
       cmp #1
       beq doOddSmallRock1
       jsl spriteSmallRock1Even
       rtl
doOddSmallRock1 anop
       jsl spriteSmallRock1Odd
       rtl
prerenderedSmallRock2 anop
       lda drawX
       and #1
       cmp #1
       beq doOddSmallRock2
       jsl spriteSmallRock2Even
       rtl
doOddSmallRock2 anop
       jsl spriteSmallRock2Odd
       rtl
prerenderedSmallRock3 anop
       lda drawX
       and #1
       cmp #1
       beq doOddSmallRock3
       jsl spriteSmallRock3Even
       rtl
doOddSmallRock3 anop
        jsl spriteSmallRock3Odd
        rtl

prerenderedLargeSaucer anop
       lda drawX
       and #1
       cmp #1
       beq doOddLargeSaucer
       jsl spriteLargeSaucerEven
       rtl
doOddLargeSaucer anop
        jsl spriteLargeSaucerOdd
        rtl

        rtl


fastEraseObject entry

        lda #SHAPE_OFFSET_PLAYER
        cmp objectShapeDataIndex
        bne notPlayerShip
        jsl fastErasePlayerShip
        jsl fastEraseThrust
        rtl

notPlayerShip anop

        lda #SHAPE_OFFSET_LARGE_ROCK1
        cmp objectShapeDataIndex
        beq eraseLargeRock1

        lda #SHAPE_OFFSET_LARGE_ROCK2
        cmp objectShapeDataIndex
        beq eraseLargeRock2

        lda #SHAPE_OFFSET_LARGE_ROCK3
        cmp objectShapeDataIndex
        beq eraseLargeRock3

        lda #SHAPE_OFFSET_MEDIUM_ROCK1
        cmp objectShapeDataIndex
        beq eraseMediumRock1

        lda #SHAPE_OFFSET_MEDIUM_ROCK2
        cmp objectShapeDataIndex
        beq eraseMediumRock2

        lda #SHAPE_OFFSET_MEDIUM_ROCK3
        cmp objectShapeDataIndex
        beq eraseMediumRock3

        lda #SHAPE_OFFSET_SMALL_ROCK1
        cmp objectShapeDataIndex
        beq eraseSmallRock1

        lda #SHAPE_OFFSET_SMALL_ROCK2
        cmp objectShapeDataIndex
        beq eraseSmallRock2

        lda #SHAPE_OFFSET_SMALL_ROCK3
        cmp objectShapeDataIndex
        beq eraseSmallRock3

        lda #SHAPE_OFFSET_LARGE_SAUCER
        cmp objectShapeDataIndex
        beq eraseLargeSaucer

        lda #SHAPE_OFFSET_SMALL_SAUCER
        cmp objectShapeDataIndex
        beq eraseSmallSaucer

        lda #SHAPE_OFFSET_DOT
        cmp objectShapeDataIndex
        beq doEraseDot

        rtl

eraseLargeRock1 anop
        jsl spriteLargeRock1Erase
        rtl
eraseLargeRock2 anop
        jsl spriteLargeRock2Erase
        rtl
eraseLargeRock3 anop
        jsl spriteLargeRock3Erase
        rtl

eraseMediumRock1 anop
        jsl spriteMediumRock1Erase
        rtl
eraseMediumRock2 anop
        jsl spriteMediumRock2Erase
        rtl
eraseMediumRock3 anop
        jsl spriteMediumRock3Erase
        rtl

eraseSmallRock1 anop
        jsl spriteSmallRock1Erase
        rtl
eraseSmallRock2 anop
        jsl spriteSmallRock2Erase
        rtl
eraseSmallRock3 anop
        jsl spriteSmallRock3Erase
        rtl

eraseLargeSaucer anop
        jsl spriteLargeSaucerErase
        rtl

eraseSmallSaucer anop
        jsl spriteSmallSaucerErase
        rtl

doEraseDot anop
        lda drawX
        sta x1
        lda drawY
        sta y1
        jsl eraseDot

        rtl



fastDrawPlayerShip entry

; Credit for the following self-modifying code goes to James Noyes, Jay Craft, Dagen Brock, Jeremy Rand
; Thank you!!

        lda drawX
        and #1
        cmp #1
        beq drawPlayerOdd

; even
        lda playerAngle
        asl a
        tax
        lda shipAngleTable,x
        asl a
        asl a
        tax
        lda shipDrawTableEven,x
        sta jumpcmd1+1
        lda shipDrawTableEven+1,x
        sta jumpcmd1+2
jumpcmd1 jml $ffffff

drawPlayerOdd anop

        lda playerAngle
        asl a
        tax
        lda shipAngleTable,x
        asl a
        asl a
        tax
        lda shipDrawTableEven,x
        sta jumpcmd2+1
        lda shipDrawTableEven+1,x
        sta jumpcmd2+2
jumpcmd2 jml $ffffff



fastErasePlayerShip entry

        lda playerAngle
        asl a
        tax
        lda shipAngleTable,x
        asl a
        asl a
        tax
        lda shipEraseTable,x
        sta jumpcmd3+1
        lda shipEraseTable+1,x
        sta jumpcmd3+2
jumpcmd3 jml $ffffff
        rtl



fastDrawThrust entry

        lda drawX
        and #1
        cmp #1
        beq drawThrustOdd

; even
        lda playerAngle
        asl a
        tax
        lda shipAngleTable,x
        asl a
        asl a
        tax
        lda thrustDrawTableEven,x
        sta jumpcmd4+1
        lda thrustDrawTableEven+1,x
        sta jumpcmd4+2
jumpcmd4 jml $ffffff

drawThrustOdd anop

        lda playerAngle
        asl a
        tax
        lda shipAngleTable,x
        asl a
        asl a
        tax
        lda thrustDrawTableEven,x
        sta jumpcmd5+1
        lda thrustDrawTableEven+1,x
        sta jumpcmd5+2
jumpcmd5 jml $ffffff



fastEraseThrust entry

        lda playerAngle
        asl a
        tax
        lda shipAngleTable,x
        asl a
        asl a
        tax
        lda thrustEraseTable,x
        sta jumpcmd6+1
        lda thrustEraseTable+1,x
        sta jumpcmd6+2
jumpcmd6 jml $ffffff
        rtl



shipAngleTable anop
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
            dc i2'1'
            dc i2'1'
            dc i2'1'
            dc i2'1'
            dc i2'1'
            dc i2'1'
            dc i2'1'
            dc i2'1'
            dc i2'1'

            dc i2'2'
            dc i2'2'
            dc i2'2'
            dc i2'2'
            dc i2'2'
            dc i2'2'
            dc i2'2'
            dc i2'2'
            dc i2'2'
            dc i2'2'

            dc i2'3'
            dc i2'3'
            dc i2'3'
            dc i2'3'
            dc i2'3'
            dc i2'3'
            dc i2'3'
            dc i2'3'
            dc i2'3'
            dc i2'3'

            dc i2'4'
            dc i2'4'
            dc i2'4'
            dc i2'4'
            dc i2'4'
            dc i2'4'
            dc i2'4'
            dc i2'4'
            dc i2'4'
            dc i2'4'

            dc i2'5'
            dc i2'5'
            dc i2'5'
            dc i2'5'
            dc i2'5'
            dc i2'5'
            dc i2'5'
            dc i2'5'
            dc i2'5'
            dc i2'5'

            dc i2'6'
            dc i2'6'
            dc i2'6'
            dc i2'6'
            dc i2'6'
            dc i2'6'
            dc i2'6'
            dc i2'6'
            dc i2'6'
            dc i2'6'

            dc i2'7'
            dc i2'7'
            dc i2'7'
            dc i2'7'
            dc i2'7'
            dc i2'7'
            dc i2'7'
            dc i2'7'
            dc i2'7'
            dc i2'7'

            dc i2'8'
            dc i2'8'
            dc i2'8'
            dc i2'8'
            dc i2'8'
            dc i2'8'
            dc i2'8'
            dc i2'8'
            dc i2'8'
            dc i2'8'

            dc i2'9'
            dc i2'9'
            dc i2'9'
            dc i2'9'
            dc i2'9'
            dc i2'9'
            dc i2'9'
            dc i2'9'
            dc i2'9'
            dc i2'9'

            dc i2'10'
            dc i2'10'
            dc i2'10'
            dc i2'10'
            dc i2'10'
            dc i2'10'
            dc i2'10'
            dc i2'10'
            dc i2'10'
            dc i2'10'

            dc i2'11'
            dc i2'11'
            dc i2'11'
            dc i2'11'
            dc i2'11'
            dc i2'11'
            dc i2'11'
            dc i2'11'
            dc i2'11'
            dc i2'11'

            dc i2'12'
            dc i2'12'
            dc i2'12'
            dc i2'12'
            dc i2'12'
            dc i2'12'
            dc i2'12'
            dc i2'12'
            dc i2'12'
            dc i2'12'

            dc i2'13'
            dc i2'13'
            dc i2'13'
            dc i2'13'
            dc i2'13'
            dc i2'13'
            dc i2'13'
            dc i2'13'
            dc i2'13'
            dc i2'13'

            dc i2'14'
            dc i2'14'
            dc i2'14'
            dc i2'14'
            dc i2'14'
            dc i2'14'
            dc i2'14'
            dc i2'14'
            dc i2'14'
            dc i2'14'

            dc i2'15'
            dc i2'15'
            dc i2'15'
            dc i2'15'
            dc i2'15'
            dc i2'15'
            dc i2'15'
            dc i2'15'
            dc i2'15'
            dc i2'15'

            dc i2'16'
            dc i2'16'
            dc i2'16'
            dc i2'16'
            dc i2'16'
            dc i2'16'
            dc i2'16'
            dc i2'16'
            dc i2'16'
            dc i2'16'

            dc i2'17'
            dc i2'17'
            dc i2'17'
            dc i2'17'
            dc i2'17'
            dc i2'17'
            dc i2'17'
            dc i2'17'
            dc i2'17'
            dc i2'17'

            dc i2'18'
            dc i2'18'
            dc i2'18'
            dc i2'18'
            dc i2'18'
            dc i2'18'
            dc i2'18'
            dc i2'18'
            dc i2'18'
            dc i2'18'

            dc i2'19'
            dc i2'19'
            dc i2'19'
            dc i2'19'
            dc i2'19'
            dc i2'19'
            dc i2'19'
            dc i2'19'
            dc i2'19'
            dc i2'19'

            dc i2'20'
            dc i2'20'
            dc i2'20'
            dc i2'20'
            dc i2'20'
            dc i2'20'
            dc i2'20'
            dc i2'20'
            dc i2'20'
            dc i2'20'

            dc i2'21'
            dc i2'21'
            dc i2'21'
            dc i2'21'
            dc i2'21'
            dc i2'21'
            dc i2'21'
            dc i2'21'
            dc i2'21'
            dc i2'21'

            dc i2'22'
            dc i2'22'
            dc i2'22'
            dc i2'22'
            dc i2'22'
            dc i2'22'
            dc i2'22'
            dc i2'22'
            dc i2'22'
            dc i2'22'

            dc i2'23'
            dc i2'23'
            dc i2'23'
            dc i2'23'
            dc i2'23'
            dc i2'23'
            dc i2'23'
            dc i2'23'
            dc i2'23'
            dc i2'23'

            dc i2'24'
            dc i2'24'
            dc i2'24'
            dc i2'24'
            dc i2'24'
            dc i2'24'
            dc i2'24'
            dc i2'24'
            dc i2'24'
            dc i2'24'

            dc i2'25'
            dc i2'25'
            dc i2'25'
            dc i2'25'
            dc i2'25'
            dc i2'25'
            dc i2'25'
            dc i2'25'
            dc i2'25'
            dc i2'25'

            dc i2'26'
            dc i2'26'
            dc i2'26'
            dc i2'26'
            dc i2'26'
            dc i2'26'
            dc i2'26'
            dc i2'26'
            dc i2'26'
            dc i2'26'

            dc i2'27'
            dc i2'27'
            dc i2'27'
            dc i2'27'
            dc i2'27'
            dc i2'27'
            dc i2'27'
            dc i2'27'
            dc i2'27'
            dc i2'27'

            dc i2'28'
            dc i2'28'
            dc i2'28'
            dc i2'28'
            dc i2'28'
            dc i2'28'
            dc i2'28'
            dc i2'28'
            dc i2'28'
            dc i2'28'

            dc i2'29'
            dc i2'29'
            dc i2'29'
            dc i2'29'
            dc i2'29'
            dc i2'29'
            dc i2'29'
            dc i2'29'
            dc i2'29'
            dc i2'29'

            dc i2'30'
            dc i2'30'
            dc i2'30'
            dc i2'30'
            dc i2'30'
            dc i2'30'
            dc i2'30'
            dc i2'30'
            dc i2'30'
            dc i2'30'

            dc i2'31'
            dc i2'31'
            dc i2'31'
            dc i2'31'
            dc i2'31'
            dc i2'31'
            dc i2'31'
            dc i2'31'
            dc i2'31'
            dc i2'31'

            dc i2'32'
            dc i2'32'
            dc i2'32'
            dc i2'32'
            dc i2'32'
            dc i2'32'
            dc i2'32'
            dc i2'32'
            dc i2'32'
            dc i2'32'

            dc i2'33'
            dc i2'33'
            dc i2'33'
            dc i2'33'
            dc i2'33'
            dc i2'33'
            dc i2'33'
            dc i2'33'
            dc i2'33'
            dc i2'33'

            dc i2'34'
            dc i2'34'
            dc i2'34'
            dc i2'34'
            dc i2'34'
            dc i2'34'
            dc i2'34'
            dc i2'34'
            dc i2'34'
            dc i2'34'

            dc i2'35'
            dc i2'35'
            dc i2'35'
            dc i2'35'
            dc i2'35'
            dc i2'35'
            dc i2'35'
            dc i2'35'
            dc i2'35'
            dc i2'35'


shipDrawTableOdd dc i4'spritePlayerOddAngle0'
                dc i4'spritePlayerOddAngle10'
                dc i4'spritePlayerOddAngle20'
                dc i4'spritePlayerOddAngle30'
                dc i4'spritePlayerOddAngle40'
                dc i4'spritePlayerOddAngle50'
                dc i4'spritePlayerOddAngle60'
                dc i4'spritePlayerOddAngle70'
                dc i4'spritePlayerOddAngle80'
                dc i4'spritePlayerOddAngle90'
                dc i4'spritePlayerOddAngle100'
                dc i4'spritePlayerOddAngle110'
                dc i4'spritePlayerOddAngle120'
                dc i4'spritePlayerOddAngle130'
                dc i4'spritePlayerOddAngle140'
                dc i4'spritePlayerOddAngle150'
                dc i4'spritePlayerOddAngle160'
                dc i4'spritePlayerOddAngle170'
                dc i4'spritePlayerOddAngle180'
                dc i4'spritePlayerOddAngle190'
                dc i4'spritePlayerOddAngle200'
                dc i4'spritePlayerOddAngle210'
                dc i4'spritePlayerOddAngle220'
                dc i4'spritePlayerOddAngle230'
                dc i4'spritePlayerOddAngle240'
                dc i4'spritePlayerOddAngle250'
                dc i4'spritePlayerOddAngle260'
                dc i4'spritePlayerOddAngle270'
                dc i4'spritePlayerOddAngle280'
                dc i4'spritePlayerOddAngle290'
                dc i4'spritePlayerOddAngle300'
                dc i4'spritePlayerOddAngle310'
                dc i4'spritePlayerOddAngle320'
                dc i4'spritePlayerOddAngle330'
                dc i4'spritePlayerOddAngle340'
                dc i4'spritePlayerOddAngle350'

shipDrawTableEven dc i4'spritePlayerEvenAngle0'
                dc i4'spritePlayerEvenAngle10'
                dc i4'spritePlayerEvenAngle20'
                dc i4'spritePlayerEvenAngle30'
                dc i4'spritePlayerEvenAngle40'
                dc i4'spritePlayerEvenAngle50'
                dc i4'spritePlayerEvenAngle60'
                dc i4'spritePlayerEvenAngle70'
                dc i4'spritePlayerEvenAngle80'
                dc i4'spritePlayerEvenAngle90'
                dc i4'spritePlayerEvenAngle100'
                dc i4'spritePlayerEvenAngle110'
                dc i4'spritePlayerEvenAngle120'
                dc i4'spritePlayerEvenAngle130'
                dc i4'spritePlayerEvenAngle140'
                dc i4'spritePlayerEvenAngle150'
                dc i4'spritePlayerEvenAngle160'
                dc i4'spritePlayerEvenAngle170'
                dc i4'spritePlayerEvenAngle180'
                dc i4'spritePlayerEvenAngle190'
                dc i4'spritePlayerEvenAngle200'
                dc i4'spritePlayerEvenAngle210'
                dc i4'spritePlayerEvenAngle220'
                dc i4'spritePlayerEvenAngle230'
                dc i4'spritePlayerEvenAngle240'
                dc i4'spritePlayerEvenAngle250'
                dc i4'spritePlayerEvenAngle260'
                dc i4'spritePlayerEvenAngle270'
                dc i4'spritePlayerEvenAngle280'
                dc i4'spritePlayerEvenAngle290'
                dc i4'spritePlayerEvenAngle300'
                dc i4'spritePlayerEvenAngle310'
                dc i4'spritePlayerEvenAngle320'
                dc i4'spritePlayerEvenAngle330'
                dc i4'spritePlayerEvenAngle340'
                dc i4'spritePlayerEvenAngle350'

shipEraseTable dc i4'spritePlayerEraseAngle0'
                dc i4'spritePlayerEraseAngle10'
                dc i4'spritePlayerEraseAngle20'
                dc i4'spritePlayerEraseAngle30'
                dc i4'spritePlayerEraseAngle40'
                dc i4'spritePlayerEraseAngle50'
                dc i4'spritePlayerEraseAngle60'
                dc i4'spritePlayerEraseAngle70'
                dc i4'spritePlayerEraseAngle80'
                dc i4'spritePlayerEraseAngle90'
                dc i4'spritePlayerEraseAngle100'
                dc i4'spritePlayerEraseAngle110'
                dc i4'spritePlayerEraseAngle120'
                dc i4'spritePlayerEraseAngle130'
                dc i4'spritePlayerEraseAngle140'
                dc i4'spritePlayerEraseAngle150'
                dc i4'spritePlayerEraseAngle160'
                dc i4'spritePlayerEraseAngle170'
                dc i4'spritePlayerEraseAngle180'
                dc i4'spritePlayerEraseAngle190'
                dc i4'spritePlayerEraseAngle200'
                dc i4'spritePlayerEraseAngle210'
                dc i4'spritePlayerEraseAngle220'
                dc i4'spritePlayerEraseAngle230'
                dc i4'spritePlayerEraseAngle240'
                dc i4'spritePlayerEraseAngle250'
                dc i4'spritePlayerEraseAngle260'
                dc i4'spritePlayerEraseAngle270'
                dc i4'spritePlayerEraseAngle280'
                dc i4'spritePlayerEraseAngle290'
                dc i4'spritePlayerEraseAngle300'
                dc i4'spritePlayerEraseAngle310'
                dc i4'spritePlayerEraseAngle320'
                dc i4'spritePlayerEraseAngle330'
                dc i4'spritePlayerEraseAngle340'
                dc i4'spritePlayerEraseAngle350'

thrustDrawTableOdd dc i4'spriteThrustOddAngle0'
                dc i4'spriteThrustOddAngle10'
                dc i4'spriteThrustOddAngle20'
                dc i4'spriteThrustOddAngle30'
                dc i4'spriteThrustOddAngle40'
                dc i4'spriteThrustOddAngle50'
                dc i4'spriteThrustOddAngle60'
                dc i4'spriteThrustOddAngle70'
                dc i4'spriteThrustOddAngle80'
                dc i4'spriteThrustOddAngle90'
                dc i4'spriteThrustOddAngle100'
                dc i4'spriteThrustOddAngle110'
                dc i4'spriteThrustOddAngle120'
                dc i4'spriteThrustOddAngle130'
                dc i4'spriteThrustOddAngle140'
                dc i4'spriteThrustOddAngle150'
                dc i4'spriteThrustOddAngle160'
                dc i4'spriteThrustOddAngle170'
                dc i4'spriteThrustOddAngle180'
                dc i4'spriteThrustOddAngle190'
                dc i4'spriteThrustOddAngle200'
                dc i4'spriteThrustOddAngle210'
                dc i4'spriteThrustOddAngle220'
                dc i4'spriteThrustOddAngle230'
                dc i4'spriteThrustOddAngle240'
                dc i4'spriteThrustOddAngle250'
                dc i4'spriteThrustOddAngle260'
                dc i4'spriteThrustOddAngle270'
                dc i4'spriteThrustOddAngle280'
                dc i4'spriteThrustOddAngle290'
                dc i4'spriteThrustOddAngle300'
                dc i4'spriteThrustOddAngle310'
                dc i4'spriteThrustOddAngle320'
                dc i4'spriteThrustOddAngle330'
                dc i4'spriteThrustOddAngle340'
                dc i4'spriteThrustOddAngle350'

thrustDrawTableEven dc i4'spriteThrustEvenAngle0'
                dc i4'spriteThrustEvenAngle10'
                dc i4'spriteThrustEvenAngle20'
                dc i4'spriteThrustEvenAngle30'
                dc i4'spriteThrustEvenAngle40'
                dc i4'spriteThrustEvenAngle50'
                dc i4'spriteThrustEvenAngle60'
                dc i4'spriteThrustEvenAngle70'
                dc i4'spriteThrustEvenAngle80'
                dc i4'spriteThrustEvenAngle90'
                dc i4'spriteThrustEvenAngle100'
                dc i4'spriteThrustEvenAngle110'
                dc i4'spriteThrustEvenAngle120'
                dc i4'spriteThrustEvenAngle130'
                dc i4'spriteThrustEvenAngle140'
                dc i4'spriteThrustEvenAngle150'
                dc i4'spriteThrustEvenAngle160'
                dc i4'spriteThrustEvenAngle170'
                dc i4'spriteThrustEvenAngle180'
                dc i4'spriteThrustEvenAngle190'
                dc i4'spriteThrustEvenAngle200'
                dc i4'spriteThrustEvenAngle210'
                dc i4'spriteThrustEvenAngle220'
                dc i4'spriteThrustEvenAngle230'
                dc i4'spriteThrustEvenAngle240'
                dc i4'spriteThrustEvenAngle250'
                dc i4'spriteThrustEvenAngle260'
                dc i4'spriteThrustEvenAngle270'
                dc i4'spriteThrustEvenAngle280'
                dc i4'spriteThrustEvenAngle290'
                dc i4'spriteThrustEvenAngle300'
                dc i4'spriteThrustEvenAngle310'
                dc i4'spriteThrustEvenAngle320'
                dc i4'spriteThrustEvenAngle330'
                dc i4'spriteThrustEvenAngle340'
                dc i4'spriteThrustEvenAngle350'

thrustEraseTable dc i4'spriteThrustEraseAngle0'
                dc i4'spriteThrustEraseAngle10'
                dc i4'spriteThrustEraseAngle20'
                dc i4'spriteThrustEraseAngle30'
                dc i4'spriteThrustEraseAngle40'
                dc i4'spriteThrustEraseAngle50'
                dc i4'spriteThrustEraseAngle60'
                dc i4'spriteThrustEraseAngle70'
                dc i4'spriteThrustEraseAngle80'
                dc i4'spriteThrustEraseAngle90'
                dc i4'spriteThrustEraseAngle100'
                dc i4'spriteThrustEraseAngle110'
                dc i4'spriteThrustEraseAngle120'
                dc i4'spriteThrustEraseAngle130'
                dc i4'spriteThrustEraseAngle140'
                dc i4'spriteThrustEraseAngle150'
                dc i4'spriteThrustEraseAngle160'
                dc i4'spriteThrustEraseAngle170'
                dc i4'spriteThrustEraseAngle180'
                dc i4'spriteThrustEraseAngle190'
                dc i4'spriteThrustEraseAngle200'
                dc i4'spriteThrustEraseAngle210'
                dc i4'spriteThrustEraseAngle220'
                dc i4'spriteThrustEraseAngle230'
                dc i4'spriteThrustEraseAngle240'
                dc i4'spriteThrustEraseAngle250'
                dc i4'spriteThrustEraseAngle260'
                dc i4'spriteThrustEraseAngle270'
                dc i4'spriteThrustEraseAngle280'
                dc i4'spriteThrustEraseAngle290'
                dc i4'spriteThrustEraseAngle300'
                dc i4'spriteThrustEraseAngle310'
                dc i4'spriteThrustEraseAngle320'
                dc i4'spriteThrustEraseAngle330'
                dc i4'spriteThrustEraseAngle340'
                dc i4'spriteThrustEraseAngle350'

        end
