		AREA		My_code, CODE, READONLY 	
		EXPORT	__main 		
ENTRY 
__main

GPIO_BA     EQU     0x50004000
GPIOC_DOUT  EQU		GPIO_BA+0x088
GPIOE_DOUT  EQU		GPIO_BA+0x108

		LDR 	R6,=GPIOC_DOUT
		LDR 	R7,=GPIOE_DOUT		
		LDR    	R5,=0x0000FF1F	;LSB SEG
		LDR    	R0,=0x0000FF8F	;MSB SEG
		LDR		R0, =TheData
		
START	
		
		LDR    	R4,=0x0000FF62	;9
		;LDR		R3,=0x0000FFF7	;A
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C1
		LDR		R0, =TheData
		SUB		R0, R0, #4
C1
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FF02	;8
		;LDR		R3,=0x0000FFFB	;F		
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C2
		LDR		R0, =TheData
		SUB		R0, R0, #4
C2
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FFE6	;7
		;LDR		R3,=0x0000FFBF	;E
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C3
		LDR		R0, =TheData
		SUB		R0, R0, #4
C3
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FF12	;6
		;LDR		R3,=0x0000FFDF	;D
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C4
		LDR		R0, =TheData
		SUB		R0, R0, #4
C4
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FF52	;5
		;LDR		R3,=0x0000FFFE	;C
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C5
		LDR		R0, =TheData
		SUB		R0, R0, #4
C5
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FF6A	;4
		;LDR		R3,=0x0000FFEF	;B
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C6
		LDR		R0, =TheData
		SUB		R0, R0, #4
C6
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FF46	;3
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C7
		LDR		R0, =TheData
		SUB		R0, R0, #4
C7
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FF07	;2
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C8
		LDR		R0, =TheData
		SUB		R0, R0, #4
C8
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FFEE	;1
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C9
		LDR		R0, =TheData
		SUB		R0, R0, #4
C9
		BL		Loop
		ADD		R0, R0, #4
		
		LDR    	R4,=0x0000FF82	;0
		LDR		R3, [R0]
		LDR		R2,=0x0000FFEF
		CMP 	R3, R2
		BNE		C10
		LDR		R0, =TheData
		SUB		R0, R0, #4
C10
		BL		Loop
		ADD		R0, R0, #4
		
		B		START
		
		
Loop	LDR    	R2,=0X00001000
loop	SUBS	R2, #1
		LDR    	R5,=0x0000FF1F	;LSB SEG
		STR 	R5,[R6]
		STR 	R4,[R7]
		LDR    	R1,=0X00000100
L1		SUBS	R1, #1
		BNE		L1
		LDR    	R5,=0x0000FF8F	;MSB SEG
		STR 	R5,[R6]
		STR 	R3,[R7]
		LDR    	R1,=0X00000100
L2		SUBS	R1, #1
		BNE		L2
		CMP		R2, R1
		BNE		loop
		BX LR
		ALIGN
			
		AREA	My_code, DATA, READWRITE
		SPACE		5
TheData	DCD	0x0000FFF7	;A
		DCD	0x0000FFFB	;F
		DCD	0x0000FFBF	;E
		DCD	0x0000FFDF	;D
		DCD	0x0000FFFE	;C
		DCD	0x0000FFEF	;B
		
	END
