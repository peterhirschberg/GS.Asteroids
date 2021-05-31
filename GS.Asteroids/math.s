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

        

; x / a -> QUOTNT
divide entry
        stz QUOTNT
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
        
div3    rol QUOTNT
        pla
        lsr a
        dey
        bne div4
        
        rtl


compare entry
        stz relation
        lda param1
        sec
        sbc param2
        beq same
        bvs invert
        bmi less
greater inc relation
        bra same
invert  bmi greater
less    dec relation
same    clc
        xce
        rtl

        
; negate A using 2's complement. Should be a macro
negate entry
    eor #$ffff
    inc a
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
        

xpoint dc i2'0'
ypoint dc i2'0'
angle dc i2'0'
sinvalue dc i2'0'
cosvalue dc i2'0'

        end
