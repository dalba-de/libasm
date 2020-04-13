section .text
	global ft_strcmp

ft_strcmp:
	mov rcx, 0
    mov rax, 0
    
	while:
		mov al, byte [rdi + rcx]
        mov bl, byte [rsi + rcx]
		cmp al, 0
		je fin
		cmp bl, 0
		je fin
		cmp al, bl
		jne fin
		inc rcx
		jmp while
	fin:
		movzx eax, al
        movzx ebx, bl
        sub eax, ebx
        ret