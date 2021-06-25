;
;  objects.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

objects start
        using globalData
        using objectData
        using displayListData

updateObjects entry

        lda #0
        sta objectIndex

loop anop
        lda objectIndex
        asl a
        tax

; check lifetimes and only update as appropriate
        lda lifetimeList,x
        cmp #-1
        beq getObjectProperties
        cmp #0
        bne getObjectProperties
        jmp nextObject1

getObjectProperties anop
; get x position
        lda xPosList,x
        sta xpos

; get y position
        lda yPosList,x
        sta ypos

; get x speed
        lda xSpeedList,x
        sta xspeed

; get y speed
        lda ySpeedList,x
        sta yspeed

; get lifetime
        lda lifetimeList,x
        sta lifetime

moveObject anop
; move object
        lda xpos
        clc
        adc xspeed
        sta xpos

        lda ypos
        clc
        adc yspeed
        sta ypos
        
; get rotation speed
        lda rotationSpeedList,x
        sta rotationSpeed
        
; get and update angle
        lda angleList,x
        clc
        adc rotationSpeed

        bmi negWrapAngle
        cmp #360
        bcs posWrapAngle
        sta angle
        bra wrap
        
posWrapAngle anop
        sec
        sbc #360
        sta angle
        bra wrap

negWrapAngle anop
        clc
        adc #360
        sta angle

wrap anop

; wrap x & y

        lda xspeed
        bmi checkXNeg

checkXPlus anop
        lda xpos
        cmp #SCREEN_XMAX
        bcs resetXPlus
        bra checkYPos

resetXPlus anop
        lda #0
        sta xpos
        bra checkYPos
        
checkXNeg anop
        lda xpos
        bmi resetXNeg
        bra checkYPos

resetXNeg anop
        lda #SCREEN_XMAX
        sta xpos

checkYPos anop
        lda yspeed
        bmi checkYNeg

checkYPlus anop
        lda ypos
        cmp #MIDSCREEN_Y
        bcs resetYPlus
        bra dontResetYPos

resetYPlus anop
        lda #0
        sta ypos
        bra dontResetYPos
        
checkYNeg anop
        lda ypos
        bmi resetYNeg
        bra dontResetYPos

resetYNeg anop
        lda #MIDSCREEN_Y
        sta ypos


dontResetYPos anop

; update lifetime
        lda lifetime
        cmp #-1
        beq saveBackToObject
        cmp #0
        beq saveBackToObject

        dec lifetime

saveBackToObject anop

; save stuff back to object
        lda xpos
        sta xPosList,x

        lda ypos
        sta yPosList,x

        lda angle
        sta angleList,x

        lda lifetime
        sta lifetimeList,x

nextObject1 anop
; increment to the next object and loop
        inc objectIndex
        lda objectIndex
        cmp #NUM_OBJECTS
        beq done
        brl loop
        
done anop
        
        rts

        
drawObjects entry

        jsl isGameOver
        cmp #1
        beq gameOver

        lda #0
        sta objectIndex
        jmp loop1

gameOver anop
        lda #2
        sta objectIndex

loop1 anop
        lda objectIndex
        asl a
        tax

; check lifetimes and only draw as appropriate
        lda lifetimeList,x
        cmp #-1
        beq drawIt
        cmp #0
        bne drawIt
        jmp nextObject

drawIt anop
        lda colorList,x
        sta color

        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta drawX

        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta drawY

        lda angleList,x
        sta angle

        lda shapeList,x
        sta objectShapeDataIndex

; -----------------------------
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
        jmp drawNormal
prerenderedLargeSaucerShort anop
        brl prerenderedLargeSaucer
        jmp drawNormal

prerenderedLargeRock1 anop
        lda drawX
        and #1
        cmp #1
        beq doOddLargeRock1
        jsl spriteLargeRock1Even
        jmp nextObject
doOddLargeRock1 anop
        jsl spriteLargeRock1Odd
        jmp nextObject
prerenderedLargeRock2 anop
        lda drawX
        and #1
        cmp #1
        beq doOddLargeRock2
        jsl spriteLargeRock2Even
        jmp nextObject
doOddLargeRock2 anop
        jsl spriteLargeRock2Odd
        jmp nextObject
prerenderedLargeRock3 anop
        lda drawX
        and #1
        cmp #1
        beq doOddLargeRock3
        jsl spriteLargeRock3Even
        jmp nextObject
doOddLargeRock3 anop
        jsl spriteLargeRock3Odd
        jmp nextObject

prerenderedMediumRock1 anop
       lda drawX
       and #1
       cmp #1
       beq doOddMediumRock1
       jsl spriteMediumRock1Even
       jmp nextObject
doOddMediumRock1 anop
      jsl spriteMediumRock1Odd
        jmp nextObject
prerenderedMediumRock2 anop
       lda drawX
       and #1
       cmp #1
       beq doOddMediumRock2
       jsl spriteMediumRock2Even
       jmp nextObject
doOddMediumRock2 anop
       jsl spriteMediumRock2Odd
       jmp nextObject
prerenderedMediumRock3 anop
       lda drawX
       and #1
       cmp #1
       beq doOddMediumRock3
       jsl spriteMediumRock3Even
       jmp nextObject
