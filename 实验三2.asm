data segment
str1 db 'please enter a number:$'
str2 db 'the sum is:$'
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
      mov ds,ax
	  mov al,30h
	  mov cl,0
	  in1:sub al,30h
	  add al,cl
	  daa
	  mov cl,al
	  call input
	  cmp al,0dh
	  jnz in1
	  mov ch,cl
	  lea dx,str2
	  mov ah,09h
	  int 21h
	  mov dl,cl
	  add dl,0fh
	  mov cl,4
	  shr dl,cl
	  add dl,30h
	  mov ah,2
	  int 21h
	  mov dl,ch
	  and dl,0fh
	  add dl,30h
	  mov ah,02h
	  int 21h
	  mov ax,4c00h
	  int 21h
	  
	  input proc
	  lea dx,str1
	  mov ah,09h
	  int 21h
	  mov ah,01h
	  int 21h
	  push ax
	  mov dl,0ah
	  mov ah,02h
	  int 21h
	  mov dl,0dh
	  mov ah,02h
	  int 21h
	  pop ax
	  ret
input endp	  
code ends
end start