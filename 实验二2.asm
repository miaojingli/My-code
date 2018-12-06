DATA SEGMENT
  strmess db 'please input a string(length<9):$'
  nummess db 0ah,0dh,'please input the number of the char you want to display:$'
  charmess db 0ah,0dh,'the char is:$'
  errmess1 db 0ah,0dh,'the length of the string you input error!$'
  errmess2 db 0ah,0dh,'the number you input is too large!$'
  buf db 20 dup(0)
  num db ?
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:MOV AX,DATA
      MOV DS,AX
input0:lea dx,strmess
	  mov ah,09h
	  int 21H
	  
	  mov bx,0
input1:mov ah,1
	  int 21H
	  mov buf[bx],al
	  inc bx
	  cmp al,0dh
	  jnz input1
	  cmp bx,0
	  jbe err
	  cmp bx,9
	  jbe con
  err:lea dx,errmess1
      mov ah,09h
	  int 21H
	  
	  mov dl,0ah
	  mov ah,2
	  int 21H
	  mov dl,0dh
	  mov ah,2 
	  int 21H
	  
	  jmp input0
  con:lea dx,nummess
      mov ah,09h
	  int 21H
	  
	  mov ah,01h
	  int 21H
	  sub al,30h
	  mov ah,0 
	  mov num,al
	  cmp ax,bx
	  jb con2
	  
	  lea dx,errmess2
	  mov ah,09h
	  int 21H
	  jmp con
	  
 con2:lea dx,charmess
      mov ah,09h
	  int 21H
	  
	  mov bl,num
	  mov bh,0
	  mov dl,buf[bx]
	  mov ah,02h
	  int 21H
      MOV AX,4C00H
	  INT 21H
CODE ENDS
  END START