doOddMediumRock3 anop
        jsl spriteMediumRock3Odd
        jmp nextObject

prerenderedSmallRock1 anop
       lda drawX
       and #1
       cmp #1
       beq doOddSmallRock1
       jsl spriteSmallRock1Even
       jmp nextObject
doOddSmallRock1 anop
      jsl spriteSmallRock1Odd
        jmp nextObject
prerenderedSmallRock2 anop
       lda drawX
       and #1
       cmp #1
       beq doOddSmallRock2
       jsl spriteSmallRock2Even
       jmp nextObject
doOddSmallRock2 anop
       jsl spriteSmallRock2Odd
       jmp nextObject
prerenderedSmallRock3 anop
       lda drawX
       and #1
       cmp #1
       beq doOddSmallRock3
       jsl spriteSmallRock3Even
       jmp nextObject
doOddSmallRock3 anop
        jsl spriteSmallRock3Odd
        jmp nextObject

prerenderedLargeSaucer anop
       lda drawX
       and #1
       cmp #1
       beq doOddLargeSaucer
       jsl spriteLargeSaucerEven
       jmp nextObject
doOddLargeSaucer anop
        jsl spriteLargeSaucerOdd
        jmp nextObject
; -----------------------------


drawNormal anop
        lda #0
        cmp angle
        beq drawNoRotate

        stx savex
        sty savey
        lda objectShapeDataIndex
        jsr drawObjectWithRotate
        ldx savex
        ldy savey
        
        bra nextObject
        
drawNoRotate anop
        stx savex
        sty savey
        lda objectShapeDataIndex
        jsr drawObject
        ldx savex
        ldy savey
        
nextObject anop
        inc objectIndex
        lda objectIndex
        cmp #NUM_OBJECTS
        beq done1
        brl loop1
        
done1 anop

        rts


eraseSprites entry

        lda #0
        sta objectIndex

loop1b anop
        lda objectIndex
        asl a
        tax

; check lifetimes and only draw as appropriate
        lda lifetimeList,x
        cmp #-1
        beq drawItb
        cmp #0
        bne drawItb
        jmp nextObjectb

drawItb anop
        lda colorList,x
        sta color

        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta drawX

        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta drawY

        lda angleList,x
        sta angle

        lda shapeList,x
        sta objectShapeDataIndex

; -----------------------------
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

        bra nextObjectb

eraseLargeRock1 anop
        jsl spriteLargeRock1Erase
        bra nextObjectb
eraseLargeRock2 anop
        jsl spriteLargeRock2Erase
        bra nextObjectb
eraseLargeRock3 anop
        jsl spriteLargeRock3Erase
        bra nextObjectb

eraseMediumRock1 anop
        jsl spriteMediumRock1Erase
        bra nextObjectb
eraseMediumRock2 anop
        jsl spriteMediumRock2Erase
        jmp nextObjectb
eraseMediumRock3 anop
        jsl spriteMediumRock3Erase
        bra nextObjectb

eraseSmallRock1 anop
        jsl spriteSmallRock1Erase
        bra nextObjectb
eraseSmallRock2 anop
        jsl spriteSmallRock2Erase
        jmp nextObjectb
eraseSmallRock3 anop
        jsl spriteSmallRock3Erase
        bra nextObjectb

eraseLargeSaucer anop
        jsl spriteLargeSaucerErase
        bra nextObjectb

; -----------------------------

nextObjectb anop
        inc objectIndex
        lda objectIndex
        cmp #NUM_OBJECTS
        beq done1b
        brl loop1b

done1b anop


        rtl


drawObject entry

; ------------------
; check for dots

        sta objectShapeDataIndex
        tax
        lda objectShapeData,x
        sta counter

        lda #1
        cmp counter
        beq drawADot
        bra drawLine

; -------------------
; draw dots

drawADot anop

        ldy dotListLength
        
        lda drawX
        sta dotListList,y
        iny
        iny
        
        lda drawY
        sta dotListList,y
        iny
        iny
        
        sty dotListLength

        ldy displayListColorLength
        lda color
        sta displayListColors,y
        iny
        iny
        sty displayListColorLength

        rts

; -------------------
; draw lines

drawLine anop

        ldx objectShapeDataIndex
        lda objectShapeData,x
        sta counter
        inx
        inx

        lda objectShapeData,x
        clc
        adc drawX
        sta fromx
        inx
        inx

        lda objectShapeData,x
        clc
        adc drawY
        sta fromy
        inx
        inx

drawObjectLoop anop

        dec counter
        lda counter
        cmp #0
        beq drawObjectDoneShortJump
        bra continue

drawObjectDoneShortJump anop
        brl drawObjectDone
        
