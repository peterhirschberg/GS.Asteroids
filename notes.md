# Notes

### Facebook feedback

I took a quick look and you use a lot of AND/CMP #0/BEQ which is one instruction too many. Also, there is no penalty for self-modifying code, so you can store calculated offsets for use with TSB or TRB instead of a LDA/ORA/STA sequence. Try to perform as many operations on a line together as possible to amortize the row offset lookup. Avoid RTL if you can just use RTS. You should try to figure out how to avoid all the branching logic in your line-drawing routines where it draws perfectly vertical or horizontal lines. Probably most of the horizontal lines should update two or even four pixels at a time, without a need for X coordinate comparison, or use fill mode on rows dominated by horizontal lines. Avoid multiple lookups for vertical lines by using an unrolled loop with a single jump or branch based on the vertical height.
Probably the majority of your time is spent in the "other" line code. There should be a separate path for mostly horizontal vs. vertical lines. Apply the same tricks as above to make the inner loop as fast as possible. LDA/CMP #-1/BEQ can be reduced by an instruction if you know the previous value was non-negative.
In general, pay special attention to the flags set by each load/logic/ALU instruction.

--------

Rebecca Heineman
The issue is to capture ADB keyboard events and process them directly. There is a 2-Key rollover on the keyboard which is enough to handle most "joystick" type games. Look at the code to Wolf 3D for the IIgs to see how I did it.

--------


### Asteroids hardware / source code

https://retrocomputing.stackexchange.com/questions/16619/how-was-collision-detection-done-on-the-asteroids-arcade-game
https://www.nicholasmikstas.com/asteroids-program-rom
https://www.computerarcheology.com/Arcade/Asteroids/Code.html
