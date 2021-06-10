;
;  math.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

math start
        using globalData

multiply entry
        clc
        xce
        rep #$30

        longa on
        longi on

        lda #0

mult1   ldx param1
        beq done
        lsr param1
        bcc mult2
        clc
        adc param2

mult2   asl param2
        bra mult1

done    anop
        rtl




; x / a -> quotnt
divide entry
        stz quotnt
        ldy #1

div1    asl a
        bcs div2
        iny
        cpy #17
        bne div1

div2    ror a

div4    pha
        txa
        sec
        sbc 1,s
        bcc div3
        tax

div3    rol quotnt
        pla
        lsr a
        dey
        bne div4

        rtl




        
rotate entry

        lda param1
        sta xpoint
        
        lda param2
        sta ypoint
        
        lda param3
        asl a
        sta angle
        
        ldy angle
        lda cosTable,y
        sta cosvalue

        ldy angle
        lda sinTable,y
        sta sinvalue

; rotatedX = x * cos(angle) - y * sin(angle)
; x
        lda xpoint
        sta param1
        lda cosvalue
        sta param2
        
        jsl multiply
        sta temp1

        lda ypoint
        sta param1
        lda sinvalue
        sta param2
        
        jsl multiply
        sta temp2

        lda temp1
        sec
        sbc temp2
       
        bmi negX
        bra posX
negX anop
        eor #$ffff
        inc a
        
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a

        eor #$ffff
        inc a

        sta result1
        bra doY
posX anop

        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a

        sta result1

doY anop

; rotatedY = x * sin(angle) + y * cos(angle)
; y
        lda xpoint
        sta param1
        lda sinvalue
        sta param2
        
        jsl multiply
        sta temp1

        lda ypoint
        sta param1
        lda cosvalue
        sta param2
        
        jsl multiply
        sta temp2
        
        lda temp1
        clc
        adc temp2

        bmi negY
        bra posY
negY anop
        eor #$ffff
        inc a

        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a

        eor #$ffff
        inc a
        
        sta result2
        bra rotateDone
        
posY anop
        
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        
        sta result2

rotateDone anop
        
        rtl



; Calculates the angle between two specified points
calcPointsAngle entry

; saucer
        lda param1
        sta x1
        lda param2
        sta y1

; player
        lda param3
        sta x2
        lda param4
        sta y2

; get left/right
        lda x1
        cmp x2
        bcs left

; right
        lda y1
        cmp y2
        bcs rightAndUp

; right and down
        lda #3
        sta quadrant
        jsr getQuadrantAngle
        rts

; right and up
rightAndUp anop
        lda #2
        sta quadrant
        jsr getQuadrantAngle
        rts

; left
left anop
        lda y2
        cmp y1
        bcs leftAndDown

; left and up
        lda #1
        sta quadrant
        jsr getQuadrantAngle
        rts

; left and down
leftAndDown anop
        lda #0
        sta quadrant
        jsr getQuadrantAngle
        rts


getQuadrantAngle entry

; get distances

        lda x2
        sec
        sbc x1
        sta dx

        lda y2
        sec
        sbc y1
        sta dy

; rotate to correct quadrant

        lda quadrant
        asl a
        tax
        lda quadrantAngleTable,x
        sta quadrantAngle

        lda dx
        sta param1

        lda dy
        sta param2

        lda quadrantAngle
        sta param3

        jsl rotate

        lda result1
        sta rx

        lda result2
        sta ry

; get XY distance

        ldx ry
        lda rx
        jsl divide
        lda quotnt
        sta distanceXY

; atan

; TODO: Do this in ASM with a atan lookup table
; For now I am calling into C code to do the distance division
; which produces a very small floating point number that gets
; fed into the atan function. Need to figure out how to handle
; this without the call into C code.


;        lda distanceXY
;        pha

        lda ry
        pha

        lda rx
        pha

; CALL INTO C FUNCTION FOR ATAN
        jsl catan2
        sta pointAngle