continue anop

        lda fromx
        sta x1

        lda fromy
        sta y1

        lda objectShapeData,x
        clc
        adc drawX
        sta x2
        inx
        inx

        lda objectShapeData,x
        clc
        adc drawY
        sta y2
        inx
        inx
        
        lda x2
        sta fromx

        lda y2
        sta fromy

        ldy displayListLength

        lda y1
        bmi skipLine1
        lda y2
        bmi skipLine1
        lda y1
        cmp #199
        bcs skipLine1
        lda y2
        cmp #199
        bcs skipLine1

        lda x1
        bmi skipLine1
        lda x2
        bmi skipLine1
        lda x1
        cmp #319
        bcs skipLine1
        lda x2
        cmp #319
        bcs skipLine1

        lda x1
        sta displayListList,y
        iny
        iny
        
        lda y1
        sta displayListList,y
        iny
        iny
        
        lda x2
        sta displayListList,y
        iny
        iny
        
        lda y2
        sta displayListList,y
        iny
        iny

        sty displayListLength

        ldy displayListColorLength
        lda color
        sta displayListColors,y
        iny
        iny
        sty displayListColorLength

skipLine1 anop
        
        jmp drawObjectLoop

drawObjectDone anop

        rts
        
        
drawObjectWithRotate entry

        sta objectShapeDataIndex
        tax
        lda objectShapeData,x
        sta counter

        inx
        inx

        lda objectShapeData,x
        sta fromx
        inx
        inx

        lda objectShapeData,x
        sta fromy
        inx
        inx

; skip rotation if angle = 0
        lda #0
        cmp angle
        beq drawObjectLoop1
        
        lda fromx
        sta param1
        
        lda fromy
        sta param2
        
        lda angle
        sta param3
        
        stx savex
        sty savey
        jsl rotate
        ldx savex
        ldy savey

        lda result1
        clc
        adc drawX
        sta fromx
        
        lda result2
        clc
        adc drawY
        sta fromy
        
drawObjectLoop1 anop

        dec counter
        lda counter
        cmp #0
        beq doneShortJump1
        bra continue2
        
doneShortJump1 anop
        jmp drawObjectDone1
        
continue2 anop

        lda fromx
        sta x1

        lda fromy
        sta y1

        lda objectShapeData,x
        sta x2
        inx
        inx

        lda objectShapeData,x
        sta y2
        inx
        inx
        
        lda x2
        sta param1
        
        lda y2
        sta param2
        
        lda angle
        sta param3
        
        stx savex
        sty savey
        jsl rotate
        ldx savex
        ldy savey

        lda result1
        clc
        adc drawX
        sta x2
        
        lda result2
        clc
        adc drawY
        sta y2

        lda x2
        sta fromx

        lda y2
        sta fromy

        ldy displayListLength

        lda y1
        bmi skipLine2
        lda y2
        bmi skipLine2
        lda y1
        cmp #199
        bcs skipLine2
        lda y2
        cmp #199
        bcs skipLine2
        
        lda x1
        bmi skipLine2
        lda x2
        bmi skipLine2
        lda x1
        cmp #319
        bcs skipLine2
        lda x2
        cmp #319
        bcs skipLine2

        lda x1
        sta displayListList,y
        iny
        iny
        
        lda y1
        sta displayListList,y
        iny
        iny
        
        lda x2
        sta displayListList,y
        iny
        iny
        
        lda y2
        sta displayListList,y
        iny
        iny

        sty displayListLength

        ldy displayListColorLength
        lda color
        sta displayListColors,y
        iny
        iny
        sty displayListColorLength

skipLine2 anop

        jmp drawObjectLoop1

drawObjectDone1 anop

        rts


drawAttractMode entry

        lda #0
        sta angle
        lda #70
        sta drawX
        lda #70
        sta drawY
        lda #$bb
        sta color
        lda #SHAPE_OFFSET_LARGE_ROCK2
        jsr drawObject

        lda #140
        sta angle
        lda #240
        sta drawX
        lda #140
        sta drawY
        lda #$bb
        sta color
        lda #SHAPE_OFFSET_PLAYER
        jsr drawObjectWithRotate

        rtl


objectIndex         dc i2'0'
objectShapeDataIndex dc a2'0'
xpos                dc i2'0'
ypos                dc i2'0'
xspeed              dc i2'0'
yspeed              dc i2'0'
angle               dc i2'0'
rotationSpeed       dc i2'0'
lifetime            dc i2'0'
color               dc i2'0'

savex               dc i2'0'
savey               dc i2'0'

counter  dc i2'0'
fromx    dc i2'0'
fromy    dc i2'0'
tox      dc i2'0'
toy      dc i2'0'


        end

objectData data


; "lives" ship
livesShipShapeData anop
        dc i2'6'

        dc i2'-2'
        dc i2'2'

        dc i2'0'
        dc i2'-4'

        dc i2'2'
        dc i2'2'

        dc i2'1'
        dc i2'1'

        dc i2'-1'
        dc i2'1'

        dc i2'-2'
        dc i2'2'


; data for all shapes drawn
objectShapeData anop
; player ship
        dc i2'6'

        dc i2'-4'
        dc i2'-5'

        dc i2'0'
        dc i2'7'

        dc i2'4'
        dc i2'-5'

        dc i2'2'
        dc i2'-3'

        dc i2'-2'
        dc i2'-3'

        dc i2'-4'
        dc i2'-5'

; thrust
        dc i2'3'

        dc i2'2'
        dc i2'-4'

        dc i2'0'
        dc i2'-7'

        dc i2'-2'
        dc i2'-4'

