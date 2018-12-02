		AREA		My_code, CODE, READONLY 	
		EXPORT	__main 		
ENTRY 
__main

GPIO_BA     EQU     0x50004000
GPIOB_PIN   EQU     GPIO_BA+0x050       ;Pin for the switch
GPIOB_PMD	EQU		GPIO_BA+0x040
GPIOA_DOUT  EQU		GPIO_BA+0x008
GPIOC_DOUT  EQU		GPIO_BA+0x088
GPIOE_DOUT  EQU		GPIO_BA+0x108

		LDR 	R6,=GPIOC_DOUT
		LDR 	R7,=GPIOE_DOUT		
		LDR    	R5,=0x0000FF1F
		STR 	R5,[R6]
		LDR 	R6,=GPIOA_DOUT
		LDR    	R0,=0x0000FFFF
		LDR    	R5,=0x0000EFFF
		
START	
		LDR    	R4,=0x0000FF82	;0
		STR 	R4,[R7]
		STR 	R5,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FFEE	;1
		STR 	R4,[R7]
		STR 	R0,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FF07	;2
		STR 	R4,[R7]
		STR 	R5,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FF46	;3
		STR 	R4,[R7]
		STR 	R0,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FF6A	;4
		STR 	R4,[R7]
		STR 	R5,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FF52	;5
		STR 	R4,[R7]
		STR 	R0,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FF12	;6
		STR 	R4,[R7]
		STR 	R5,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FFE6	;7
		STR 	R4,[R7]
		STR 	R0,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FF02	;8
		STR 	R4,[R7]
		STR 	R5,[R6]
		BL		Loop
		
		LDR    	R4,=0x0000FF62	;9
		STR 	R4,[R7]
		STR 	R0,[R6]
		BL		Loop
		
		B		START
		
Loop	LDR    	R2,=0X00000000
		LDR    	R1,=0X00440200
loop	ADD	R2, R2, #1
		CMP	R2, R1
		BNE	loop
		BX LR
		ALIGN
		
	END
