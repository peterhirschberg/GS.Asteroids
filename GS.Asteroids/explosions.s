;
;  explosions.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

explosions start
        using globalData
        using objectData


; finds an available particle and returns it in A
; if no particles are free the A contains -1
getAvailableParticle entry

        lda #OBJECT_PARTICLE1
        tax
        lda lifetimeList,x
        cmp #0
        bne checkParticle2
        txa
        rts

; TODO: turn this into a loop

checkParticle2 anop

        lda #OBJECT_PARTICLE2
        tax
        lda lifetimeList,x
        cmp #0
        bne checkParticle3
        txa
        rts

checkParticle3 anop

        lda #OBJECT_PARTICLE3
        tax
        lda lifetimeList,x
        cmp #0
        bne checkParticle4
        txa
        rts

checkParticle4 anop

        lda #OBJECT_PARTICLE4
        tax
        lda lifetimeList,x
        cmp #0
        bne noParticles
        txa
        rts

noParticles anop
        lda #-1
        rts



startParticle entry

        jsr getAvailableParticle
        cmp #-1
        beq done

        sta particleIndex
        tay

        lda xOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta xPosList,y

        lda yOrigin
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        sta yPosList,y

        sty savey
        lda #200
        pha
        jsl getRandom
        ldy savey
        sec
        sbc #100
        sta xSpeedList,y

        sty savey
        lda #200
        pha
        jsl getRandom
        ldy savey
        sec
        sbc #100
        sta ySpeedList,y

        lda #80
        sta lifetimeList,y

done anop

        rts


; starts an explosion at object index in A
startExplosion entry

        tax

        lda xPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta xOrigin
        lda yPosList,x
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta yOrigin

        stx savex
        jsr startParticle
        ldx savex

        stx savex
        jsr startParticle
        ldx savex

        stx savex
        jsr startParticle
        ldx savex

        stx savex
        jsr startParticle
        ldx savex


        rtl


xOrigin dc i2'0'
yOrigin dc i2'0'

savex dc i2'0'
savey dc i2'0'

particleIndex dc i2'0'

        end

