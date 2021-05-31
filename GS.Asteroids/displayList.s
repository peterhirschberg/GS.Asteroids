;
;  displayList.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

    case on

displayList start
    using globalData
    
renderDisplayList entry

    lda #0
    sta counter
    sta colorIndex

loop anop

    lda counter
    clc
    cmp displayListLength
    beq done
    
    ldx counter
    
    ldy colorIndex
    lda displayListColors,y
    and #$00f0
    sta currentColorLeft
    lda displayListColors,y
    and #$000f
    sta currentColorRight
    iny
    iny
    sty colorIndex

    lda displayListList,x
    sta x1
    inx
    inx
    
    lda displayListList,x
    sta y1
    inx
    inx

    lda displayListList,x
    sta x2
    inx
    inx

    lda displayListList,x
    sta y2
    inx
    inx
    
    stx counter
    
    jsl drawLine
    
    jmp loop
    
done anop

    rtl
    
eraseDisplayList entry

    longa on
    longi on

    lda #0
    sta counter
    
loop2 anop

    lda counter
    clc
    cmp displayListLength
    beq done2
    
    ldx counter
    
    lda displayListList,x
    sta x1
    inx
    inx
    
    lda displayListList,x
    sta y1
    inx
    inx

    lda displayListList,x
    sta x2
    inx
    inx

    lda displayListList,x
    sta y2
    inx
    inx
    
    stx counter
    
    jsl eraseLine
    
    jmp loop2
    
done2 anop

    rtl
    
    
renderDotList entry

    lda #0
    sta counter

loop4 anop

    lda counter
    clc
    cmp dotListLength
    beq done4
    
    ldx counter

    ldy colorIndex
    lda displayListColors,y
    and #$00f0
    sta currentColorLeft
    lda displayListColors,y
    and #$000f
    sta currentColorRight
    iny
    iny
    sty colorIndex
    
    lda dotListList,x
    sta x1
    inx
    inx
    
    lda dotListList,x
    sta y1
    inx
    inx

    stx counter
    
    jsl drawDot

    jmp loop4
    
done4 anop

    rtl
    
eraseDotList entry

    lda #0
    sta counter

loop5 anop

    lda counter
    clc
    cmp dotListLength
    beq done5
    
    ldx counter
    
    lda dotListList,x
    sta x1
    inx
    inx
    
    lda dotListList,x
    sta y1
    inx
    inx

    stx counter
    
    jsl eraseDot
    
    jmp loop5
    
done5 anop

    rtl
    
    
counter dc i2'0'
colorIndex dc i2'0'

    end