; wreckage 1
        dc i2'2'

        dc i2'0'
        dc i2'-4'

        dc i2'0'
        dc i2'4'

; wreckage 2
        dc i2'2'

        dc i2'0'
        dc i2'-3'

        dc i2'0'
        dc i2'3'

; wreckage 3
        dc i2'2'

        dc i2'0'
        dc i2'-2'

        dc i2'0'
        dc i2'2'

; wreckage 4
        dc i2'2'

        dc i2'0'
        dc i2'-1'

        dc i2'0'
        dc i2'4'

; dot
        dc i2'1'

        dc i2'0'
        dc i2'0'

; large saucer
        dc i2'12'

        dc i2'11'
        dc i2'0'

        dc i2'5'
        dc i2'3'

        dc i2'-6'
        dc i2'3'

        dc i2'-12'
        dc i2'0'

        dc i2'-6'
        dc i2'-4'

        dc i2'-3'
        dc i2'-9'

        dc i2'2'
        dc i2'-9'

        dc i2'5'
        dc i2'-4'

        dc i2'11'
        dc i2'0'

        dc i2'-12'
        dc i2'0'

        dc i2'-6'
        dc i2'-4'

        dc i2'5'
        dc i2'-4'

; small saucer
        dc i2'12'

        dc i2'5'
        dc i2'0'

        dc i2'2'
        dc i2'1'

        dc i2'-3'
        dc i2'1'

        dc i2'-6'
        dc i2'0'

        dc i2'-3'
        dc i2'-2'

        dc i2'-2'
        dc i2'-4'

        dc i2'1'
        dc i2'-4'

        dc i2'2'
        dc i2'-2'

        dc i2'5'
        dc i2'0'

        dc i2'-6'
        dc i2'0'

        dc i2'-3'
        dc i2'-2'

        dc i2'2'
        dc i2'-2'

; large rock 1
        dc i2'11'

        dc i2'-7'
        dc i2'14'

        dc i2'4'
        dc i2'14'

        dc i2'15'
        dc i2'8'

        dc i2'11'
        dc i2'0'

        dc i2'15'
        dc i2'-7'

        dc i2'7'
        dc i2'-15'

        dc i2'0'
        dc i2'-8'

        dc i2'-7'
        dc i2'-15'

        dc i2'-16'
        dc i2'-7'

        dc i2'-16'
        dc i2'8'

        dc i2'-7'
        dc i2'14'

; large rock 2
        dc i2'13'

        dc i2'-4'
        dc i2'-9'

        dc i2'-8'
        dc i2'-15'

        dc i2'3'
        dc i2'-15'

        dc i2'15'
        dc i2'-9'

        dc i2'15'
        dc i2'-4'

        dc i2'3'
        dc i2'-1'

        dc i2'15'
        dc i2'6'

        dc i2'6'
        dc i2'14'

        dc i2'3'
        dc i2'10'

        dc i2'-8'
        dc i2'14'

        dc i2'-16'
        dc i2'4'

        dc i2'-16'
        dc i2'-9'

        dc i2'-4'
        dc i2'-9'

; large rock 3
        dc i2'13'

        dc i2'7'
        dc i2'-4'

        dc i2'14'
        dc i2'4'

        dc i2'7'
        dc i2'14'

        dc i2'-5'
        dc i2'11'

        dc i2'-9'
        dc i2'14'

        dc i2'-15'
        dc i2'7'

        dc i2'-13'
        dc i2'0'

        dc i2'-15'
        dc i2'-7'

        dc i2'-8'
        dc i2'-15'

        dc i2'0'
        dc i2'-12'

        dc i2'7'
        dc i2'-15'

        dc i2'14'
        dc i2'-8'

        dc i2'7'
        dc i2'-4'

; medium rock 1
        dc i2'11'

        dc i2'-4'
        dc i2'7'

        dc i2'2'
        dc i2'7'

        dc i2'7'
        dc i2'4'

        dc i2'5'
        dc i2'0'

        dc i2'7'
        dc i2'-4'

        dc i2'3'
        dc i2'-8'

        dc i2'0'
        dc i2'-4'

        dc i2'-4'
        dc i2'-8'

        dc i2'-8'
        dc i2'-4'

        dc i2'-8'
        dc i2'4'

        dc i2'-4'
        dc i2'7'

; medium rock 2
        dc i2'13'

        dc i2'-2'
        dc i2'-5'

        dc i2'-4'
        dc i2'-8'

        dc i2'1'
        dc i2'-8'

        dc i2'7'
        dc i2'-5'

        dc i2'7'
        dc i2'-2'

        dc i2'1'
        dc i2'-1'

        dc i2'7'
        dc i2'3'

        dc i2'3'
        dc i2'7'

        dc i2'1'
        dc i2'5'

        dc i2'-4'
        dc i2'7'

        dc i2'-8'
        dc i2'2'

        dc i2'-8'
        dc i2'-5'

        dc i2'-2'
        dc i2'-5'

