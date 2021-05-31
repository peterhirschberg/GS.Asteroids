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

        end

