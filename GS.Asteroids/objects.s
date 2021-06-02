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
        cmp #SCREEN_YMAX
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
        lda #SCREEN_YMAX
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

        lda #0
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

        lda #0
        cmp angle
        beq drawNoRotate

        stx savex
        sty savey
        jsr drawObjectWithRotate
        ldx savex
        ldy savey
        
        bra nextObject
        
drawNoRotate anop
        stx savex
        sty savey
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


drawObject entry

; ------------------
; check for dots

        ldx objectShapeDataIndex
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

        ldx objectShapeDataIndex
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

; missile
        dc i2'2'

        dc i2'0'
        dc i2'-2'

        dc i2'0'
        dc i2'2'

; dot
        dc i2'1'

        dc i2'0'
        dc i2'0'

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



SHAPE_OFFSET_PLAYER     gequ $0
SHAPE_OFFSET_THRUST     gequ $1a
SHAPE_OFFSET_MISSILE        gequ $28
SHAPE_OFFSET_DOT        gequ $32
SHAPE_OFFSET_LARGE_ROCK1        gequ $38
SHAPE_OFFSET_LARGE_ROCK2        gequ $66
SHAPE_OFFSET_LARGE_ROCK3        gequ $9c
SHAPE_OFFSET_MEDIUM_ROCK1       gequ $d2
SHAPE_OFFSET_MEDIUM_ROCK2       gequ $100
SHAPE_OFFSET_MEDIUM_ROCK3       gequ $136
SHAPE_OFFSET_SMALL_ROCK1        gequ $16c
SHAPE_OFFSET_SMALL_ROCK2        gequ $19a
SHAPE_OFFSET_SMALL_ROCK3        gequ $1d0

OBJECTOFFSET_SHAPEDATA          gequ 0
OBJECTOFFSET_XPOS               gequ 2
OBJECTOFFSET_YPOS               gequ 4
OBJECTOFFSET_XSPEED             gequ 6
OBJECTOFFSET_YSPEED             gequ 8
OBJECTOFFSET_ANGLE              gequ 10
OBJECTOFFSET_ROTATION_SPEED     gequ 12
OBJECTOFFSET_COLOR              gequ 14

OBJECT_PLAYER                   gequ 0
OBJECT_THRUST                   gequ 2
OBJECT_LARGE_ROCK1              gequ 4
OBJECT_LARGE_ROCK2              gequ 6
OBJECT_LARGE_ROCK3              gequ 8
OBJECT_LARGE_ROCK4              gequ 10
OBJECT_PLAYER_MISSILE1          gequ 12
OBJECT_PLAYER_MISSILE2          gequ 14
OBJECT_PLAYER_MISSILE3          gequ 16
OBJECT_PLAYER_MISSILE4          gequ 18

NUM_OBJECTS                     gequ 10
NUM_PLAYER_MISSILES             gequ 4
NUM_ROCKS                       gequ 4

shapeList anop
; player ship and thrust
        dc i2'SHAPE_OFFSET_PLAYER'
        dc i2'SHAPE_OFFSET_THRUST'
; large asteroids
        dc i2'SHAPE_OFFSET_LARGE_ROCK3'
        dc i2'SHAPE_OFFSET_LARGE_ROCK1'
        dc i2'SHAPE_OFFSET_LARGE_ROCK2'
        dc i2'SHAPE_OFFSET_LARGE_ROCK1'
; player missiles
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
; player missiles (size not used for these)
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

xPosList anop
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'
        dc i2'MIDSCREEN_X'

yPosList anop
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'
        dc i2'MIDSCREEN_Y'

xSpeedList anop
        dc i2'0'
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
        dc i2'0'
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
        dc i2'180'
        dc i2'180'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

rotationSpeedList anop
        dc i2'0'
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
        dc i2'$ff'
        dc i2'$00'
        dc i2'$aa'
        dc i2'$aa'
        dc i2'$aa'
        dc i2'$aa'
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'
        dc i2'$ff'

lifetimeList anop
        dc i2'$-1'
        dc i2'$-1'
        dc i2'$-1'
        dc i2'$-1'
        dc i2'$-1'
        dc i2'$-1'
        dc i2'$0'
        dc i2'$0'
        dc i2'$0'
        dc i2'$0'

        end
