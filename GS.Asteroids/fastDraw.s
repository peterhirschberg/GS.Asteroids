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


fastDrawObject entry

        lda #SHAPE_OFFSET_PLAYER
        cmp objectShapeDataIndex
        bne next0
        jsl fastDrawPlayerShip
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

        lda drawX
        and #1
        cmp #1
        beq drawPlayerOdd
        jsl spritePlayerOddAngle0
drawPlayerOdd anop
        jsl spritePlayerEvenAngle0

        rtl


fastErasePlayerShip entry

        jsl spritePlayerEraseAngle0


        rtl



        end
