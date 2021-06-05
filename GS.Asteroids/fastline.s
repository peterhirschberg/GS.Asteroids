;
;  fastline.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

fastLine start
        using globalData

        
drawDot entry

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

        lda x1
        lsr a
        clc
        adc offset
        tax

        lda x1
        and #1
        cpa #0
        beq leftNibble5

        lda >SCREEN_ADDR,x
        ora currentColorRight
        sta >SCREEN_ADDR,x

        rtl

leftNibble5 anop
        lda >SCREEN_ADDR,x
        ora currentColorLeft
        sta >SCREEN_ADDR,x

        rtl

        
eraseDot entry

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

        lda x1
        lsr a
        clc
        adc offset
        tax

        lda #00
        sta >SCREEN_ADDR,x
        
        rtl


drawFastLine entry

        lda y1
        cmp y2
        beq horizontalLine

        lda x1
        cmp x2
        beq HL0
        
        jmp lineOther
        
HL0 anop
        jmp verticalLine

horizontalLine anop
        lda x2
        sec
        sbc x1
        bmi HL1
        sta dX
        lda x1
        sta startX
        lda x2
        sta endX
        bra HL2
HL1 anop
        lda x1
        sec
        sbc x2
        sta dX
        lda x2
        sta startX
        lda x1
        sta endX
HL2 anop

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

HLloop anop

        lda startX
        lsr a
        clc
        adc offset
        tax

        lda startX
        bit #$0001
        beq leftNibble3

        lda >SCREEN_ADDR,x
        ora currentColorRight
        sta >SCREEN_ADDR,x
        bra HL3

leftNibble3 anop
        lda >SCREEN_ADDR,x
        ora currentColorLeft
        sta >SCREEN_ADDR,x
        
HL3 anop
        inc startX
        lda startX
        cmp endX
        beq HLdone
        sta startX
        jmp HLloop
        
HLdone anop

        rtl

verticalLine anop
        lda y2
        sec
        sbc y1
        bmi VL1
        sta dY
        lda y1
        sta startY
        lda y2
        sta endY
        bra VL2
VL1 anop
        lda y1
        sec
        sbc y2
        sta dY
        lda y2
        sta startY
        lda y1
        sta endY
VL2 anop

VLloop anop

        lda x1
        bit #$0001
        beq leftNibble4
        jmp rightNibble1
        
leftNibble4 anop

        lda startY
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

        lda x1
        lsr a
        clc
        adc offset
        tax

        lda >SCREEN_ADDR,x
        ora currentColorLeft
        sta >SCREEN_ADDR,x
        
        inc startY
        lda startY
        cmp endY
        beq VLdone
        sta startY
        jmp leftNibble4


rightNibble1 anop

        lda startY
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

        lda x1
        lsr a
        clc
        adc offset
        tax

        lda >SCREEN_ADDR,x
        ora currentColorRight
        sta >SCREEN_ADDR,x
        
        inc startY
        lda startY
        cmp endY
        beq VLdone
        sta startY
        jmp rightNibble1
        
        
VLdone anop

        rtl

lineOther anop

;int dX = abs(x2-x1);

        lda x1
        sec
        sbc x2
        bpl dontNegate1
        eor #$ffff
        inc a
dontNegate1 anop
        sta dX

;int dY = abs(y2-y1);

        lda y1
        sec
        sbc y2
        bpl dontNegate2
        eor #$ffff
        inc a
dontNegate2 anop
        sta dY

;if (x1 > x2) { Xincr=-1; } else { Xincr=1; } // which direction in X?

        lda x1
        cmp x2
        bcs x1Greater
        lda #1
        sta Xincr
        jmp x1LessThan
x1Greater anop
        lda #-1
        sta Xincr
x1LessThan anop

;if (y1 > y2) { Yincr=-1; } else { Yincr=1; } // which direction in Y?

        lda y1
        cmp y2
        bcs y1Greater
        lda #1
        sta Yincr
        jmp y1LessThan
y1Greater anop
        lda #-1
        sta Yincr
y1LessThan anop

