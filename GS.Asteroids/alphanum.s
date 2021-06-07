;
;  alphanum.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

alphanum start
        using globalData
        using alphanumData
        using displayListData
        using gameData
        using scoreData
        
        
scaleCoord entry

        bmi isNeg
        lsr a
        rts
        
isNeg anop

        eor #$ffff
        inc a

        lsr a

        eor #$ffff
        inc a

        rts

        
; Letter to draw is in A
drawLetter entry

        asl a
        tay

        lda characterData,y
        lsr a
        sta lineCount
        iny
        iny

lineLoop anop

        ldx displayListLength

        lda characterData,y
        jsr scaleCoord
        clc
        adc charXPos
        sta displayListList,x
        inx
        inx
        iny
        iny

        lda characterData,y
        jsr scaleCoord
        clc
        adc charYPos
        sta displayListList,x
        inx
        inx
        iny
        iny

        lda characterData,y
        jsr scaleCoord
        clc
        adc charXPos
        sta displayListList,x
        inx
        inx
        iny
        iny

        lda characterData,y
        jsr scaleCoord
        clc
        adc charYPos
        sta displayListList,x
        inx
        inx
        iny
        iny

        stx displayListLength
        
        ldx displayListColorLength
        lda color
        sta displayListColors,x
        inx
        inx
        stx displayListColorLength
        
        dec lineCount
        lda lineCount
        cmp #0
        beq letterDone
        jmp lineLoop

letterDone anop
        
        rts
        
        
        
drawText entry

        lda #10
        sta charXPos

        lda #10
        sta charYPos

        ldx #0
        
drawTextLoop anop

        lda textAsteroidsData,x
        cmp #-1
        beq drawTextDone
        
        stx savexDraw
        sty saveyDraw
        jsr drawLetter
        ldx savexDraw
        ldy saveyDraw
        
        lda charXPos
        clc
        adc #10
        sta charXPos
        
        inx
        inx
        jmp drawTextLoop
        
drawTextDone anop
        
        rtl

        
drawScore entry

        lda #0
        sta firstDigit

        lda #10
        sta charXPos

        lda #10
        sta charYPos

        
        lda scoreDigit100000s
        cmp firstDigit
        beq scoreSkip1
        asl a
        tax
        lda digitData,x
        jsr drawLetter
        lda charXPos
        clc
        adc #7
        sta charXPos

        lda #-1
        sta firstDigit
        
scoreSkip1 anop
        
        lda scoreDigit10000s
        cmp firstDigit
        beq scoreSkip2
        asl a
        tax
        lda digitData,x
        jsr drawLetter
        lda charXPos
        clc
        adc #7
        sta charXPos

        lda #-1
        sta firstDigit

scoreSkip2 anop

        lda scoreDigit1000s
        cmp firstDigit
        beq scoreSkip3
        asl a
        tax
        lda digitData,x
        jsr drawLetter
        lda charXPos
        clc
        adc #7
        sta charXPos

        lda #-1
        sta firstDigit

scoreSkip3 anop

        lda scoreDigit100s
        cmp firstDigit
        beq scoreSkip4
        asl a
        tax
        lda digitData,x
        jsr drawLetter
        lda charXPos
        clc
        adc #7
        sta charXPos

        lda #-1
        sta firstDigit

scoreSkip4 anop

        lda scoreDigit10s
        cmp firstDigit
        beq scoreSkip5
        asl a
        tax
        lda digitData,x
        jsr drawLetter
        lda charXPos
        clc
        adc #7
        sta charXPos

        lda #-1
        sta firstDigit

scoreSkip5 anop
        
; 1s place is always 0 :-)
        lda #OFFSET_0
        jsr drawLetter


        rtl
        

lineCount dc i2'0'
charXPos dc i4'0'
charYPos dc i4'0'
color dc i2'$aa'
savex dc i2'0'
savey dc i2'0'
savexDraw dc i2'0'
saveyDraw dc i2'0'
temp dc i2'0'
firstDigit dc i2'0'

        end


alphanumData data

digitData anop
        dc i2'OFFSET_0'
        dc i2'OFFSET_1'
        dc i2'OFFSET_2'
        dc i2'OFFSET_3'
        dc i2'OFFSET_4'
        dc i2'OFFSET_5'
        dc i2'OFFSET_6'
        dc i2'OFFSET_7'
        dc i2'OFFSET_8'
        dc i2'OFFSET_9'