; medium rock 3
        dc i2'13'

        dc i2'3'
        dc i2'-2'

        dc i2'7'
        dc i2'2'

        dc i2'3'
        dc i2'7'

        dc i2'-3'
        dc i2'5'

        dc i2'-5'
        dc i2'7'

        dc i2'-8'
        dc i2'3'

        dc i2'-7'
        dc i2'0'

        dc i2'-8'
        dc i2'-4'

        dc i2'-4'
        dc i2'-8'

        dc i2'0'
        dc i2'-6'

        dc i2'3'
        dc i2'-8'

        dc i2'7'
        dc i2'-4'

        dc i2'3'
        dc i2'-2'

; small rock 1
        dc i2'11'

        dc i2'-2'
        dc i2'3'

        dc i2'1'
        dc i2'3'

        dc i2'3'
        dc i2'2'

        dc i2'2'
        dc i2'0'

        dc i2'3'
        dc i2'-2'

        dc i2'1'
        dc i2'-4'

        dc i2'0'
        dc i2'-2'

        dc i2'-2'
        dc i2'-4'

        dc i2'-4'
        dc i2'-2'

        dc i2'-4'
        dc i2'2'

        dc i2'-2'
        dc i2'3'

; small rock 2
        dc i2'13'

        dc i2'-1'
        dc i2'-3'

        dc i2'-2'
        dc i2'-4'

        dc i2'0'
        dc i2'-4'

        dc i2'3'
        dc i2'-3'

        dc i2'3'
        dc i2'-1'

        dc i2'0'
        dc i2'-1'

        dc i2'3'
        dc i2'1'

        dc i2'1'
        dc i2'3'

        dc i2'0'
        dc i2'2'

        dc i2'-2'
        dc i2'3'

        dc i2'-4'
        dc i2'1'

        dc i2'-4'
        dc i2'-3'

        dc i2'-1'
        dc i2'-3'

; small rock 3
        dc i2'13'

        dc i2'1'
        dc i2'-1'

        dc i2'3'
        dc i2'1'

        dc i2'1'
        dc i2'3'

        dc i2'-2'
        dc i2'2'

        dc i2'-3'
        dc i2'3'

        dc i2'-4'
        dc i2'1'

        dc i2'-4'
        dc i2'0'

        dc i2'-4'
        dc i2'-2'

        dc i2'-2'
        dc i2'-4'

        dc i2'0'
        dc i2'-3'

        dc i2'1'
        dc i2'-4'

        dc i2'3'
        dc i2'-2'

        dc i2'1'
        dc i2'-1'



SHAPE_OFFSET_PLAYER                 gequ $0
SHAPE_OFFSET_THRUST                 gequ $1a
SHAPE_OFFSET_WRECKAGE1          gequ $28
SHAPE_OFFSET_WRECKAGE2          gequ $32
SHAPE_OFFSET_WRECKAGE3          gequ $3c
SHAPE_OFFSET_WRECKAGE4          gequ $46
SHAPE_OFFSET_DOT                        gequ $50
SHAPE_OFFSET_LARGE_SAUCER       gequ $56
SHAPE_OFFSET_SMALL_SAUCER       gequ $88
SHAPE_OFFSET_LARGE_ROCK1        gequ $ba
SHAPE_OFFSET_LARGE_ROCK2        gequ $e8
SHAPE_OFFSET_LARGE_ROCK3        gequ $11e
SHAPE_OFFSET_MEDIUM_ROCK1       gequ $154
SHAPE_OFFSET_MEDIUM_ROCK2       gequ $182
SHAPE_OFFSET_MEDIUM_ROCK3       gequ $1b8
SHAPE_OFFSET_SMALL_ROCK1        gequ $1ee
SHAPE_OFFSET_SMALL_ROCK2        gequ $21c
SHAPE_OFFSET_SMALL_ROCK3        gequ $252




OBJECT_LARGE_ROCK1              gequ 4
;OBJECT_LARGE_ROCK2              gequ 6
;OBJECT_LARGE_ROCK3              gequ 8
;OBJECT_LARGE_ROCK4              gequ 10
;OBJECT_LARGE_ROCK5              gequ 12
;OBJECT_LARGE_ROCK6              gequ 14
;OBJECT_LARGE_ROCK7              gequ 16
;OBJECT_LARGE_ROCK8              gequ 18

OBJECT_MEDIUM_ROCK1             gequ 20
;OBJECT_MEDIUM_ROCK2             gequ 22
;OBJECT_MEDIUM_ROCK3             gequ 24
;OBJECT_MEDIUM_ROCK4             gequ 26
;OBJECT_MEDIUM_ROCK5             gequ 28
;OBJECT_MEDIUM_ROCK6             gequ 30
;OBJECT_MEDIUM_ROCK7             gequ 32
;OBJECT_MEDIUM_ROCK8             gequ 34
;OBJECT_MEDIUM_ROCK9             gequ 36
;OBJECT_MEDIUM_ROCK10            gequ 38
;OBJECT_MEDIUM_ROCK11            gequ 40
;OBJECT_MEDIUM_ROCK12            gequ 42
;OBJECT_MEDIUM_ROCK13            gequ 44
;OBJECT_MEDIUM_ROCK14            gequ 46
;OBJECT_MEDIUM_ROCK15            gequ 48
;OBJECT_MEDIUM_ROCK16            gequ 50

