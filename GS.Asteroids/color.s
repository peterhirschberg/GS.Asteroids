;
;  color.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

color start
        using globalData

initColorTable entry

        ldx #0
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #2
        lda #$0011
        sta >COLOR_TABLE,x

        ldx #4
        lda #$0022
        sta >COLOR_TABLE,x

        ldx #6
        lda #$0023
        sta >COLOR_TABLE,x

        ldx #8
        lda #$0034
        sta >COLOR_TABLE,x

        ldx #10
        lda #$0045
        sta >COLOR_TABLE,x

        ldx #12
        lda #$0056
        sta >COLOR_TABLE,x

        ldx #14
        lda #$0067
        sta >COLOR_TABLE,x

        ldx #16
        lda #$0078
        sta >COLOR_TABLE,x

        ldx #18
        lda #$0089
        sta >COLOR_TABLE,x

        ldx #20
        lda #$009a
        sta >COLOR_TABLE,x

        ldx #22
        lda #$00ab
        sta >COLOR_TABLE,x

        ldx #24
        lda #$00bc
        sta >COLOR_TABLE,x

        ldx #26
        lda #$00cd
        sta >COLOR_TABLE,x

        ldx #28
        lda #$00de
        sta >COLOR_TABLE,x

        ldx #30
        lda #$00ef
        sta >COLOR_TABLE,x

        
        end
