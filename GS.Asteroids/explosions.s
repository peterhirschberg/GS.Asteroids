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


fadeParticles entry

        lda #0
        sta particleCounter

        lda #OBJECT_PARTICLE1
        tax

fadeLoop anop

        lda lifetimeList,x
        cmp #0
        beq nextFade

        lda #15
        cmp lifetimeList,x
        bcs decrement
        bra nextFade

decrement anop
        lda lifetimeList,x
        asl a
        asl a
        asl a
        asl a
        sta color
        ora lifetimeList,x
        sta colorList,x

nextFade anop

        inx
        inx
        inc particleCounter
        lda particleCounter
        cmp #NUM_PARTICLES
        bne fadeLoop

        rtl

getParticle entry

        lda particleIndex
        sta index

        inc particleIndex
        lda particleIndex
        cmp #NUM_PARTICLES
        bne skipReset

        lda #0
        sta particleIndex
        sta index

skipReset anop
        lda index
        asl a
        sta index

        lda #OBJECT_PARTICLE1
        clc
        adc index

        rts


startParticle entry

        jsr getParticle
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

        sty savey
        lda #PARTICLE_LIFETIME
        pha
        jsl getRandom
        ldy savey
        sta lifetimeList,y

        lda #$33
        sta colorList,y

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

        lda #16
        sta particleCounter
explosionParticleLoop anop
        jsr startParticle
        dec particleCounter
        lda particleCounter
        cmp #0
        beq doneExplosion
        bra explosionParticleLoop

doneExplosion anop

        rtl


xOrigin dc i2'0'
yOrigin dc i2'0'

savex dc i2'0'
savey dc i2'0'

index dc i2'0'
particleIndex dc i2'0'
particleCounter dc i2'0'
color dc i2'0'

PARTICLE_LIFETIME gequ 100

        end

