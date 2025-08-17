MOV R0, #5              ; Move immediate value 5 to R0
MOV R1, #10           	; Move immediate value 10 to R1

ADD R2, R0, R1        	; R2 = R0 + R1 => 15
ADC R3, R2, R1        	; R3 = R2 + R1 + Carry flag
SUB R4, R1, R0        	; R4 = R1 - R0 => 5
SBC R5, R1, R0        	; R5 = R1 - R0 - (1 - Carry flag)
RSB R6, R0, R1        	; R6 = R1 - R0
MUL R7, R0, R1          ; R7 = R0 * R1
AND R8, R0, R1        	; Bitwise AND between R0 and R1
ORR R9, R0, R1        	; Bitwise OR between R0 and R1
EOR R10, R0, R1         ; Bitwise XOR between R0 and R1
BIC R11, R1, R0       	; Bit Clear, R11 = R1 & ~R0
MVN R12, R0           	; Bitwise NOT of R0, stored in R12
CMP R0, R1            	; Compare R0 and R1, sets flags
CMN R0, R1            	; Compare Negative (R0 + R1), sets flags
TST R0, R1            	; Test bits, sets flags
TEQ R0, R1            	; Test Equivalence (XOR), sets flags
LSL R2, R0, #2        	; Logical Shift Left R0 by 2 bits
LSR R3, R1, #1        	; Logical Shift Right R1 by 1 bit
ASR R4, R1, #1        	; Arithmetic Shift Right R1 by 1 bit
ROR R5, R0, #4        	; Rotate Right R0 by 4 bits
RRX R6, R1            	; Rotate Right with Extend (includes Carry)
CLZ R7, R0            	; Count Leading Zeros in R0
REV R8, R0            	; Reverse byte order in R0
REV16 R9, R0          	; Reverse bytes within each halfword in R0
REVSH R10, R0         	; Reverse bytes with sign-extension

; ======================; Load and Store Instructions; ======================

LDR R0, =0x20001000   	      ; Load base address to R0
MOV R1, #25           	     	; Load immediate value 25 to R1
STR R1, [R0]          	     	; Store R1 at memory location 0x20001000

LDR R2, [R0]          	     	; Load value from 0x20001000 to R2

MOV R3, #0xAB                	; Load byte value 0xAB
STRB R3, [R0, #4]           	; Store byte at 0x20001004

LDRB R4, [R0, #4]         	; Load byte from 0x20001004 to R4

MOV R5, #0x1234          	   ; Load halfword value
STRH R5, [R0, #8]          	; Store halfword at 0x20001008

LDRH R6, [R0, #8]         	; Load halfword from 0x20001008 to R6

LDM R0!, {R7, R8}        	; Load multiple registers from memory, post-increment
STM R0!, {R9, R10}		; Store multiple registers to memory, post-increment

; ======================; Branch Instructions; ======================
subroutine
MOV R0, #5
MOV R1, #5
CMP R0, R1
BEQ equal_label       		; Branch to equal_label if R0 == R1
BNE not_equal_label   	; Branch if R0 != R1
B end_label           		; Unconditional branch

BL subroutine        		; Branch with Link (call subroutine)
BX LR                 		; Return from subroutine using link register

MOV R2, PC
BLX R2                		; Branch with Link to address in R2
equal_label
MOV R3, #100
not_equal_label
MOV R4, #200
end_label
NOP                   		; No Operation

; ======================; Additional Instructions; ======================

; Saturation Instructions
MOV R0, #50000
SSAT R1, #16, R0      	; Signed saturate to 16 bits
USAT R2, #8, R0       		; Unsigned saturate to 8 bits

; Multiply-Accumulate Long Instructions
My_function
MOV R3, #200
MOV R4, #100
MOV R5, #300
SMLAL R6, R7, R3, R4  	; Signed multiply-accumulate long: (R6,R7) = (R3*R4) + (R6,R7)
SMULL R8, R9, R3, R4  	; Signed multiply long: (R8,R9) = R3 * R4
UMLAL R10, R11, R3, R4	; Unsigned multiply-accumulate long
UMULL R12, R0, R3, R4 	; Unsigned multiply long

; Move to/from Special Register Instructions
MRS R1, CONTROL       	; Move CONTROL register value to R1
MSR CONTROL, R1      	; Move R1 value to CONTROL register

; Stack Operations
PUSH {R0, R1, R2}     	; Push registers to stack
POP {R3, R4, R5}      	; Pop registers from stack

; Subroutine and Return
BL my_function         		; Branch with Link to subroutine
BX LR                  		; Return from subroutine using link register

; ================; Data Processing Instructions with Conditional and S Suffixes; ========

MOVS R0, #5           		; Move immediate value 5 to R0, update flags
ADDEQ R1, R0, #10     	; Add if Equal (Z=1)
ADDS R2, R1, #1       	; Add and update flags
SUBNE R3, R1, R0      	; Subtract if Not Equal (Z=0)
SUBS R4, R1, #2       		; Subtract and update flags
ANDGT R5, R0, R1      	; Bitwise AND if Greater Than (N=V and Z=0)
ANDS R6, R0, R1       	; AND and update flags
ORRLT R7, R0, R1      	; Bitwise OR if Less Than (N≠V)
ORRS R8, R0, R1       	; OR and update flags
EORGE R9, R0, R1      	; XOR if Greater or Equal (N=V)
EORS R10, R0, R1      	; XOR and update flags
BICMI R11, R1, R0     	; Bit Clear if Negative (N=1)
MVNPL R12, R0         	; Bitwise NOT if Positive (N=0)

; ===============; Load and Store Instructions with Conditional Suffixes; ==============

LDR R0, =0x20001000   	; Load base address to R0
MOV R1, #25           		; Immediate value to R1
STREQ R1, [R0]        		; Store R1 at memory if Equal (Z=1)
LDRNE R2, [R0]        	; Load from memory if Not Equal (Z=0)
MOV R3, #0xAB
STRBLT R3, [R0, #4]   	; Store Byte if Less Than
LDRBLE R4, [R0, #4]   	; Load Byte if Less or Equal
MOV R5, #0x1234
STRHGE R5, [R0, #8]   	; Store Halfword if Greater or Equal
LDRHGT R6, [R0, #8]   	; Load Halfword if Greater Than
