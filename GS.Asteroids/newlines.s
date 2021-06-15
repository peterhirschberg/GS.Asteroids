;----------------------------------------
; Arc3D line-drawing code
; By Andy McFadden
; Adapted from code by the FTA.
;
; Draws from (clpx0,clpy0) to (clpx1,clpy1) (output of a clipping routine).
;----------------------------------------

    case on

asmDrawLine	start

x0	equ	1
y0	equ	3
x1	equ	5
y1	equ	7
offset	equ	9
deltax	equ	11
deltay	equ	13
diff	equ	15
even_c	equ	17
odd_c	equ	19


newLine entry

;	jsubroutine (4:surface,2:penColor,2:clpx0,2:clpy0,2:clpx1,2:clpy1),20

;			Say surface = $012000...

	lda	surface	; Should be $2000
	sta	__e0	; set "even" addresses
	sta	__e1
	sta	__e2
	sta	__e3
	sta	__e4
	sta	__e5
	sta	__e6
	sta	__e7
	sta	__e8
	sta	__e9
	sta	__e10
	sta	__e11
	sta	__e12
	sta	__e13

	dea		; Should be $1fff
	sta	__o0	; set "odd" addresses
	sta	__o1
	sta	__o2
	sta	__o3
	sta	__o4
	sta	__o5
	sta	__o6
	sta	__o7
	sta	__o8
	sta	__o9
	sta	__o10
	sta	__o11
	sta	__o12
	sta	__o13

	phb		; keep original bank
	lda	surface+1	; Should be $0120
	pha		; switch to bank we're pointing into
	plb		; B is now $20 - bad!
	plb		; B is now $01 - good!

DoDrawLine	anop
	lda	<clpy1	; 4 is y1 < y0?
	cmp	<clpy0	; 4
	blt	in_order	; 2/3 yes, so leave alone

;	lda	<clpy1	; we want y0 to be the largest,
	sta	y0	; so switch
	lda	<clpx1
	sta	x0
	lda	<clpy0
	sta	y1
	lda	<clpx0
	sta	x1
	bra	copy_done

in_order	anop
;	lda	<clpy1
	sta	y1
	lda	<clpx1
	sta	x1
	lda	<clpy0
	sta	y0
	lda	<clpx0
	sta	x0
; 39/41 cycles to here

; setup offset and deltas
copy_done	anop
	lda	y1
	asl	A
	asl	A
	adc	y1
	asl	A
	asl	A
	asl	A
	asl	A
	asl	A
	asl	A
	adc	x1
	sta	offset	; 16+16=32

; penColor must be between 0 and 15
	lda	<penColor	; setup pixel images
	sta	even_c	; 0x000f
	xba
	asl	A
	asl	A
	asl	A
	asl	A
	and	#$f000
	sta	odd_c	; 0xf000

	lda	y0
	sec
	sbc	y1
	sta	deltay	; we know y0 is larger...
	beq	Horizontal	; +2 do as special case

	lda	x1
	cmp	x0
	beq	Vertical	; +2 do as special case
;	bcc	Rev	; x1 is smaller; go other way
	bcs	Forw
	brl	Rev
Forw	sbc	x0
	sta	deltax

	cmp	deltay
	bcc	Forw_bigy_j
	brl	Forw_bigx
Forw_bigy_j	anop
	brl	Forw_bigy

;
; Handle special cases (horizontal/vertical/point)
;

; handle vertical (deltax=0) lines
Vertical	lda	deltay
	tay		; count down

	lda	offset
	lsr	A
	tax
	bcc	vf_odd2
	clc
;	bra	vf_even2

; loop below
vf_even2	lda	$dead,x
__e0	equ	*-2
	and	#$fff0
	ora	even_c
	sta	$dead,x
__e1	equ	*-2

	txa
	adc	#160
	tax
	dey
	bpl	vf_even2
	bra	vf_done

vf_odd2	lda	$beef,x
__o0	equ	*-2
	and	#$0fff
	ora	odd_c
	sta	$beef,x
__o1	equ	*-2

	txa
	adc	#160
	tax
	dey
	bpl	vf_odd2
;	bra	vf_done

vf_done	brl	Exit

; handle horizontal (deltay=0) lines
Horizontal	anop
	lda	x1
	cmp	x0
	bcc	h_rev	; x1 is smaller; go other way
	sbc	x0
	sta	deltax

; horizontal, moving forward
h_forw	lda	deltax
	tay		; count down

	lda	offset
	lsr	A
	tax
	bcc	hf_odd2
	clc
;	bra	hf_even2

; loop below
hf_even2	lda	$dead,x
__e2	equ	*-2
	and	#$fff0
	ora	even_c
	sta	$dead,x
__e3	equ	*-2

	dey
	bmi	hf_done

hf_odd2	lda	$beef,x
__o2	equ	*-2
	and	#$0fff
	ora	odd_c
	sta	$beef,x
__o3	equ	*-2

	dex
	dey
	bpl	hf_even2

hf_done	brl	Exit

; horizontal, reverse direction
h_rev	sec
	lda	x0
	sbc	x1
	sta	deltax

	lda	deltax
	tay		; count down

	lda	offset
	lsr	A
	tax
	bcc	hr_odd2
	clc
;	bra	hr_even2

; loop below
hr_even2	lda	$dead,x
__e4	equ	*-2
	and	#$fff0
	ora	even_c
	sta	$dead,x
