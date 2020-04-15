section .text
	global ft_atoi_base
	extern ft_strlen

ft_atoi_base:
	mov rax, 0							; result = 0
	mov r8, 0							; sign = 0
	mov r9, 0							; base_length = 0
	mov r10, 0							; str_length = 0
	jmp check_error_base				; jump to check_error_base function

check_error_base:
	mov rcx, -1							; i = 0
	mov rbx, 0							; count = 0
	error_loop:
		inc rcx							; i++
		cmp byte [rsi + rcx], 0			; while (base[i])
		je white_space
		mov rbx, rcx					; count = i + i
		add rbx, 1						;
		base_loop:
			mov bl, byte [rsi + rbx]	
			cmp bl, 0					; while (base[count])
			je error_loop
			cmp byte [rsi + rcx], bl	; if (base[i] == base[count])
			je exit_error				;return (0)
			inc rbx						; count++
			jmp base_loop		

white_space:
	mov rax, 1							; no valido, solo para prueba, continuar aqui
	ret

exit_error:
	mov rax, 0
	ret