section .text
	global ft_atoi_base
	extern printf

ft_atoi_base:
	mov rax, 0										; result = 0
	mov r8, 1										; sign = 1
	mov r9, -1										; base_length = -1
	mov r10, 0										; str_length = 0
	jmp check_error_base							; jump to check_error_base function

check_error_base:
	mov r12, -1										; i = -1
	mov rcx, 0										; count = 0
	error_loop:
		inc r12										; i++
		inc r9										; base_length++
		cmp byte [rsi + r12], 0						; while (base[i])
		je white_space
		mov rcx, r12								; count = i
		add rcx, 1
			base_loop:
				mov dl, byte [rsi + rcx]
				cmp dl, 0							; while (base[count])
				je error_loop
				cmp dl, byte [rsi + r12]			; if (base[i] == base[count])
				je exit_error						; return (0)
				inc rcx								; count++
				jmp base_loop		

white_space:
	mov rcx, -1										; i = 0
	white_space_loop:
		inc rcx										; i++
		cmp byte [rdi + rcx], 32					; str[i] == ' '
		je white_space_loop
		cmp byte [rdi + rcx], 9						; str[i] == '\t'
		je white_space_loop
		cmp byte [rdi + rcx], 10					; str[i] == '\n'
		je white_space_loop
		cmp byte [rdi + rcx], 11					; str[i] == '\v'
		je white_space_loop
		cmp byte [rdi + rcx], 12					; str[i] == '\f'
		je white_space_loop
		cmp byte [rdi + rcx], 13					; str[i] == '\r'
		je white_space_loop
		jmp	check_sign

check_sign:
	cmp byte [rdi + rcx], 43						; str[i] == '+'
	je check_base_length
	cmp byte [rdi + rcx], 45						; str[i] == '-'
	je sign_fill
	jmp check_base_length

sign_fill:
	mov r8, -1										; sign = -1
	jmp check_base_length

check_base_length:
	cmp r9, 1										; check if base is less or equal 1
	jle exit_error
	jmp at_strlen

at_strlen:
	ret												; continuar aqui, calculando longitud de la cadena, corresponde a r10

exit_error:
	mov rax, 29
	ret