textAsteroidsData anop
        dc i2'OFFSET_A'
        dc i2'OFFSET_S'
        dc i2'OFFSET_T'
        dc i2'OFFSET_E'
        dc i2'OFFSET_R'
        dc i2'OFFSET_O'
        dc i2'OFFSET_I'
        dc i2'OFFSET_D'
        dc i2'OFFSET_S'
        dc i2'-1'
    
    
characterData anop
; A
        dc i2'10'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-2'

        dc i2'-5'
        dc i2'-2'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'-8'

        dc i2'5'
        dc i2'-2'

        dc i2'5'
        dc i2'-2'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'2'

        dc i2'5'
        dc i2'2'

; B
        dc i2'20'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'3'
        dc i2'-8'

        dc i2'3'
        dc i2'-8'

        dc i2'5'
        dc i2'-6'

        dc i2'5'
        dc i2'-6'

        dc i2'5'
        dc i2'-3'

        dc i2'5'
        dc i2'-3'

        dc i2'2'
        dc i2'0'

        dc i2'2'
        dc i2'0'

        dc i2'5'
        dc i2'2'

        dc i2'5'
        dc i2'2'

        dc i2'5'
        dc i2'5'

        dc i2'5'
        dc i2'5'

        dc i2'3'
        dc i2'8'

        dc i2'3'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'2'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

; C
        dc i2'6'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

; D
        dc i2'12'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'1'
        dc i2'-8'

        dc i2'1'
        dc i2'-8'

        dc i2'5'
        dc i2'-3'

        dc i2'5'
        dc i2'-3'

        dc i2'5'
        dc i2'2'

        dc i2'5'
        dc i2'2'

        dc i2'1'
        dc i2'8'

        dc i2'1'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

; E
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'2'
        dc i2'0'

; F
        dc i2'6'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'2'
        dc i2'0'

; G
        dc i2'12'

        dc i2'0'
        dc i2'2'

        dc i2'5'
        dc i2'2'

        dc i2'5'
        dc i2'2'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-2'

; H
        dc i2'6'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

; I
        dc i2'6'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'8'

        dc i2'-4'
        dc i2'-8'

        dc i2'3'
        dc i2'-8'

        dc i2'-4'
        dc i2'8'

        dc i2'3'
        dc i2'8'

; J
        dc i2'6'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'1'
        dc i2'8'

        dc i2'1'
        dc i2'8'

        dc i2'-4'
        dc i2'2'

; K
        dc i2'6'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'8'

; L
        dc i2'4'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

; M
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'0'
        dc i2'0'

        dc i2'0'
        dc i2'0'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

; N
        dc i2'6'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

; O
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

; P
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

; Q
        dc i2'12'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'2'

        dc i2'5'
        dc i2'2'

        dc i2'0'
        dc i2'8'

        dc i2'0'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'0'
        dc i2'0'

        dc i2'5'
        dc i2'8'

; R
        dc i2'10'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'8'

; S
        dc i2'10'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

; T
        dc i2'4'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

; U
        dc i2'6'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

; V
        dc i2'4'

        dc i2'-5'
        dc i2'-8'

        dc i2'0'
        dc i2'8'

        dc i2'0'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

; W
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'0'
        dc i2'1'

        dc i2'0'
        dc i2'1'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

; X
        dc i2'4'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

; Y
        dc i2'6'

        dc i2'-5'
        dc i2'-8'

        dc i2'0'
        dc i2'0'

        dc i2'0'
        dc i2'0'

        dc i2'5'
        dc i2'-8'

        dc i2'0'
        dc i2'0'

        dc i2'0'
        dc i2'8'

; Z
        dc i2'6'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

; 0
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

; 1
        dc i2'2'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'8'

; 2
        dc i2'10'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

; 3
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'0'

        dc i2'-3'
        dc i2'0'

; 4
        dc i2'6'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

; 5
        dc i2'10'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

; 6
        dc i2'12'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'0'

; 7
        dc i2'4'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

; 8
        dc i2'10'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

; 9
        dc i2'12'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

; LT
        dc i2'4'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'8'

; GT
        dc i2'4'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

        dc i2'-5'
        dc i2'8'

; L bracket
        dc i2'6'

        dc i2'3'
        dc i2'-8'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'8'

        dc i2'0'
        dc i2'8'

        dc i2'3'
        dc i2'8'

