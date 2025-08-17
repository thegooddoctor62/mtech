	AREA RESET,DATA,READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x20001000
	DCD Reset_Handler

	AREA MyCode,CODE,READONLY

	ENTRY
	EXPORT Reset_Handler

Reset_Handler

	LDR R0, =0x20000000 ;
	
	;MARKS OF STUDENT 1
	MOV R1,#01           ;
	STRB R1,[R0],#1      ; 
	MOV R1,#100          ;
	STRB R1,[R0],#1      ;  
	MOV R1,#100 ;
	STRB R1,[R0],#1      ;
	MOV R1,#100 ;
	STRB R1,[R0],#1      ;
	
	;MARKS OF STUDENT 2
	MOV R1,#02           ;
	STRB R1,[R0],#1      ;
	MOV R1,#100           ;
	STRB R1,[R0],#1      ;  
	MOV R1,#100 ;
	STRB R1,[R0],#1      ;
	MOV R1,#100 ;
	STRB R1,[R0],#1      ;
	
	;MARKS OF STUDENT 3
	MOV R1,#03           ;
	STRB R1,[R0],#1      ;
	MOV R1,#99           ;
	STRB R1,[R0],#1      ;  
	MOV R1,#99 ;
	STRB R1,[R0],#1      ;
	MOV R1,#99 ;
	STRB R1,[R0],#1      ;
	MOV R12,R0
	
	;TOTAL MARKS
	LDR R11, =0x20000001  	;
	LDRB R0,[R11],#1
	LDRB R1,[R11],#1      	;
	LDRB R2,[R11],#1	 	;
	ADD R0,R0,R1
	ADD R0,R0,R2
	ADD R11,#1
	LDRB R1,[R11],#1
	LDRB R2,[R11],#1    	;
	LDRB R3,[R11],#1		;
	ADD R1,R1,R2
	ADD R1,R1,R3
	ADD R11,#1
	LDRB R2,[R11],#1
	LDRB R3,[R11],#1      	;
	LDRB R4,[R11],#1		;
	ADD R2,R2,R3
	ADD R2,R2,R4
	
	
    LDR  R11, =0x20000000 ;
	LDR  R3,[R11],#4
	LDR  R4,[R11],#4
	LDR  R5,[R11]
	
	
	CMP R0,R1
	BGE branch_2
	MOV R6,R0	
	MOV R0,R1
	MOV R1,R6
	MOV R6,R3
	MOV R3,R4
	MOV R4,R6

branch_2
	CMP R0,R2
	BGE branch_3
	MOV R6,R0
	MOV R0,R2
	MOV R2,R6
	MOV R6,R3
	MOV R3,R5
	MOV R5,R6

branch_3
	CMP R1,R2
	BGE Sorting_done
	MOV R6,R1
	MOV R1,R2
	MOV R2,R6
	MOV R6,R4
	MOV R4,R5
	MOV R5,R6

Sorting_done
	MOV  R6,#01
    STRB R6,[R12],#1
	STR  R3,[R12],#4
	STRH R0,[R12],#2
	MOV  R6,#02
    STRB R6,[R12],#1
	STR  R4,[R12],#4
	STRH R1,[R12],#2
	MOV  R6,#03
    STRB R6,[R12],#1
	STR  R5,[R12],#4
	STRH R2,[R12],#2
	END 
