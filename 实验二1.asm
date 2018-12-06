DATA SEGMENT
  STR1 DB 9,?,9 DUP(?)
  A DB ?
  STR2 DB 'Please input a string(lenght<9):$'
  str3 DB 10,13,'Please input the index of the char to display:$'
  str4 DB 10,13,'The char is:$'
  str5 DB 10,13,'The index is invalid!$'
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:MOV AX,DATA
      MOV DS,AX
	  LEA DX,STR2
	  MOV AH,09H
	  INT 21H
	  LEA DX,STR1
	  MOV AH,0AH
	  INT 21H
	  LEA DX,STR3
	  MOV AH,09H
	  INT 21H
	  MOV AH,01H
	  INT 21H
	  SUB AL,30H
	  CMP AL,0
	  JB ER1
	  CMP AL,[STR1+1]
	  JA ER1
	  LEA DX,STR4
	  MOV AH,09H
	  INT 21H
	  MOV AH,0
	  MOV BX,OFFSET STR1+2
	  ADD BX,AX
	  MOV DX,[BX]
	  MOV AH,02H
	  INT 21H
	  JMP NEXT
  ER1:LEA DX,STR5
	  MOV AH,09H
	  INT 21H
 NEXT:MOV AX,4C00H
	  INT 21H
CODE ENDS
  END START