OBJECT_SMALL_ROCK1              gequ 52
;OBJECT_SMALL_ROCK2              gequ 54
;OBJECT_SMALL_ROCK3              gequ 56
;OBJECT_SMALL_ROCK4              gequ 58
;OBJECT_SMALL_ROCK5              gequ 60
;OBJECT_SMALL_ROCK6              gequ 62
;OBJECT_SMALL_ROCK7              gequ 64
;OBJECT_SMALL_ROCK8              gequ 66
;OBJECT_SMALL_ROCK9              gequ 68
;OBJECT_SMALL_ROCK10             gequ 70
;OBJECT_SMALL_ROCK11             gequ 72
;OBJECT_SMALL_ROCK12             gequ 74
;OBJECT_SMALL_ROCK13             gequ 76
;OBJECT_SMALL_ROCK14             gequ 78
;OBJECT_SMALL_ROCK15             gequ 80
;OBJECT_SMALL_ROCK16             gequ 82
;OBJECT_SMALL_ROCK17             gequ 84
;OBJECT_SMALL_ROCK18             gequ 86
;OBJECT_SMALL_ROCK19             gequ 88
;OBJECT_SMALL_ROCK20             gequ 90
;OBJECT_SMALL_ROCK21             gequ 92
;OBJECT_SMALL_ROCK22             gequ 94
;OBJECT_SMALL_ROCK23             gequ 96
;OBJECT_SMALL_ROCK24             gequ 98
;OBJECT_SMALL_ROCK25             gequ 100
;OBJECT_SMALL_ROCK26             gequ 102
;OBJECT_SMALL_ROCK27             gequ 104
;OBJECT_SMALL_ROCK28             gequ 106
;OBJECT_SMALL_ROCK29             gequ 108
;OBJECT_SMALL_ROCK30             gequ 110
;OBJECT_SMALL_ROCK31             gequ 112
;OBJECT_SMALL_ROCK32             gequ 114

OBJECT_PLAYER_MISSILE1          gequ 116
OBJECT_PLAYER_MISSILE2          gequ 118
OBJECT_PLAYER_MISSILE3          gequ 120
OBJECT_PLAYER_MISSILE4          gequ 122

OBJECT_SAUCER_MISSILE1          gequ 124
OBJECT_SAUCER_MISSILE2          gequ 126
OBJECT_SAUCER_MISSILE3          gequ 128
OBJECT_SAUCER_MISSILE4          gequ 130
OBJECT_SAUCER_MISSILE5          gequ 132
OBJECT_SAUCER_MISSILE6          gequ 134
OBJECT_SAUCER_MISSILE7          gequ 136
OBJECT_SAUCER_MISSILE8          gequ 138

OBJECT_WRECKAGE1                gequ 140
;OBJECT_WRECKAGE2                gequ 142
;OBJECT_WRECKAGE3                gequ 144
;OBJECT_WRECKAGE4                gequ 146
;OBJECT_WRECKAGE5                gequ 148
;OBJECT_WRECKAGE6                gequ 150
;OBJECT_WRECKAGE7                gequ 152
;OBJECT_WRECKAGE8                gequ 154
;OBJECT_WRECKAGE9                gequ 156
;OBJECT_WRECKAGE10               gequ 158
;OBJECT_WRECKAGE11               gequ 160
;OBJECT_WRECKAGE12               gequ 162
;OBJECT_WRECKAGE13               gequ 164
;OBJECT_WRECKAGE14               gequ 166
;OBJECT_WRECKAGE15               gequ 168
;OBJECT_WRECKAGE16               gequ 170

OBJECT_LARGE_SAUCER1            gequ 172
OBJECT_SMALL_SAUCER1            gequ 174

OBJECT_PARTICLE1                gequ 176
;OBJECT_PARTICLE2                gequ 178
;OBJECT_PARTICLE3                gequ 180
;OBJECT_PARTICLE4                gequ 182
;OBJECT_PARTICLE5                gequ 184
;OBJECT_PARTICLE6                gequ 186
;OBJECT_PARTICLE7                gequ 188
;OBJECT_PARTICLE8               gequ 190
;OBJECT_PARTICLE9               gequ 192
;OBJECT_PARTICLE10               gequ 194
;OBJECT_PARTICLE11               gequ 196
;OBJECT_PARTICLE12               gequ 198
;OBJECT_PARTICLE13               gequ 200
;OBJECT_PARTICLE14               gequ 202
;OBJECT_PARTICLE15               gequ 204
;OBJECT_PARTICLE16               gequ 206
;OBJECT_PARTICLE17               gequ 208
;OBJECT_PARTICLE18               gequ 210
;OBJECT_PARTICLE19               gequ 212
;OBJECT_PARTICLE20               gequ 214
;OBJECT_PARTICLE21               gequ 216
;OBJECT_PARTICLE22               gequ 218
;OBJECT_PARTICLE23               gequ 220
;OBJECT_PARTICLE24               gequ 222
;OBJECT_PARTICLE25               gequ 224
;OBJECT_PARTICLE26               gequ 226
;OBJECT_PARTICLE27               gequ 228
;OBJECT_PARTICLE28               gequ 230
;OBJECT_PARTICLE29               gequ 232
;OBJECT_PARTICLE30               gequ 234
;OBJECT_PARTICLE31               gequ 236
;OBJECT_PARTICLE32               gequ 238
;OBJECT_PARTICLE33               gequ 240
;OBJECT_PARTICLE34               gequ 242
;OBJECT_PARTICLE35               gequ 244
;OBJECT_PARTICLE36               gequ 246
;OBJECT_PARTICLE37               gequ 248
;OBJECT_PARTICLE38               gequ 250
;OBJECT_PARTICLE39               gequ 252
;OBJECT_PARTICLE40               gequ 254


