section .text
	global ft_strlen

ft_strlen:
	mov rcx, 0
	while:
		cmp byte [rdi + rcx], 0
		je fin
		inc rcx
		jmp while
	fin:
		mov rax, rcx
	ret