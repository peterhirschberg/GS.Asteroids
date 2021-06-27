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
        using gameData

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
        beq keydownFireShort

        cmp #KEY_ENTER
        beq keydownThrustShort

        cmp #'h'
        beq onKeydownHyperspace
        cmp #'H'
        beq onKeydownHyperspace

        cmp #'p'
        beq onKeydownPause
        cmp #'P'
        beq onKeydownPause

        cmp #'q'
        beq onKeydownQuit
        cmp #'Q'
        beq onKeydownQuit

        cmp #'f'
        beq onKeydownFastMode
        cmp #'F'
        beq onKeydownFastMode

        bra checkKeysDone

keydownThrustShort anop
    brl onKeydownThrust

keydownFireShort anop
        brl onKeydownFire

checkKeysDone anop

        rtl

onKeydownHyperspace anop
        lda #1
        sta keydownHyperspace
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

onKeydownFastMode anop
        lda fastMode
        cmp #0
        beq setFast
        lda #0
        sta fastMode
        lda #1
        sta needToDrawIntroScreen
        jsl eraseDisplayList
        jsl eraseDotList
        jsl eraseSprites
        rtl
setFast anop
        lda #1
        sta fastMode
        lda #1
        sta needToDrawIntroScreen
        jsl eraseDisplayList
        jsl eraseDotList
        jsl eraseSprites
        rtl

checkKeydownLeft anop
        lda >BUTTON2
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
        lda >BUTTON1

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

        jsl isIntroScreen
        cmp #0
        beq notIntroScreen
        bra onIntroScreen

notIntroScreen anop

        jsl isGameOver
        cmp #0
        beq gameNotOver

        jsl startNewGame
        rtl

onIntroScreen anop
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
