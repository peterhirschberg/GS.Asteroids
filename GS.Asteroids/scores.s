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

        rts
        

        
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


        end