; rotate back from rotated quadrant

        lda quadrant
        asl a
        tax
        lda invQuadrantAngleTable,x
        sta quadrantAngle

        lda pointAngle
        clc
        adc quadrantAngle
        sta pointAngle


; range check the angle - keep within 0-359

        bmi isNeg

        lda pointAngle
        cmp #360
        bcs tooLarge

        lda pointAngle
        rts

tooLarge anop
        lda pointAngle
        sec
        sbc #360
        sta pointAngle
        rts

isNeg anop
        clc
        adc #360
        sta pointAngle

        rts





quotnt dc i2'0'

xpoint dc i2'0'
ypoint dc i2'0'

angle dc i2'0'

sinvalue dc i2'0'
cosvalue dc i2'0'

quadrant dc i2'0'
quadrantAngle dc i2'0'

dx dc i2'0'
dy dc i2'0'

rx dc i2'0'
ry dc i2'0'

distanceXY dc i2'0'

pointAngle dc i2'0'




quadrantAngleTable anop
        dc i2'270'
        dc i2'180'
        dc i2'90'
        dc i2'0'

invQuadrantAngleTable anop
        dc i2'-270'
        dc i2'-180'
        dc i2'-90'
        dc i2'0'

sinTable anop
        dc i2'$0'
        dc i2'$4'
        dc i2'$8'
        dc i2'$d'
        dc i2'$11'
        dc i2'$16'
        dc i2'$1a'
        dc i2'$1f'
        dc i2'$23'
        dc i2'$27'
        dc i2'$2c'
        dc i2'$30'
        dc i2'$35'
        dc i2'$39'
        dc i2'$3d'
        dc i2'$41'
        dc i2'$46'
        dc i2'$4a'
        dc i2'$4e'
        dc i2'$53'
        dc i2'$57'
        dc i2'$5b'
        dc i2'$5f'
        dc i2'$63'
        dc i2'$67'
        dc i2'$6b'
        dc i2'$6f'
        dc i2'$73'
        dc i2'$77'
        dc i2'$7b'
        dc i2'$7f'
        dc i2'$83'
        dc i2'$87'
        dc i2'$8a'
        dc i2'$8e'
        dc i2'$92'
        dc i2'$95'
        dc i2'$99'
        dc i2'$9c'
        dc i2'$a0'
        dc i2'$a3'
        dc i2'$a7'
        dc i2'$aa'
        dc i2'$ad'
        dc i2'$b1'
        dc i2'$b4'
        dc i2'$b7'
        dc i2'$ba'
        dc i2'$bd'
        dc i2'$c0'
        dc i2'$c3'
        dc i2'$c6'
        dc i2'$c8'
        dc i2'$cb'
        dc i2'$ce'
        dc i2'$d0'
        dc i2'$d3'
        dc i2'$d5'
        dc i2'$d8'
        dc i2'$da'
        dc i2'$dc'
        dc i2'$df'
        dc i2'$e1'
        dc i2'$e3'
        dc i2'$e5'
        dc i2'$e7'
        dc i2'$e8'
        dc i2'$ea'
        dc i2'$ec'
        dc i2'$ee'
        dc i2'$ef'
        dc i2'$f1'
        dc i2'$f2'
        dc i2'$f3'
        dc i2'$f5'
        dc i2'$f6'
        dc i2'$f7'
        dc i2'$f8'
        dc i2'$f9'
        dc i2'$fa'
        dc i2'$fb'
        dc i2'$fb'
        dc i2'$fc'
        dc i2'$fd'
        dc i2'$fd'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$ff'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fd'
        dc i2'$fd'
        dc i2'$fc'
        dc i2'$fb'
        dc i2'$fb'
        dc i2'$fa'
        dc i2'$f9'
        dc i2'$f8'
        dc i2'$f7'
        dc i2'$f6'
        dc i2'$f5'
        dc i2'$f3'
        dc i2'$f2'
        dc i2'$f1'
        dc i2'$ef'
        dc i2'$ee'
        dc i2'$ec'
        dc i2'$ea'
        dc i2'$e8'
        dc i2'$e7'
        dc i2'$e5'
        dc i2'$e3'
        dc i2'$e1'
        dc i2'$df'
        dc i2'$dc'
        dc i2'$da'
        dc i2'$d8'
        dc i2'$d5'
        dc i2'$d3'
        dc i2'$d0'
        dc i2'$ce'
        dc i2'$cb'
        dc i2'$c8'
        dc i2'$c6'
        dc i2'$c3'
        dc i2'$c0'
        dc i2'$bd'
        dc i2'$ba'
        dc i2'$b7'
        dc i2'$b4'
        dc i2'$b1'
        dc i2'$ad'
        dc i2'$aa'
        dc i2'$a7'
        dc i2'$a3'
        dc i2'$a0'
        dc i2'$9c'
        dc i2'$99'
        dc i2'$95'
        dc i2'$92'
        dc i2'$8e'
        dc i2'$8a'
        dc i2'$87'
        dc i2'$83'
        dc i2'$7f'
        dc i2'$7b'
        dc i2'$77'
        dc i2'$73'
        dc i2'$6f'
        dc i2'$6b'
        dc i2'$67'
        dc i2'$63'
        dc i2'$5f'
        dc i2'$5b'
        dc i2'$57'
        dc i2'$53'
        dc i2'$4e'
        dc i2'$4a'
        dc i2'$46'
        dc i2'$41'
        dc i2'$3d'
        dc i2'$39'
        dc i2'$35'
        dc i2'$30'
        dc i2'$2c'
        dc i2'$27'
        dc i2'$23'
        dc i2'$1f'
        dc i2'$1a'
        dc i2'$16'
        dc i2'$11'
        dc i2'$d'
        dc i2'$8'
        dc i2'$4'
        dc i2'$0'
        dc i2'-$5'
        dc i2'-$9'
        dc i2'-$e'
        dc i2'-$12'
        dc i2'-$17'
        dc i2'-$1b'
        dc i2'-$20'
        dc i2'-$24'
        dc i2'-$28'
        dc i2'-$2d'
        dc i2'-$31'
        dc i2'-$36'
        dc i2'-$3a'
        dc i2'-$3e'
        dc i2'-$42'
        dc i2'-$47'
        dc i2'-$4b'
        dc i2'-$4f'
        dc i2'-$54'
        dc i2'-$58'
        dc i2'-$5c'
        dc i2'-$60'
        dc i2'-$64'
        dc i2'-$68'
        dc i2'-$6c'
        dc i2'-$70'
        dc i2'-$74'
        dc i2'-$78'
        dc i2'-$7c'
        dc i2'-$80'
        dc i2'-$84'
        dc i2'-$88'
        dc i2'-$8b'
        dc i2'-$8f'
        dc i2'-$93'
        dc i2'-$96'
        dc i2'-$9a'
        dc i2'-$9d'
        dc i2'-$a1'
        dc i2'-$a4'
        dc i2'-$a8'
        dc i2'-$ab'
        dc i2'-$ae'
        dc i2'-$b2'
        dc i2'-$b5'
        dc i2'-$b8'
        dc i2'-$bb'
        dc i2'-$be'
        dc i2'-$c1'
        dc i2'-$c4'
        dc i2'-$c7'
        dc i2'-$c9'
        dc i2'-$cc'
        dc i2'-$cf'
        dc i2'-$d1'
        dc i2'-$d4'
        dc i2'-$d6'
        dc i2'-$d9'
        dc i2'-$db'
        dc i2'-$dd'
        dc i2'-$e0'
        dc i2'-$e2'
        dc i2'-$e4'
        dc i2'-$e6'
        dc i2'-$e8'
        dc i2'-$e9'
        dc i2'-$eb'
        dc i2'-$ed'
        dc i2'-$ef'
        dc i2'-$f0'
        dc i2'-$f2'
        dc i2'-$f3'
        dc i2'-$f4'
        dc i2'-$f6'
        dc i2'-$f7'
        dc i2'-$f8'
        dc i2'-$f9'
        dc i2'-$fa'
        dc i2'-$fb'
        dc i2'-$fc'
        dc i2'-$fc'
        dc i2'-$fd'
        dc i2'-$fe'
        dc i2'-$fe'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$fe'
        dc i2'-$fe'
        dc i2'-$fd'
        dc i2'-$fc'
        dc i2'-$fc'
        dc i2'-$fb'
        dc i2'-$fa'
        dc i2'-$f9'
        dc i2'-$f8'
        dc i2'-$f7'
        dc i2'-$f6'
        dc i2'-$f4'
        dc i2'-$f3'
        dc i2'-$f2'
        dc i2'-$f0'
        dc i2'-$ef'
        dc i2'-$ed'
        dc i2'-$eb'
        dc i2'-$e9'
        dc i2'-$e8'
        dc i2'-$e6'
        dc i2'-$e4'
        dc i2'-$e2'
        dc i2'-$e0'
        dc i2'-$dd'
        dc i2'-$db'
        dc i2'-$d9'
        dc i2'-$d6'
        dc i2'-$d4'
        dc i2'-$d1'
        dc i2'-$cf'
        dc i2'-$cc'
        dc i2'-$c9'
        dc i2'-$c7'
        dc i2'-$c4'
        dc i2'-$c1'
        dc i2'-$be'
        dc i2'-$bb'
        dc i2'-$b8'
        dc i2'-$b5'
        dc i2'-$b2'
        dc i2'-$ae'
        dc i2'-$ab'
        dc i2'-$a8'
        dc i2'-$a4'
        dc i2'-$a1'
        dc i2'-$9d'
        dc i2'-$9a'
        dc i2'-$96'
        dc i2'-$93'
        dc i2'-$8f'
        dc i2'-$8b'
        dc i2'-$88'
        dc i2'-$84'
        dc i2'-$80'
        dc i2'-$7c'
        dc i2'-$78'
        dc i2'-$74'
        dc i2'-$70'
        dc i2'-$6c'
        dc i2'-$68'
        dc i2'-$64'
        dc i2'-$60'
        dc i2'-$5c'
        dc i2'-$58'
        dc i2'-$54'
        dc i2'-$4f'
        dc i2'-$4b'
        dc i2'-$47'
        dc i2'-$42'
        dc i2'-$3e'
        dc i2'-$3a'
        dc i2'-$36'
        dc i2'-$31'
        dc i2'-$2d'
        dc i2'-$28'
        dc i2'-$24'
        dc i2'-$20'
        dc i2'-$1b'
        dc i2'-$17'
        dc i2'-$12'
        dc i2'-$e'
        dc i2'-$9'
        dc i2'-$5'