NUM_PLAYER_OBJECTS              gequ 2
NUM_LARGE_ROCKS                 gequ 8
NUM_MEDIUM_ROCKS                gequ 16
NUM_SMALL_ROCKS                 gequ 32
NUM_ROCKS                       gequ NUM_LARGE_ROCKS+NUM_MEDIUM_ROCKS+NUM_SMALL_ROCKS
NUM_PLAYER_MISSILES             gequ 4
NUM_SAUCER_MISSILES             gequ 8
NUM_MISSILES                    gequ NUM_PLAYER_MISSILES+NUM_SAUCER_MISSILES
NUM_WRECKAGE                    gequ 16
NUM_PARTICLES                   gequ 80
NUM_SAUCERS                     gequ 2
NUM_OBJECTS                     gequ NUM_PLAYER_OBJECTS+NUM_ROCKS+NUM_PLAYER_MISSILES+NUM_SAUCER_MISSILES+NUM_WRECKAGE+NUM_PARTICLES+NUM_SAUCERS

OBJECT_PLAYER              gequ 0
OBJECT_THRUST              gequ 2
OBJECT_PLAYER_MISSILE      gequ 4
OBJECT_SAUCER_MISSILE      gequ 6
OBJECT_WRECKAGE            gequ 8
OBJECT_LARGE_SAUCER        gequ 10
OBJECT_SMALL_SAUCER        gequ 12
OBJECT_LARGE_ROCK          gequ 14
OBJECT_MEDIUM_ROCK         gequ 16
OBJECT_SMALL_ROCK          gequ 18
OBJECT_PARTICLE            gequ 20

shapeList anop
; player ship and thrust
        dc i2'SHAPE_OFFSET_PLAYER'
        dc i2'SHAPE_OFFSET_THRUST'
; large asteroids
        dc i2'SHAPE_OFFSET_LARGE_ROCK3'
        dc i2'SHAPE_OFFSET_LARGE_ROCK1'
        dc i2'SHAPE_OFFSET_LARGE_ROCK2'
        dc i2'SHAPE_OFFSET_LARGE_ROCK1'
        dc i2'SHAPE_OFFSET_LARGE_ROCK3'
        dc i2'SHAPE_OFFSET_LARGE_ROCK1'
        dc i2'SHAPE_OFFSET_LARGE_ROCK2'
        dc i2'SHAPE_OFFSET_LARGE_ROCK2'
; medium asteroids
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK1'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK2'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK3'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK1'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK2'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK3'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK1'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK2'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK3'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK1'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK2'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK3'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK1'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK2'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK3'
        dc i2'SHAPE_OFFSET_MEDIUM_ROCK1'
; small asteroids
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
        dc i2'SHAPE_OFFSET_SMALL_ROCK3'
        dc i2'SHAPE_OFFSET_SMALL_ROCK1'
        dc i2'SHAPE_OFFSET_SMALL_ROCK2'
; player missiles
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
; saucer missiles
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
; wreckage
        dc i2'SHAPE_OFFSET_WRECKAGE1'
        dc i2'SHAPE_OFFSET_WRECKAGE2'
        dc i2'SHAPE_OFFSET_WRECKAGE3'
        dc i2'SHAPE_OFFSET_WRECKAGE4'
        dc i2'SHAPE_OFFSET_WRECKAGE1'
        dc i2'SHAPE_OFFSET_WRECKAGE2'
        dc i2'SHAPE_OFFSET_WRECKAGE3'
        dc i2'SHAPE_OFFSET_WRECKAGE4'
        dc i2'SHAPE_OFFSET_WRECKAGE1'
        dc i2'SHAPE_OFFSET_WRECKAGE2'
        dc i2'SHAPE_OFFSET_WRECKAGE3'
        dc i2'SHAPE_OFFSET_WRECKAGE4'
        dc i2'SHAPE_OFFSET_WRECKAGE1'
        dc i2'SHAPE_OFFSET_WRECKAGE2'
        dc i2'SHAPE_OFFSET_WRECKAGE3'
        dc i2'SHAPE_OFFSET_WRECKAGE4'
; large saucer
        dc i2'SHAPE_OFFSET_LARGE_SAUCER'
; small saucer
        dc i2'SHAPE_OFFSET_SMALL_SAUCER'
; explosion particles
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'
        dc i2'SHAPE_OFFSET_DOT'


; used to do hit testing
sizeList anop
; player ship and thrust
        dc i2'6'
        dc i2'0'
