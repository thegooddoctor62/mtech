	AREA RESET,DATA,READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x20001000
	DCD Reset_Handler

	AREA MyCode,CODE,READONLY

	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R0, =0x20000000
    MOV R1,#1
	STRB R1,[R0],#1
	MOV R1,#0
	STRB R1,[R0],#1
	MOV R1,#1
	STRB R1,[R0],#1
	MOV R1,#0
	STRB R1,[R0],#1
	LDR R0, =0x20000000
	MOV R1,#3
hex_decimal
	LDRB R2,[R0],#1
	LSL R2,R2,R1
	ADD R3,R3,R2
	SUB R1,R1,#1
	CMP R1,#0
	BGE hex_decimal
	
	
	STRB R3,[R0],#1
	CMP R3,#10
	BGE decimal_a
	STRB R3,[R0],#1
	B octa
	
decimal_a
	MOV R2,R3
	ADD R2,#6
	STRB R2,[R0],#1
	
octa
	CMP R3,#8
	BGE octa_8
	STRB R3,[R0],#1
	B done
	
	
octa_8
	MOV R2,R3
	ADD R2,#8
	STRB R2,[R0],#1
	
done	
	END
	
	
	