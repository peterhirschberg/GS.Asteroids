;
;  fastline.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global

fastLine start
        using globalData
        using lineData

        
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

        pixelRight
        rtl

leftNibble5 anop
        pixelLeft
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
        inc endX
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
        inc endX
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

        pixelRight
        bra HL3

leftNibble3 anop
        pixelLeft

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

        inc endY

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

        pixelLeft

        inc startY
        lda startY
        cmp endY
        bcs VLdone
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

        pixelRight

        inc startY
        lda startY
        cmp endY
        bcs VLdone
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

        pixelRight
        bra jump9

leftNibble1 anop
        pixelLeft

jump9 anop

;        if (P > 0) {             // is the pixel going right AND up?

        lda PP
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

        pixelRight
        bra jump29

leftNibble2 anop
        pixelLeft

jump29 anop


;        if (P > 0) {             // is the pixel going up AND right?

        lda PP
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


tempColor dc i2'0'

        end



fastEraselines start
        using globalData
        using lineData


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
        inc endX
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
        inc endX
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

        inc endY

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
        bcs VLdone
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


lineData data
        
; table of precomputed screen row offsets

screenRowOffsets    dc i2'$0000'
                    dc i2'$00a0'
                    dc i2'$0140'
                    dc i2'$01e0'
                    dc i2'$0280'
                    dc i2'$0320'
                    dc i2'$03c0'
                    dc i2'$0460'
                    dc i2'$0500'
                    dc i2'$05a0'
                    dc i2'$0640'
                    dc i2'$06e0'
                    dc i2'$0780'
                    dc i2'$0820'
                    dc i2'$08c0'
                    dc i2'$0960'
                    dc i2'$0a00'
                    dc i2'$0aa0'
                    dc i2'$0b40'
                    dc i2'$0be0'
                    dc i2'$0c80'
                    dc i2'$0d20'
                    dc i2'$0dc0'
                    dc i2'$0e60'
                    dc i2'$0f00'
                    dc i2'$0fa0'
                    dc i2'$1040'
                    dc i2'$10e0'
                    dc i2'$1180'
                    dc i2'$1220'
                    dc i2'$12c0'
                    dc i2'$1360'
                    dc i2'$1400'
                    dc i2'$14a0'
                    dc i2'$1540'
                    dc i2'$15e0'
                    dc i2'$1680'
                    dc i2'$1720'
                    dc i2'$17c0'
                    dc i2'$1860'
                    dc i2'$1900'
                    dc i2'$19a0'
                    dc i2'$1a40'
                    dc i2'$1ae0'
                    dc i2'$1b80'
                    dc i2'$1c20'
                    dc i2'$1cc0'
                    dc i2'$1d60'
                    dc i2'$1e00'
                    dc i2'$1ea0'
                    dc i2'$1f40'
                    dc i2'$1fe0'
                    dc i2'$2080'
                    dc i2'$2120'
                    dc i2'$21c0'
                    dc i2'$2260'
                    dc i2'$2300'
                    dc i2'$23a0'
                    dc i2'$2440'
                    dc i2'$24e0'
                    dc i2'$2580'
                    dc i2'$2620'
                    dc i2'$26c0'
                    dc i2'$2760'
                    dc i2'$2800'
                    dc i2'$28a0'
                    dc i2'$2940'
                    dc i2'$29e0'
                    dc i2'$2a80'
                    dc i2'$2b20'
                    dc i2'$2bc0'
                    dc i2'$2c60'
                    dc i2'$2d00'
                    dc i2'$2da0'
                    dc i2'$2e40'
                    dc i2'$2ee0'
                    dc i2'$2f80'
                    dc i2'$3020'
                    dc i2'$30c0'
                    dc i2'$3160'
                    dc i2'$3200'
                    dc i2'$32a0'
                    dc i2'$3340'
                    dc i2'$33e0'
                    dc i2'$3480'
                    dc i2'$3520'
                    dc i2'$35c0'
                    dc i2'$3660'
                    dc i2'$3700'
                    dc i2'$37a0'
                    dc i2'$3840'
                    dc i2'$38e0'
                    dc i2'$3980'
                    dc i2'$3a20'
                    dc i2'$3ac0'
                    dc i2'$3b60'
                    dc i2'$3c00'
                    dc i2'$3ca0'
                    dc i2'$3d40'
                    dc i2'$3de0'
                    dc i2'$3e80'
                    dc i2'$3f20'
                    dc i2'$3fc0'
                    dc i2'$4060'
                    dc i2'$4100'
                    dc i2'$41a0'
                    dc i2'$4240'
                    dc i2'$42e0'
                    dc i2'$4380'
                    dc i2'$4420'
                    dc i2'$44c0'
                    dc i2'$4560'
                    dc i2'$4600'
                    dc i2'$46a0'
                    dc i2'$4740'
                    dc i2'$47e0'
                    dc i2'$4880'
                    dc i2'$4920'
                    dc i2'$49c0'
                    dc i2'$4a60'
                    dc i2'$4b00'
                    dc i2'$4ba0'
                    dc i2'$4c40'
                    dc i2'$4ce0'
                    dc i2'$4d80'
                    dc i2'$4e20'
                    dc i2'$4ec0'
                    dc i2'$4f60'
                    dc i2'$5000'
                    dc i2'$50a0'
                    dc i2'$5140'
                    dc i2'$51e0'
                    dc i2'$5280'
                    dc i2'$5320'
                    dc i2'$53c0'
                    dc i2'$5460'
                    dc i2'$5500'
                    dc i2'$55a0'
                    dc i2'$5640'
                    dc i2'$56e0'
                    dc i2'$5780'
                    dc i2'$5820'
                    dc i2'$58c0'
                    dc i2'$5960'
                    dc i2'$5a00'
                    dc i2'$5aa0'
                    dc i2'$5b40'
                    dc i2'$5be0'
                    dc i2'$5c80'
                    dc i2'$5d20'
                    dc i2'$5dc0'
                    dc i2'$5e60'
                    dc i2'$5f00'
                    dc i2'$5fa0'
                    dc i2'$6040'
                    dc i2'$60e0'
                    dc i2'$6180'
                    dc i2'$6220'
                    dc i2'$62c0'
                    dc i2'$6360'
                    dc i2'$6400'
                    dc i2'$64a0'
                    dc i2'$6540'
                    dc i2'$65e0'
                    dc i2'$6680'
                    dc i2'$6720'
                    dc i2'$67c0'
                    dc i2'$6860'
                    dc i2'$6900'
                    dc i2'$69a0'
                    dc i2'$6a40'
                    dc i2'$6ae0'
                    dc i2'$6b80'
                    dc i2'$6c20'
                    dc i2'$6cc0'
                    dc i2'$6d60'
                    dc i2'$6e00'
                    dc i2'$6ea0'
                    dc i2'$6f40'
                    dc i2'$6fe0'
                    dc i2'$7080'
                    dc i2'$7120'
                    dc i2'$71c0'
                    dc i2'$7260'
                    dc i2'$7300'
                    dc i2'$73a0'
                    dc i2'$7440'
                    dc i2'$74e0'
                    dc i2'$7580'
                    dc i2'$7620'
                    dc i2'$76c0'
                    dc i2'$7760'
                    dc i2'$7800'
                    dc i2'$78a0'
                    dc i2'$7940'
                    dc i2'$79e0'
                    dc i2'$7a80'
                    dc i2'$7b20'
                    dc i2'$7bc0'
                    dc i2'$7c60'

        end
