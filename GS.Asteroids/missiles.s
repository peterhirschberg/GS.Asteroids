;
;  missiles.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

missiles start
        using globalData
        using objectData

        
getAvailablePlayerMissile entry

        lda #OBJECT_PLAYER_MISSILE1
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile2
        txa
        rts

checkMissile2 anop

        lda #OBJECT_PLAYER_MISSILE2
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile3
        txa
        rts

checkMissile3 anop

        lda #OBJECT_PLAYER_MISSILE3
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile4
        txa
        rts

checkMissile4 anop

        lda #OBJECT_PLAYER_MISSILE4
        tax
        lda lifetimeList,x
        cmp #0
        bne noPlayerMissiles
        txa
        rts

noPlayerMissiles anop
        lda #-1
        rts

        
        
getAvailableSaucerMissile entry

        lda #OBJECT_SAUCER_MISSILE1
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile2b
        txa
        rts

checkMissile2b anop

        lda #OBJECT_SAUCER_MISSILE2
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile3b
        txa
        rts

checkMissile3b anop

        lda #OBJECT_SAUCER_MISSILE3
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile4b
        txa
        rts

checkMissile4b anop

        lda #OBJECT_SAUCER_MISSILE4
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile5b
        txa
        rts

checkMissile5b anop
        
        lda #OBJECT_SAUCER_MISSILE5
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile6b
        txa
        rts

checkMissile6b anop
        
        lda #OBJECT_SAUCER_MISSILE6
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile7b
        txa
        rts

checkMissile7b anop
        
        lda #OBJECT_SAUCER_MISSILE7
        tax
        lda lifetimeList,x
        cmp #0
        bne checkMissile8b
        txa
        rts

checkMissile8b anop
        
        lda #OBJECT_SAUCER_MISSILE8
        tax
        lda lifetimeList,x
        cmp #0
        bne noSaucerMissiles
        txa
        rts

noSaucerMissiles anop
        lda #-1
        rts


        
        
        end

