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
        lda #$0033
        sta >COLOR_TABLE,x

        ldx #8
        lda #$0044
        sta >COLOR_TABLE,x

        ldx #10
        lda #$0055
        sta >COLOR_TABLE,x

        ldx #12
        lda #$0066
        sta >COLOR_TABLE,x

        ldx #14
        lda #$0077
        sta >COLOR_TABLE,x

        ldx #16
        lda #$0088
        sta >COLOR_TABLE,x

        ldx #18
        lda #$0099
        sta >COLOR_TABLE,x

        ldx #20
        lda #$00aa
        sta >COLOR_TABLE,x

        ldx #22
        lda #$00bb
        sta >COLOR_TABLE,x

        ldx #24
        lda #$00cc
        sta >COLOR_TABLE,x

        ldx #26
        lda #$00dd
        sta >COLOR_TABLE,x

        ldx #28
        lda #$00ee
        sta >COLOR_TABLE,x

        ldx #30
        lda #$00ff
        sta >COLOR_TABLE,x

        
        end