; large asteroids
        dc i2'35'
        dc i2'35'
        dc i2'35'
        dc i2'35'
        dc i2'35'
        dc i2'35'
        dc i2'35'
        dc i2'35'
; medium asteroids
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
        dc i2'17'
        dc i2'17'
        dc i2'17'
        dc i2'17'
        dc i2'17'
        dc i2'17'
; small asteroids
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
        dc i2'10'
        dc i2'10'
; player missiles (size not used for these)
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; saucer missiles (size not used for these)
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; wreckage (size not used for these)
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; large saucer
        dc i2'20'
; small saucer
        dc i2'10'
; particles (size not used for these)
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
        
xPosList anop
; player ship
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
; large asteroids
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; medium asteroids
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; small asteroids
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
        dc i2'0'
        dc i2'0'
; player missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; saucer missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; wreckage
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; large saucer
        dc i2'0'
; small saucer
        dc i2'0'
; particles
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
        
yPosList anop
; player ship
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
; large asteroids
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; medium asteroids
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; small asteroids
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
        dc i2'0'
        dc i2'0'
; player missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; saucer missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; wreckage
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; large saucer
        dc i2'0'
; small saucer
        dc i2'0'
; particles
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
        
xSpeedList anop
; player ship
        dc i2'0'
        dc i2'0'
; large asteroids
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; medium asteroids
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; small asteroids
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
        dc i2'0'
        dc i2'0'
; player missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; saucer missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; wreckage
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; large saucer
        dc i2'0'
; small saucer
        dc i2'0'
; particles
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
        
ySpeedList anop
; player ship
        dc i2'0'
        dc i2'0'
; large asteroids
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; medium asteroids
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; small asteroids
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
        dc i2'0'
        dc i2'0'
; player missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; saucer missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; wreckage
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; large saucer
        dc i2'0'
; small saucer
        dc i2'0'
; particles
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
        
angleList anop
; player ship
        dc i2'180'
        dc i2'180'
; large asteroids
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; medium asteroids
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; small asteroids
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
        dc i2'0'
        dc i2'0'
; player missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; saucer missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; wreckage
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; large saucer
        dc i2'0'
; small saucer
        dc i2'0'
; particles
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
        
rotationSpeedList anop
; player ship
        dc i2'0'
        dc i2'0'
; large asteroids
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; medium asteroids
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; small asteroids
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
        dc i2'0'
        dc i2'0'
; player missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; saucer missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; wreckage
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; large saucer
        dc i2'0'
; small saucer
        dc i2'0'
; particles
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
        
colorList anop
; player
        dc i2'$bb'
        dc i2'$00'
; large asteroids
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
; medium asteroids
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$bb'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
; small asteroids
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
        dc i2'$88'
; player missiles
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
; saucer missiles
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
; wreckage
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
        dc i2'$bb'
; large saucer
        dc i2'$bb'
; small saucer
        dc i2'$bb'
; particles
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
        
lifetimeList anop
; player ship
        dc i2'-1'
        dc i2'-1'
; large asteroids
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; medium asteroids
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; small asteroids
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
        dc i2'0'
        dc i2'0'
; player missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; saucer missiles
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; wreckage
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
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
; large saucer
        dc i2'0'
; small saucer
        dc i2'0'
; particles
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

objectTypeList anop
        dc i2'OBJECT_PLAYER'
        dc i2'OBJECT_THRUST'

        dc i2'OBJECT_LARGE_ROCK'
        dc i2'OBJECT_LARGE_ROCK'
        dc i2'OBJECT_LARGE_ROCK'
        dc i2'OBJECT_LARGE_ROCK'
        dc i2'OBJECT_LARGE_ROCK'
        dc i2'OBJECT_LARGE_ROCK'
        dc i2'OBJECT_LARGE_ROCK'
        dc i2'OBJECT_LARGE_ROCK'

        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'
        dc i2'OBJECT_MEDIUM_ROCK'

        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'

        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'

        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'

        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'
        dc i2'OBJECT_SMALL_ROCK'

        dc i2'OBJECT_PLAYER_MISSILE'
        dc i2'OBJECT_PLAYER_MISSILE'
        dc i2'OBJECT_PLAYER_MISSILE'
        dc i2'OBJECT_PLAYER_MISSILE'

        dc i2'OBJECT_SAUCER_MISSILE'
        dc i2'OBJECT_SAUCER_MISSILE'
        dc i2'OBJECT_SAUCER_MISSILE'
        dc i2'OBJECT_SAUCER_MISSILE'
        dc i2'OBJECT_SAUCER_MISSILE'
        dc i2'OBJECT_SAUCER_MISSILE'
        dc i2'OBJECT_SAUCER_MISSILE'
        dc i2'OBJECT_SAUCER_MISSILE'

        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        dc i2'OBJECT_WRECKAGE'
        
        dc i2'OBJECT_LARGE_SAUCER'
        dc i2'OBJECT_SMALL_SAUCER'

        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'

        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'

        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'

        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'

        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'

        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'

        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'

        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'
        dc i2'OBJECT_PARTICLE'

        
        end