__e5	equ	*-2

	dey
	bmi	hr_done
	inx

hr_odd2	lda	$beef,x
__o4	equ	*-2
	and	#$0fff
	ora	odd_c
	sta	$beef,x
__o5	equ	*-2

	dey
	bpl	hr_even2
;	bra	hr_done

hr_done	brl	Exit


;
; Standard cases
;

; forward direction, deltay is bigger than deltax
Forw_bigy	anop
	lda	deltay
	tay		; count down
	lsr	A
	eor	#$ffff
	inc	A
	sta	diff

	lda	offset
	lsr	A
	tax
	bcc	fy_odd2
	clc
	bra	fy_even2

; loop below
fy_even1	sta	diff
fy_even2	lda	$dead,x
__e6	equ	*-2
	and	#$fff0
	ora	even_c
	sta	$dead,x
__e7	equ	*-2

	dey
	bmi	fy_done
	txa
	adc	#160
	tax
	lda	deltax
	adc	diff
	bmi	fy_even1
	sbc	deltay
fy_odd1	sta	diff
fy_odd2	lda	$beef,x
__o6	equ	*-2
	and	#$0fff
	ora	odd_c
	sta	$beef,x
__o7	equ	*-2

	dey
	bmi	fy_done
	txa
	adc	#160
	tax
	lda	deltax
	adc	diff
	bmi	fy_odd1
	sbc	deltay
	dex
	bra	fy_even1

fy_done	brl	Exit

; reverse direction
Rev	sec
	lda	x0
	sbc	x1
	sta	deltax
	cmp	deltay
	bcs	Rev_bigx

; reverse direction, deltay is bigger than deltax
Rev_bigy	lda	deltay
	tay		; count down
	inc	A
	lsr	A
	eor	#$ffff
	inc	A
	sta	diff

	lda	offset
	lsr	A
	tax
	bcc	ry_odd2
	clc
	bra	ry_even2

; loop below
ry_even1	sta	diff
ry_even2	lda	$dead,x
__e8	equ	*-2
	and	#$fff0
	ora	even_c
	sta	$dead,x
__e9	equ	*-2

	dey
	bmi	ry_done
	txa
	adc	#160
	tax
	lda	deltax
	adc	diff
	bmi	ry_even1
	sbc	deltay
	inx
ry_odd1	sta	diff
ry_odd2	lda	$beef,x
__o8	equ	*-2
	and	#$0fff
	ora	odd_c
	sta	$beef,x
__o9	equ	*-2

	dey
	bmi	ry_done
	txa
	adc	#160
	tax
	lda	deltax
	adc	diff
	bmi	ry_odd1
	sbc	deltay
	bra	ry_even1

ry_done	brl	Exit

; reverse direction, deltax is bigger than deltay
Rev_bigx	lda	deltax
	tay		; count down
	lsr	A
	eor	#$ffff
	inc	A
	sta	diff

	lda	offset
	lsr	A
	tax
	bcc	rx_odd2
	clc
	bra	rx_even2

; loop below
rx_even1	sta	diff
rx_even2	lda	$dead,x
__e10	equ	*-2
	and	#$fff0
	ora	even_c
	sta	$dead,x
__e11	equ	*-2

	dey
	bmi	rx_done
	inx
	lda	deltay
	adc	diff
	bmi	rx_odd1
	sbc	deltax
	sta	diff

	txa
	adc	#160
	tax
	bra	rx_odd2

rx_odd1	sta	diff
rx_odd2	lda	$beef,x
__o10	equ	*-2
	and	#$0fff
	ora	odd_c
	sta	$beef,x
__o11	equ	*-2

	dey
	bmi	rx_done
	lda	deltay
	adc	diff
	bmi	rx_even1
	sbc	deltax
	sta	diff
	txa
	adc	#160
	tax
	bra	rx_even2

rx_done	brl	Exit

; forward direction, deltax is bigger than deltay
Forw_bigx	anop
	lda	deltax
	tay		; count down
	lsr	A
	eor	#$ffff
	inc	A
	sta	diff

	lda	offset
	lsr	A
	tax
	bcc	fx_odd2
	clc
	bra	fx_even2

; loop below
fx_even1	sta	diff
fx_even2	lda	$dead,x
__e12	equ	*-2
	and	#$fff0
	ora	even_c
	sta	$dead,x
__e13	equ	*-2

	dey
	bmi	fx_done
	lda	deltay
	adc	diff
	bmi	fx_odd1
	sbc	deltax
	sta	diff

	txa
	adc	#160
	tax
	bra	fx_odd2

fx_odd1	sta	diff
fx_odd2	lda	$beef,x
__o12	equ	*-2
	and	#$0fff
	ora	odd_c
	sta	$beef,x
__o13	equ	*-2

	dey
	bmi	fx_done
	dex
	lda	deltay
	adc	diff
	bmi	fx_even1
	sbc	deltax
	sta	diff
	txa
	adc	#160
	tax
	bra	fx_even2

fx_done	brl	Exit

;
; common exit point
;
Exit	plb		; return to original bank

    rtl

; testing data
surface dc i4'$012000'
penColor dc i2'$0f'
clpx0 dc i2'1'
clpy0 dc i2'1'
clpx1 dc i2'100'
clpy1 dc i2'100'

	end
