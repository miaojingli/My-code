 data segment
ioc equ 28ah
ioCon equ 28bh
ioa equ 288h
lednum db 3fh,06h,5bh,4fh,66h,6dh,7dh,07h,7fh,6fh
bz dw ?
data ends
code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov dx,ioCon
	mov al,80h
	out dx,al 
again:	
	mov ax,0
	mov cx,100
sum:
	push cx
	mov bx,0
	mov bl,al
	lea si, lednum
	mov cl,[bx+si]
	mov bl,ah
	mov ch,[bx+si]
	call display
	add ax,1
	aaa
	push ax
	mov ah,1
	int 16h
	jne exit
	pop ax
	pop cx
	loop sum
	jmp again

exit:
	mov ax,4C00H
	int 21H
display proc

	push ax
	push bx
	push cx
	push dx
	mov bx,cx
	mov cx,100h
dis1:
	mov dx,ioa
	mov al,0
	out dx,al
	mov dx,ioC
	mov al,1
	out dx,al
	mov dx,ioa
	mov al,bl
	out dx,al

	call delay
	mov dx,ioa
	mov al,0
	out dx,al
	mov dx, ioC
	mov al,02
	out dx,al
	mov al,bh
	mov dx,ioa
	out dx,al	

	call delay
	loop dis1
	pop dx
	pop cx
	pop bx
	pop ax
	ret 
display endp
delay proc
push cx
mov cx,10
n:
nop
loop n
pop cx
ret
delay endp
code ends
end start












