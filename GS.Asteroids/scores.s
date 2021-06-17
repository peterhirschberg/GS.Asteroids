;
;  scores.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

scores start

addToScore entry
        using scoreData
        using gameData
        

; add to the current score
        sta temp
        lda playerScore
        clc
        adc temp
        sta playerScore
        
; update the score digits
        lda playerScore
        pha
        jsl getScoreDigit10s
        sta scoreDigit10s

        lda playerScore
        pha
        jsl getScoreDigit100s
        sta scoreDigit100s

        lda playerScore
        pha
        jsl getScoreDigit1000s
        sta scoreDigit1000s

        lda playerScore
        pha
        jsl getScoreDigit10000s
        sta scoreDigit10000s

        lda playerScore
        pha
        jsl getScoreDigit100000s
        sta scoreDigit100000s

; check for extra life
        lda scoreDigit1000s
        cmp lastScoreDigit10000s
        bne addExtraLife
        lda scoreDigit1000s
        sta lastScoreDigit10000s
        rts

addExtraLife anop
; add another life
        lda scoreDigit1000s
        sta lastScoreDigit10000s
        inc playerLives

; start extra life sound effect
        lda #5
        sta lifeSoundCounter
        lda #4
        sta lifeSoundTimer

        rts
        

zeroScore entry

        stz playerScore
        stz scoreDigit0
        stz scoreDigit10s
        stz scoreDigit100s
        stz scoreDigit1000s
        stz scoreDigit10000s
        stz scoreDigit100000s

        stz lastScoreDigit10000s

        rtl


runSounds entry

        lda lifeSoundCounter
        cmp #0
        beq runSoundDone

        dec lifeSoundTimer
        lda lifeSoundTimer
        cmp #0
        beq nextBeep
        bra runSoundDone

nextBeep anop
        dec lifeSoundCounter
        lda #4
        sta lifeSoundTimer

        jsl doLifeSound

runSoundDone anop
        rtl



lifeSoundCounter dc i2'0'
lifeSoundTimer dc i2'0'
temp dc i2'0'

        end


scoreData data
    
playerScore dc i2'0'

scoreDigit0 dc i2'0'
scoreDigit10s dc i2'0'
scoreDigit100s dc i2'0'
scoreDigit1000s dc i2'0'
scoreDigit10000s dc i2'0'
scoreDigit100000s dc i2'0'

lastScoreDigit10000s dc i2'0'

        end
