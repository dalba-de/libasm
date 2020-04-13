section .text
	global ft_strlen

ft_strlen:
	push rdi
	mov rcx, 0
	while:
		cmp byte [rdi + rcx], 0
		je fin
		inc rcx
		jmp while
	fin:
		pop rdi
		mov rax, rcx
	ret