;if (dX >= dY) {                // if X is the independent variable

        lda dX
        cmp dY
        bcs jump7
        brl slope2
jump7 anop

;    int dPr  = dY<<1;           // amount to increment decision if right is chosen

        lda dY
        asl a
        sta dPr

;    int dPru = dPr - (dX<<1);   // amount to increment decision if up is chosen

        lda dX
        asl a
        sta temp

        lda dPr
        sec
        sbc temp
        sta dPru

;    int P    = dPr - dX;        // decision variable start value

        lda dPr
        sec
        sbc dX
        sta PP

;    for (; dX>=0; dX--) {       // process each point in the line one at a time



        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

lineLoop1 anop

;        if (x1 & 1)
;            *(SCREEN_ADDR + ((y1 * SCREEN_WIDTH_BYTES) + (x1/2))) |= 0x0f;
;        else
;            *(SCREEN_ADDR + ((y1 * SCREEN_WIDTH_BYTES) + (x1/2))) |= 0xf0;


        lda x1
        lsr a
        clc
        adc offset
        tax

        lda x1
        bit #$0001
        beq leftNibble1

        lda >SCREEN_ADDR,x
        ora currentColorRight
        sta >SCREEN_ADDR,x
        bra jump9

leftNibble1 anop
        lda >SCREEN_ADDR,x
        ora currentColorLeft
        sta >SCREEN_ADDR,x

jump9 anop

;        if (P > 0) {             // is the pixel going right AND up?

        lda PP
        clc
        adc #0
        bmi jump10


;            x1+=Xincr;            // increment independent variable
;            y1+=Yincr;            // increment dependent variable
;            P+=dPru;              // increment decision (for up)


        lda x1
        clc
        adc Xincr
        sta x1

        lda y1
        clc
        adc Yincr
        sta y1

        lda PP
        clc
        adc dPru
        sta PP

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

        bra jump11

jump10 anop

;        } else {                 // is the pixel just going right?
;            x1+=Xincr;            // increment independent variable
;            P+=dPr;               // increment decision (for right)
;        }

        lda x1
        clc
        adc Xincr
        sta x1

        lda PP
        clc
        adc dPr
        sta PP

jump11 anop
        dec dX

        lda dX
        cmp #-1
        bne jump8
        brl lineDone

jump8 anop

        jmp lineLoop1

slope2 anop

;} else {                       // if Y is the independent variable
;    int dPr  = dX<<1;           // amount to increment decision if right is chosen

        lda dX
        asl a
        sta dPr

;    int dPru = dPr - (dY<<1);   // amount to increment decision if up is chosen

        lda dY
        asl a
        sta temp

        lda dPr
        sec
        sbc temp
        sta dPru

;    int P    = dPr - dY;        // decision variable start value

        lda dPr
        sec
        sbc dY
        sta PP

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset
        
;    for (; dY>=0; dY--) {       // process each point in the line one at a time

lineLoop2 anop

;        if (x1 & 1)
;            *(SCREEN_ADDR + ((y1 * SCREEN_WIDTH_BYTES) + (x1/2))) |= 0x0f;
;        else
;            *(SCREEN_ADDR + ((y1 * SCREEN_WIDTH_BYTES) + (x1/2))) |= 0xf0;

        lda x1
        lsr a
        clc
        adc offset
        tax

        lda x1
        bit #$0001
        beq leftNibble2

        lda >SCREEN_ADDR,x
        ora currentColorRight
        sta >SCREEN_ADDR,x
        bra jump29

leftNibble2 anop
        lda >SCREEN_ADDR,x
        ora currentColorLeft
        sta >SCREEN_ADDR,x

jump29 anop


;        if (P > 0) {             // is the pixel going up AND right?

        lda PP
        clc
        adc #0
        bmi jump20

;            x1+=Xincr;            // increment dependent variable
;            y1+=Yincr;            // increment independent variable
;            P+=dPru;              // increment decision (for up)

        lda x1
        clc
        adc Xincr
        sta x1

        lda y1
        clc
        adc Yincr
        sta y1

        lda PP
        clc
        adc dPru
        sta PP

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset
        
        bra jump21

jump20 anop

;        } else {                 // is the pixel just going up?
;            y1+=Yincr;            // increment independent variable
;            P+=dPr;               // increment decision (for right)
;        }


        lda y1
        clc
        adc Yincr
        sta y1

        lda PP
        clc
        adc dPr
        sta PP
        
        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

jump21 anop
        dec dY

        lda dY
        cmp #-1
        bne jump28
        brl lineDone

jump28 anop

        jmp lineLoop2

lineDone anop
        rtl


        end



fastEraselines start
        using globalData


eraseFastLine entry

        lda y1
        cmp y2
        beq horizontalLine

        lda x1
        cmp x2
        beq HL0
        
        jmp lineOther
        
HL0 anop
        jmp verticalLine

horizontalLine anop
        lda x2
        sec
        sbc x1
        bmi HL1
        sta dX
        lda x1
        sta startX
        lda x2
        sta endX
        bra HL2
HL1 anop
        lda x1
        sec
        sbc x2
        sta dX
        lda x2
        sta startX
        lda x1
        sta endX
HL2 anop

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

HLloop anop

        lda startX
        lsr a
        clc
        adc offset
        tax

        lda #0
        sta >SCREEN_ADDR,x
        
HL3 anop
        inc startX
        lda startX
        cmp endX
        beq HLdone
        sta startX
        jmp HLloop
        
HLdone anop

        rtl

verticalLine anop
        lda y2
        sec
        sbc y1
        bmi VL1
        sta dY
        lda y1
        sta startY
        lda y2
        sta endY
        bra VL2
VL1 anop
        lda y1
        sec
        sbc y2
        sta dY
        lda y2
        sta startY
        lda y1
        sta endY
VL2 anop

VLloop anop

        lda startY
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

        lda x1
        lsr a
        clc
        adc offset
        tax

        lda #0
        sta >SCREEN_ADDR,x

        inc startY
        lda startY
        cmp endY
        beq VLdone
        sta startY
        jmp VLloop
        
VLdone anop

        rtl

lineOther anop

;int dX = abs(x2-x1);

        lda x1
        sec
        sbc x2
        bpl dontNegate1
        eor #$ffff
        inc a
dontNegate1 anop
        sta dX

;int dY = abs(y2-y1);

        lda y1
        sec
        sbc y2
        bpl dontNegate2
        eor #$ffff
        inc a
dontNegate2 anop
        sta dY

;if (x1 > x2) { Xincr=-1; } else { Xincr=1; } // which direction in X?

        lda x1
        cmp x2
        bcs x1Greater
        lda #1
        sta Xincr
        jmp x1LessThan
x1Greater anop
        lda #-1
        sta Xincr
x1LessThan anop

;if (y1 > y2) { Yincr=-1; } else { Yincr=1; } // which direction in Y?

        lda y1
        cmp y2
        bcs y1Greater
        lda #1
        sta Yincr
        jmp y1LessThan
y1Greater anop
        lda #-1
        sta Yincr
y1LessThan anop

;if (dX >= dY) {                // if X is the independent variable

        lda dX
        cmp dY
        bcs jump7
        brl slope2
jump7 anop

;    int dPr  = dY<<1;           // amount to increment decision if right is chosen

        lda dY
        asl a
        sta dPr

;    int dPru = dPr - (dX<<1);   // amount to increment decision if up is chosen

        lda dX
        asl a
        sta temp

        lda dPr
        sec
        sbc temp
        sta dPru

;    int P    = dPr - dX;        // decision variable start value

        lda dPr
        sec
        sbc dX
        sta PP

;    for (; dX>=0; dX--) {       // process each point in the line one at a time



        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

lineLoop1 anop

;        if (x1 & 1)
;            *(SCREEN_ADDR + ((y1 * SCREEN_WIDTH_BYTES) + (x1/2))) |= 0x0f;
;        else
;            *(SCREEN_ADDR + ((y1 * SCREEN_WIDTH_BYTES) + (x1/2))) |= 0xf0;


        lda x1
        lsr a
        clc
        adc offset
        tax

        lda #0
        sta >SCREEN_ADDR,x

jump9 anop

;        if (P > 0) {             // is the pixel going right AND up?

        lda PP
        clc
        adc #0
        bmi jump10


;            x1+=Xincr;            // increment independent variable
;            y1+=Yincr;            // increment dependent variable
;            P+=dPru;              // increment decision (for up)


        lda x1
        clc
        adc Xincr
        sta x1

        lda y1
        clc
        adc Yincr
        sta y1

        lda PP
        clc
        adc dPru
        sta PP

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

        bra jump11

jump10 anop

;        } else {                 // is the pixel just going right?
;            x1+=Xincr;            // increment independent variable
;            P+=dPr;               // increment decision (for right)
;        }

        lda x1
        clc
        adc Xincr
        sta x1

        lda PP
        clc
        adc dPr
        sta PP

jump11 anop
        dec dX

        lda dX
        cmp #-1
        bne jump8
        brl lineDone

jump8 anop

        jmp lineLoop1

slope2 anop

;} else {                       // if Y is the independent variable
;    int dPr  = dX<<1;           // amount to increment decision if right is chosen

        lda dX
        asl a
        sta dPr

;    int dPru = dPr - (dY<<1);   // amount to increment decision if up is chosen

        lda dY
        asl a
        sta temp

        lda dPr
        sec
        sbc temp
        sta dPru

;    int P    = dPr - dY;        // decision variable start value

        lda dPr
        sec
        sbc dY
        sta PP

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset
        
;    for (; dY>=0; dY--) {       // process each point in the line one at a time

lineLoop2 anop

;        if (x1 & 1)
;            *(SCREEN_ADDR + ((y1 * SCREEN_WIDTH_BYTES) + (x1/2))) |= 0x0f;
;        else
;            *(SCREEN_ADDR + ((y1 * SCREEN_WIDTH_BYTES) + (x1/2))) |= 0xf0;

        lda x1
        lsr a
        clc
        adc offset
        tax

        lda #0
        sta >SCREEN_ADDR,x


jump29 anop


;        if (P > 0) {             // is the pixel going up AND right?

        lda PP
        clc
        adc #0
        bmi jump20

;            x1+=Xincr;            // increment dependent variable
;            y1+=Yincr;            // increment independent variable
;            P+=dPru;              // increment decision (for up)

        lda x1
        clc
        adc Xincr
        sta x1

        lda y1
        clc
        adc Yincr
        sta y1

        lda PP
        clc
        adc dPru
        sta PP

        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset
        
        bra jump21

jump20 anop

;        } else {                 // is the pixel just going up?
;            y1+=Yincr;            // increment independent variable
;            P+=dPr;               // increment decision (for right)
;        }


        lda y1
        clc
        adc Yincr
        sta y1

        lda PP
        clc
        adc dPr
        sta PP
        
        lda y1
        asl a
        tax
        lda screenRowOffsets,x
        sta offset

jump21 anop
        dec dY

        lda dY
        cmp #-1
        bne jump28
        brl lineDone

jump28 anop

        jmp lineLoop2

lineDone anop
        rtl



        end