; R bracket
        dc i2'6'

        dc i2'-4'
        dc i2'-8'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'8'

        dc i2'0'
        dc i2'8'

        dc i2'-4'
        dc i2'8'

; Degrees
        dc i2'8'

        dc i2'-10'
        dc i2'-8'

        dc i2'-13'
        dc i2'-8'

        dc i2'-13'
        dc i2'-8'

        dc i2'-13'
        dc i2'-4'

        dc i2'-13'
        dc i2'-4'

        dc i2'-10'
        dc i2'-4'

        dc i2'-10'
        dc i2'-4'

        dc i2'-10'
        dc i2'-8'

; Asterisk
        dc i2'6'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'-8'

        dc i2'-5'
        dc i2'0'

        dc i2'5'
        dc i2'0'

; Period
        dc i2'2'

        dc i2'0'
        dc i2'4'

        dc i2'0'
        dc i2'8'

; Exclamation
        dc i2'4'

        dc i2'0'
        dc i2'6'

        dc i2'0'
        dc i2'8'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'3'

; Hyphen
        dc i2'2'

        dc i2'-4'
        dc i2'0'

        dc i2'4'
        dc i2'0'

; Plus
        dc i2'4'

        dc i2'-4'
        dc i2'0'

        dc i2'4'
        dc i2'0'

        dc i2'0'
        dc i2'4'

        dc i2'0'
        dc i2'-4'

; Copyright
        dc i2'14'

        dc i2'5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'8'

        dc i2'-5'
        dc i2'-8'

        dc i2'-5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'-8'

        dc i2'5'
        dc i2'8'

        dc i2'2'
        dc i2'4'

        dc i2'-3'
        dc i2'4'

        dc i2'-3'
        dc i2'4'

        dc i2'-3'
        dc i2'-4'

        dc i2'-3'
        dc i2'-4'

        dc i2'2'
        dc i2'-4'

; Doublequote
        dc i2'4'

        dc i2'2'
        dc i2'-8'

        dc i2'2'
        dc i2'0'

        dc i2'-3'
        dc i2'-8'

        dc i2'-3'
        dc i2'0'

; Quote
        dc i2'2'

        dc i2'0'
        dc i2'-8'

        dc i2'0'
        dc i2'-2'

; Comma
        dc i2'2'

        dc i2'-4'
        dc i2'14'

        dc i2'0'
        dc i2'4'

; Underscore
        dc i2'2'

        dc i2'-5'
        dc i2'8'

        dc i2'5'
        dc i2'8'



OFFSET_A gequ $0
OFFSET_B gequ $15
OFFSET_C gequ $3e
OFFSET_D gequ $4b
OFFSET_E gequ $64
OFFSET_F gequ $75
OFFSET_G gequ $82
OFFSET_H gequ $9b
OFFSET_I gequ $a8
OFFSET_J gequ $b5
OFFSET_K gequ $c2
OFFSET_L gequ $cf
OFFSET_M gequ $d8
OFFSET_N gequ $e9
OFFSET_O gequ $f6
OFFSET_P gequ $107
OFFSET_Q gequ $118
OFFSET_R gequ $131
OFFSET_S gequ $146
OFFSET_T gequ $15b
OFFSET_U gequ $164
OFFSET_V gequ $171
OFFSET_W gequ $17a
OFFSET_X gequ $18b
OFFSET_Y gequ $194
OFFSET_Z gequ $1a1
OFFSET_0 gequ $1ae
OFFSET_1 gequ $1bf
OFFSET_2 gequ $1c4
OFFSET_3 gequ $1d9
OFFSET_4 gequ $1ea
OFFSET_5 gequ $1f7
OFFSET_6 gequ $20c
OFFSET_7 gequ $225
OFFSET_8 gequ $22e
OFFSET_9 gequ $243
OFFSET_LT gequ $25c
OFFSET_GT gequ $265
OFFSET_LBRACKET gequ $26e
OFFSET_RBRACKET gequ $27b
OFFSET_DEGREES gequ $288
OFFSET_ASTERISK gequ $299
OFFSET_PERIOD gequ $2a6
OFFSET_EXCLAMATION gequ $2ab
OFFSET_HYPHEN gequ $2b4
OFFSET_PLUS gequ $2b9
OFFSET_COPY gequ $2c2
OFFSET_DOUBLEQUOTE gequ $2df
OFFSET_QUOTE gequ $2e8
OFFSET_COMMA gequ $2ed
OFFSET_UNDERSCORE gequ $2f2






        end



