;
;  prerendered.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 6/20/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;


        case on

prerendered start
        using globalData
        using objectData
        using prerenderData


prerenderObject entry

; temp
        lda #0

        sta objectIndex

        lda objectIndex
        asl a
        tax
        lda prerenderCountsData,x
        sta pixelCount

        lda #0
        sta counter

loop anop

        lda counter
        asl a
        asl a
        tax

        lda prerenderEvenOddData,x
        sta evenOdd

        lda prerenderPixelData,x
        clc
        adc #$4B64
        tax

        lda evenOdd
        and #1
        cmp #1
        beq odd

; even
        lda >SCREEN_ADDR,x
        ora #$f0
        sta >SCREEN_ADDR,x
        bra next
odd anop
        lda >SCREEN_ADDR,x
        ora #$0f
        sta >SCREEN_ADDR,x

next anop
        inc counter
        lda counter
        cmp pixelCount
        beq prerenderObjectDone
        jmp loop

prerenderObjectDone anop
        rtl


evenOdd dc i4'0'
counter dc i2'0'
pixelCount dc i2'0'
objectIndex dc i2'0'

        end

prerenderData data

prerenderPixelData anop
; large rock 1
        dc i4'2236'
        dc i4'2237'
        dc i4'2237'
        dc i4'2238'
        dc i4'2238'
        dc i4'2239'
        dc i4'2239'
        dc i4'2240'
        dc i4'2240'
        dc i4'2241'
        dc i4'2241'
        dc i4'2242'
        dc i4'2242'
        dc i4'2082'
        dc i4'2083'
        dc i4'1923'
        dc i4'1924'
        dc i4'1764'
        dc i4'1765'
        dc i4'1605'
        dc i4'1606'
        dc i4'1446'
        dc i4'1447'
        dc i4'1287'
        dc i4'1287'
        dc i4'1127'
        dc i4'967'
        dc i4'807'
        dc i4'646'
        dc i4'486'
        dc i4'326'
        dc i4'166'
        dc i4'5'
        dc i4'5'
        dc i4'-154'
        dc i4'-314'
        dc i4'-474'
        dc i4'-634'
        dc i4'-793'
        dc i4'-953'
        dc i4'-1113'
        dc i4'-1113'
        dc i4'-1273'
        dc i4'-1434'
        dc i4'-1594'
        dc i4'-1755'
        dc i4'-1915'
        dc i4'-2076'
        dc i4'-2236'
        dc i4'-2397'
        dc i4'-2397'
        dc i4'-2237'
        dc i4'-2078'
        dc i4'-1918'
        dc i4'-1759'
        dc i4'-1599'
        dc i4'-1440'
        dc i4'-1280'
        dc i4'-1280'
        dc i4'-1441'
        dc i4'-1601'
        dc i4'-1762'
        dc i4'-1922'
        dc i4'-2083'
        dc i4'-2243'
        dc i4'-2404'
        dc i4'-2404'
        dc i4'-2244'
        dc i4'-2085'
        dc i4'-1925'
        dc i4'-1766'
        dc i4'-1766'
        dc i4'-1607'
        dc i4'-1447'
        dc i4'-1288'
        dc i4'-1128'
        dc i4'-1128'
        dc i4'-968'
        dc i4'-808'
        dc i4'-648'
        dc i4'-488'
        dc i4'-328'
        dc i4'-168'
        dc i4'-8'
        dc i4'152'
        dc i4'312'
        dc i4'472'
        dc i4'632'
        dc i4'792'
        dc i4'952'
        dc i4'1112'
        dc i4'1272'
        dc i4'1272'
        dc i4'1432'
        dc i4'1433'
        dc i4'1593'
        dc i4'1754'
        dc i4'1754'
        dc i4'1915'
        dc i4'2075'
        dc i4'2076'
        dc i4'2236'

prerenderEvenOddData anop
; large rock 1
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'1'
        dc i4'1'
        dc i4'0'
        dc i4'0'
        dc i4'1'
        dc i4'1'
        dc i4'0'
        dc i4'0'
        dc i4'1'
        dc i4'1'
        dc i4'0'
        dc i4'0'
        dc i4'1'
        dc i4'1'
        dc i4'0'
        dc i4'0'
        dc i4'1'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'
        dc i4'0'
        dc i4'1'

prerenderCountsData anop
; large rock 1
        dc i2'102'


prerenderOffsetsData anop
; large rock 1
        dc i2'0'


        end
