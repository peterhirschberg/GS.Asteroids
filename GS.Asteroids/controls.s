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

        jsr checkKeydownLeft
        jsr checkKeydownRight

        lda #0
        sta keydownHyperspace
        sta keydownFire
        sta keydownThrust

        lda >KEYBOARD
        bpl checkKeysDone
        sta >KEYBOARD_STROBE
        and #$007f

        cmp #KEY_SPACE
        beq onKeydownFire

        cmp #KEY_ENTER
        beq onKeydownThrust

        cmp #'p'
        beq onKeydownPause
        cmp #'P'
        beq onKeydownPause

        cmp #'q'
        beq onKeydownQuit
        cmp #'Q'
        beq onKeydownQuit

checkKeysDone anop

        rtl


onKeydownQuit anop
        jsl signalQuit
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

checkKeydownLeft anop
        lda >BUTTON1
        and #$80
        cmp #0
        beq notPressedLeft

        lda #1
        sta keydownLeft
        rts
notPressedLeft anop
        lda #0
        sta keydownLeft
        rts

checkKeydownRight anop
        lda >BUTTON2
        and #$80
        cmp #0
        beq notPressedRight

        lda #1
        sta keydownRight
        rts
notPressedRight anop
        lda #0
        sta keydownRight
        rts

onKeydownThrust anop
        lda #1
        sta keydownThrust
        rtl

onKeydownFire anop

        jsl isGameOver
        cmp #0
        beq gameNotOver
        jsl startNewGame
        rtl

gameNotOver anop

        lda #1
        sta keydownFire
        rtl

        end

controlsData data

keydownLeft dc i2'0'
keydownRight dc i2'0'
keydownFire dc i2'0'
keydownThrust dc i2'0'
keydownHyperspace dc i2'0'

BUTTON1 gequ $c061
BUTTON2 gequ $c062

KEY_SPACE gequ $20
KEY_ENTER gequ $0d

        end
