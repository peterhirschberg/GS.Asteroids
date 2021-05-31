;
;  controls.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

controls start
        using globalData
        using controlsData

checkControls entry

        lda #0
        sta keydownLeft
        sta keydownRight
        sta keydownThrust
        sta keydownFire
        sta keydownHyperspace

        lda >KEYBOARD
        bpl checkKeysDone
        sta >KEYBOARD_STROBE
        and #$007f

        cmp #'z'
        beq onKeydownLeft
        cmp #'Z'
        beq onKeydownLeft

        cmp #'x'
        beq onKeydownRight
        cmp #'X'
        beq onKeydownRight

        cmp #'v'
        beq onKeydownThrust
        cmp #'V'
        beq onKeydownThrust

        cmp #'p'
        beq onKeydownPause
        cmp #'P'
        beq onKeydownPause

checkKeysDone anop

        rtl


onKeydownPause anop
        lda gamePaused
        cmp #0
        beq setPaused
        lda #0
        sta gamePaused
        rtl
setPaused anop
        lda #1
        sta gamePaused
        rtl

onKeydownLeft anop
        lda #1
        sta keydownLeft
        rtl

onKeydownRight anop
        lda #1
        sta keydownRight
        rtl

onKeydownThrust anop
        lda #1
        sta keydownThrust
        rtl


        end

controlsData data

keydownLeft dc i2'0'
keydownRight dc i2'0'
keydownThrust dc i2'0'
keydownFire dc i2'0'
keydownHyperspace dc i2'0'

        end