cosTable anop
        dc i2'$ff'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fd'
        dc i2'$fd'
        dc i2'$fc'
        dc i2'$fb'
        dc i2'$fb'
        dc i2'$fa'
        dc i2'$f9'
        dc i2'$f8'
        dc i2'$f7'
        dc i2'$f6'
        dc i2'$f5'
        dc i2'$f3'
        dc i2'$f2'
        dc i2'$f1'
        dc i2'$ef'
        dc i2'$ee'
        dc i2'$ec'
        dc i2'$ea'
        dc i2'$e8'
        dc i2'$e7'
        dc i2'$e5'
        dc i2'$e3'
        dc i2'$e1'
        dc i2'$df'
        dc i2'$dc'
        dc i2'$da'
        dc i2'$d8'
        dc i2'$d5'
        dc i2'$d3'
        dc i2'$d0'
        dc i2'$ce'
        dc i2'$cb'
        dc i2'$c8'
        dc i2'$c6'
        dc i2'$c3'
        dc i2'$c0'
        dc i2'$bd'
        dc i2'$ba'
        dc i2'$b7'
        dc i2'$b4'
        dc i2'$b1'
        dc i2'$ad'
        dc i2'$aa'
        dc i2'$a7'
        dc i2'$a3'
        dc i2'$a0'
        dc i2'$9c'
        dc i2'$99'
        dc i2'$95'
        dc i2'$92'
        dc i2'$8e'
        dc i2'$8a'
        dc i2'$87'
        dc i2'$83'
        dc i2'$7f'
        dc i2'$7b'
        dc i2'$77'
        dc i2'$73'
        dc i2'$6f'
        dc i2'$6b'
        dc i2'$67'
        dc i2'$63'
        dc i2'$5f'
        dc i2'$5b'
        dc i2'$57'
        dc i2'$53'
        dc i2'$4e'
        dc i2'$4a'
        dc i2'$46'
        dc i2'$41'
        dc i2'$3d'
        dc i2'$39'
        dc i2'$35'
        dc i2'$30'
        dc i2'$2c'
        dc i2'$27'
        dc i2'$23'
        dc i2'$1f'
        dc i2'$1a'
        dc i2'$16'
        dc i2'$11'
        dc i2'$d'
        dc i2'$8'
        dc i2'$4'
        dc i2'$0'
        dc i2'-$5'
        dc i2'-$9'
        dc i2'-$e'
        dc i2'-$12'
        dc i2'-$17'
        dc i2'-$1b'
        dc i2'-$20'
        dc i2'-$24'
        dc i2'-$28'
        dc i2'-$2d'
        dc i2'-$31'
        dc i2'-$36'
        dc i2'-$3a'
        dc i2'-$3e'
        dc i2'-$42'
        dc i2'-$47'
        dc i2'-$4b'
        dc i2'-$4f'
        dc i2'-$54'
        dc i2'-$58'
        dc i2'-$5c'
        dc i2'-$60'
        dc i2'-$64'
        dc i2'-$68'
        dc i2'-$6c'
        dc i2'-$70'
        dc i2'-$74'
        dc i2'-$78'
        dc i2'-$7c'
        dc i2'-$80'
        dc i2'-$84'
        dc i2'-$88'
        dc i2'-$8b'
        dc i2'-$8f'
        dc i2'-$93'
        dc i2'-$96'
        dc i2'-$9a'
        dc i2'-$9d'
        dc i2'-$a1'
        dc i2'-$a4'
        dc i2'-$a8'
        dc i2'-$ab'
        dc i2'-$ae'
        dc i2'-$b2'
        dc i2'-$b5'
        dc i2'-$b8'
        dc i2'-$bb'
        dc i2'-$be'
        dc i2'-$c1'
        dc i2'-$c4'
        dc i2'-$c7'
        dc i2'-$c9'
        dc i2'-$cc'
        dc i2'-$cf'
        dc i2'-$d1'
        dc i2'-$d4'
        dc i2'-$d6'
        dc i2'-$d9'
        dc i2'-$db'
        dc i2'-$dd'
        dc i2'-$e0'
        dc i2'-$e2'
        dc i2'-$e4'
        dc i2'-$e6'
        dc i2'-$e8'
        dc i2'-$e9'
        dc i2'-$eb'
        dc i2'-$ed'
        dc i2'-$ef'
        dc i2'-$f0'
        dc i2'-$f2'
        dc i2'-$f3'
        dc i2'-$f4'
        dc i2'-$f6'
        dc i2'-$f7'
        dc i2'-$f8'
        dc i2'-$f9'
        dc i2'-$fa'
        dc i2'-$fb'
        dc i2'-$fc'
        dc i2'-$fc'
        dc i2'-$fd'
        dc i2'-$fe'
        dc i2'-$fe'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$ff'
        dc i2'-$fe'
        dc i2'-$fe'
        dc i2'-$fd'
        dc i2'-$fc'
        dc i2'-$fc'
        dc i2'-$fb'
        dc i2'-$fa'
        dc i2'-$f9'
        dc i2'-$f8'
        dc i2'-$f7'
        dc i2'-$f6'
        dc i2'-$f4'
        dc i2'-$f3'
        dc i2'-$f2'
        dc i2'-$f0'
        dc i2'-$ef'
        dc i2'-$ed'
        dc i2'-$eb'
        dc i2'-$e9'
        dc i2'-$e8'
        dc i2'-$e6'
        dc i2'-$e4'
        dc i2'-$e2'
        dc i2'-$e0'
        dc i2'-$dd'
        dc i2'-$db'
        dc i2'-$d9'
        dc i2'-$d6'
        dc i2'-$d4'
        dc i2'-$d1'
        dc i2'-$cf'
        dc i2'-$cc'
        dc i2'-$c9'
        dc i2'-$c7'
        dc i2'-$c4'
        dc i2'-$c1'
        dc i2'-$be'
        dc i2'-$bb'
        dc i2'-$b8'
        dc i2'-$b5'
        dc i2'-$b2'
        dc i2'-$ae'
        dc i2'-$ab'
        dc i2'-$a8'
        dc i2'-$a4'
        dc i2'-$a1'
        dc i2'-$9d'
        dc i2'-$9a'
        dc i2'-$96'
        dc i2'-$93'
        dc i2'-$8f'
        dc i2'-$8b'
        dc i2'-$88'
        dc i2'-$84'
        dc i2'-$80'
        dc i2'-$7c'
        dc i2'-$78'
        dc i2'-$74'
        dc i2'-$70'
        dc i2'-$6c'
        dc i2'-$68'
        dc i2'-$64'
        dc i2'-$60'
        dc i2'-$5c'
        dc i2'-$58'
        dc i2'-$54'
        dc i2'-$4f'
        dc i2'-$4b'
        dc i2'-$47'
        dc i2'-$42'
        dc i2'-$3e'
        dc i2'-$3a'
        dc i2'-$36'
        dc i2'-$31'
        dc i2'-$2d'
        dc i2'-$28'
        dc i2'-$24'
        dc i2'-$20'
        dc i2'-$1b'
        dc i2'-$17'
        dc i2'-$12'
        dc i2'-$e'
        dc i2'-$9'
        dc i2'-$5'
        dc i2'-$1'
        dc i2'$4'
        dc i2'$8'
        dc i2'$d'
        dc i2'$11'
        dc i2'$16'
        dc i2'$1a'
        dc i2'$1f'
        dc i2'$23'
        dc i2'$27'
        dc i2'$2c'
        dc i2'$30'
        dc i2'$35'
        dc i2'$39'
        dc i2'$3d'
        dc i2'$41'
        dc i2'$46'
        dc i2'$4a'
        dc i2'$4e'
        dc i2'$53'
        dc i2'$57'
        dc i2'$5b'
        dc i2'$5f'
        dc i2'$63'
        dc i2'$67'
        dc i2'$6b'
        dc i2'$6f'
        dc i2'$73'
        dc i2'$77'
        dc i2'$7b'
        dc i2'$7f'
        dc i2'$83'
        dc i2'$87'
        dc i2'$8a'
        dc i2'$8e'
        dc i2'$92'
        dc i2'$95'
        dc i2'$99'
        dc i2'$9c'
        dc i2'$a0'
        dc i2'$a3'
        dc i2'$a7'
        dc i2'$aa'
        dc i2'$ad'
        dc i2'$b1'
        dc i2'$b4'
        dc i2'$b7'
        dc i2'$ba'
        dc i2'$bd'
        dc i2'$c0'
        dc i2'$c3'
        dc i2'$c6'
        dc i2'$c8'
        dc i2'$cb'
        dc i2'$ce'
        dc i2'$d0'
        dc i2'$d3'
        dc i2'$d5'
        dc i2'$d8'
        dc i2'$da'
        dc i2'$dc'
        dc i2'$df'
        dc i2'$e1'
        dc i2'$e3'
        dc i2'$e5'
        dc i2'$e7'
        dc i2'$e8'
        dc i2'$ea'
        dc i2'$ec'
        dc i2'$ee'
        dc i2'$ef'
        dc i2'$f1'
        dc i2'$f2'
        dc i2'$f3'
        dc i2'$f5'
        dc i2'$f6'
        dc i2'$f7'
        dc i2'$f8'
        dc i2'$f9'
        dc i2'$fa'
        dc i2'$fb'
        dc i2'$fb'
        dc i2'$fc'
        dc i2'$fd'
        dc i2'$fd'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        dc i2'$fe'
        


        end
