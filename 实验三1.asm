data segment
list dw 5,20h,30h,40h,50h,60h
x dw 36h
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
      mov ds,ax
	  mov ax,x
	  lea bx,list
	  mov cx,[bx]
bijiao:add bx,2
	  cmp ax,[bx]
	  jc jh
	  loop bijiao
   jh:xchg ax,[bx]
	  add bx,2
	  loop jh
	  mov [bx],ax
	  inc word ptr list
	  mov ax,4c00h
	  int 21h
code ends
end start