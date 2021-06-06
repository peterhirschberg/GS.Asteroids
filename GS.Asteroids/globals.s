;
;  globals.s
;  GS.Asteroids
;
;  Created by Peter Hirschberg on 5/14/21.
;  Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

globals start
        end

globalData data

KEYBOARD                gequ $e0c000
KEYBOARD_STROBE         gequ $e0c010
VERTICAL_COUNTER        gequ $e0c02e
SHADOW_REGISTER         gequ $e0c035
NEW_VIDEO_REGISTER      gequ $e0c029
BORDER_COLOUR_REGISTER  gequ $e0c034
STATE_REGISTER          gequ $e1c068
SCREEN_ADDR             gequ $012000
COLOR_TABLE             gequ $e19e00

gamePaused dc i2'0'

borderColour    dc i2'0'
backupStack     dc i2'0'

currentColorLeft     dc i2'$00f0'
currentColorRight    dc i2'$000f'

; abstract vars for passing values to subroutines

param1          dc i2'0'
param2          dc i2'0'
param3          dc i2'0'
param4          dc i2'0'

result1         dc i2'0'
result2         dc i2'0'

; Line drawing vars (TODO: move to lines.s)

counter         dc i2'0'
xpos            dc i2'0'
ypos            dc i2'0'
offset          dc i4'0'

x1              dc i2'0'
x2              dc i2'0'
y1              dc i2'0'
y2              dc i2'0'

dX              dc i2'0'
dY              dc i2'0'

Xincr           dc i2'0'
Yincr           dc i2'0'

dPr             dc i2'0'
dPru            dc i2'0'
PP              dc i2'0'

temp            dc i2'0'
temp1            dc i2'0'
temp2            dc i2'0'

drawX           dc i2'0'
drawY           dc i2'0'

drawDrawX        dc i2'0'
drawDrawY        dc i2'0'

yCounter       dc i2'0'

startX         dc i2'0'
endX           dc i2'0'

startY         dc i2'0'
endY           dc i2'0'


; math.s vars

relation        dc i2'0'

DIVSOR          dc i2'-$ff'
DIVDND          dc i2'0'
QUOTNT gequ $80


; screen bound constants
; these are in shifted << 6 format to match object speed/position logic

SCREEN_XMAX                     gequ $4fc0
SCREEN_YMAX                     gequ $31c0

MIDSCREEN_X                     gequ SCREEN_XMAX/2
MIDSCREEN_Y                     gequ SCREEN_YMAX/2

; missile constants (both player and saucers)
MISSILE_SPEED                   gequ 80
MISSILE_LIFETIME                gequ 40

; game state
activeRockCount dc i2'0'
activeLargeRockCount dc i2'0'
activeSmallMediumRockCount dc i2'0'




        end
