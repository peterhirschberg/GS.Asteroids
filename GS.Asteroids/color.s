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
        lda #$0111
        sta >COLOR_TABLE,x

        ldx #4
        lda #$0222
        sta >COLOR_TABLE,x

        ldx #6
        lda #$0333
        sta >COLOR_TABLE,x

        ldx #8
        lda #$0444
        sta >COLOR_TABLE,x

        ldx #10
        lda #$0555
        sta >COLOR_TABLE,x

        ldx #12
        lda #$0666
        sta >COLOR_TABLE,x

        ldx #14
        lda #$0777
        sta >COLOR_TABLE,x

        ldx #16
        lda #$0888
        sta >COLOR_TABLE,x

        ldx #18
        lda #$0999
        sta >COLOR_TABLE,x

        ldx #20
        lda #$0aaa
        sta >COLOR_TABLE,x

        ldx #22
        lda #$0bbb
        sta >COLOR_TABLE,x

        ldx #24
        lda #$0ccc
        sta >COLOR_TABLE,x

        ldx #26
        lda #$0ddd
        sta >COLOR_TABLE,x

        ldx #28
        lda #$0eee
        sta >COLOR_TABLE,x

        ldx #30
        lda #$0fff
        sta >COLOR_TABLE,x

        
        end
