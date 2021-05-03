.text
.align 4
.global main
main:
@ keep stack 8-byte aligned
	push {ip, lr}

@ prompt for input 
   	ldr r0, =message
    	bl printf

@ promt for x 
	ldr r0, =xvalue
	bl printf

@ position input, x, store in r1
 	ldr r0, =fmtInt
 	ldr r1, =num
  	bl scanf

@prompt for y 
	ldr r0, =yvalue
	bl printf

@position input, y, store in r2
	ldr r0, =fmtInt
	ldr r2, =num
	bl scanf

@ loads x value
	ldr r1, =num

@debug info, prints out value
	ldr r0, =hittxt
	mov r1, r4
	bl printf

@ clean up
gameend: 
	ldr r0, =end
	bl printf
	mov r0, #0
	mov r1, #0 
	mov r2, #0
	pop {ip, pc}

@ vars and stuff
.data
.balign 4 
a:	   .skip   31
message:   .asciz  "\n\tThere is a battle ship on a 10x10 board (0-9), enter a position and see if you hit: "
xvalue:    .asciz  "\n\t\tX value: "
yvalue:	   .asciz  "\n\t\tY value: "
end:	   .asciz  "\n\tYou sunk my battle ship, the end"
fmtInt:    .string "%d"
hittxt:    .asciz  "hit\n\t"
misstxt:   .asciz  "miss\n\t"
num:       .word   1
