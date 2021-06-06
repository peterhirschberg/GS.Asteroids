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


fadeWreckage entry

        lda #0
        sta wreckageCounter

        lda #OBJECT_WRECKAGE1
        tax

fadeLoop1 anop

        lda lifetimeList,x
        cmp #0
        beq nextFade1

        lda #15
        cmp lifetimeList,x
        bcs decrement1
        bra nextFade1

decrement1 anop
        lda lifetimeList,x
        asl a
        asl a
        asl a
        asl a
        ora lifetimeList,x
        sta colorList,x

nextFade1 anop

        inx
        inx
        inc wreckageCounter
        lda wreckageCounter
        cmp #NUM_WRECKAGE
        bne fadeLoop1

        rtl

        
        
fadeParticles entry

        lda #0
        sta particleCounter

        lda #OBJECT_PARTICLE1
        tax

fadeLoop anop

        lda lifetimeList,x
        cmp #0
        beq nextFade

        lda #$a
        cmp lifetimeList,x
        bcs decrement
        bra nextFade

decrement anop
        lda lifetimeList,x
        asl a
        asl a
        asl a
        asl a
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

        lda #$aa
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


getWreckage entry

        lda wreckageIndex
        sta index

        inc wreckageIndex
        lda wreckageIndex
        cmp #NUM_WRECKAGE
        bne skipReset2

        lda #0
        sta wreckageIndex
        sta index

skipReset2 anop
        lda index
        asl a
        sta index

        lda #OBJECT_WRECKAGE1
        clc
        adc index

        rts


startWreckage entry

        jsr getWreckage
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
        lda #100
        pha
        jsl getRandom
        ldy savey
        sec
        sbc #50
        sta xSpeedList,y

        sty savey
        lda #100
        pha
        jsl getRandom
        ldy savey
        sec
        sbc #50
        sta ySpeedList,y

        sty savey
        lda #WRECKAGE_LIFETIME
        pha
        jsl getRandom
        ldy savey
        sta lifetimeList,y

        sty savey
        lda #360
        pha
        jsl getRandom
        ldy savey
        sta angleList,y

        sty savey
        lda #16
        pha
        jsl getRandom
        ldy savey
        sec
        sbc #8
        sta rotationSpeedList,y

        lda #$ff
        sta colorList,y

done2 anop

        rts


; starts wreckage at object index in A
startWreckageExplosion entry

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

        lda #8
        sta wreckageCounter
wreckageStartLoop anop
        jsr startWreckage
        dec wreckageCounter
        lda wreckageCounter
        cmp #0
        beq doneWreckage
        bra wreckageStartLoop

doneWreckage anop

        rtl


xOrigin dc i2'0'
yOrigin dc i2'0'

savex dc i2'0'
savey dc i2'0'

index dc i2'0'
particleIndex dc i2'0'
particleCounter dc i2'0'
wreckageIndex dc i2'0'
wreckageCounter dc i2'0'
color dc i2'0'

PARTICLE_LIFETIME gequ 100
WRECKAGE_LIFETIME gequ 200

        end

