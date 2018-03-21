 ; makena kong
 ; CPE 225-03

 ; assignment 3 - pig latin
 ; DESCRIPTION: this program prompts the user for a 19 character long word and prints out the pig latin translation
 
 ; Registers used
 ; r0: stores things
 ; r1: memory pointer
 ; r2: counter?
 ; r3: check or <enter>
 ; r4: store first letter of input

	.ORIG	X3000
START	LEA 	R0, PROMPT	; stores address to prompt message
	PUTS	 		; prints prompt
	AND	R2, R2, #0	; clear counter
        ADD     R3, R2, x-A     ; load enter key value
	AND	R4, R4, #0	; clear r4
	LEA	R1, WORD	; stores 20 space

INPUT	GETC			; read input
	OUT			; echo to console
	STR	R0, R1, #0	; store char in r1
	ADD	R2, R2, #1	; increment counter
	ADD	R1, R1, #1	; increment memory pointer
	ADD 	R0, R0, R3 	; check if its an enter keY
	BRnp	INPUT		; br to INPUT

	LEA	R0, RESULT
	PUTS	
	NOT	R2, R2
	ADD	R2, R2, #1	; get -R2
	ADD	R1, R1, R2	; R1 - R2 to get start of input
	ADD	R4, R1, #0	; save first letter
        ADD     R2, R2, #2      ; trying something out

OUTPUT	ADD 	R1, R1, #1	; increment memory pointer
	LDR 	R0, R1, #0	; put letter in r1 
	OUT			; echo to console
	ADD 	R2, R2, #1	; increment counter
	BRn	OUTPUT
	LDR	R0, R4, #0	; put first letter into r0
	OUT			; print it
	LD	R0, End_a	; printing "ay"
	OUT			
        LD      R0, End_y        
        OUT
        LD      R0, Newline     ; print on next line
	OUT
        BRnzp	START		; infinite loop
      
End_a 	.FILL   x61             ; "a"
End_y   .FILL   x79             ; "y"
Newline .FILL   x0A             ; new line
PROMPT	.STRINGZ "English Word: "
RESULT	.STRINGZ "Pig-Latin Word: "
WORD	.BLKW	20
	.END
