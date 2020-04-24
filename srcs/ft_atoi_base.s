section .text
	global ft_atoi_base
	global ft_check_base
	global ft_pow
	extern ft_strlen
	extern ft_write

;
;		########## FT_POW FUNCTION ##########
;

ft_pow:												; ft_pow subrutine		//		ft_pow (int nbr, int base)
	mov r11, rdi									; mult = nbr
	start:
		cmp rsi, 0										; if base == 0, return 0
		je ret_zero
		cmp rsi, 1										; while (base > 1)
		ja calc_nbr
		mov rax, rdi
		ret

calc_nbr:
	imul rdi, r11
	dec rsi
	jmp start

ret_zero:
	mov rax, 1
	ret

;
;		########## FT_CHECK_BASE FUNCTION ##########
;

ft_check_base:										; ft_check_base subrutine		//		ft_check_base(char c, char *base)
	mov r11, 0										; i = 0
	while_check_base:
		cmp byte [rsi + r11], 0						; while (base[i] != '\0')
		jne check_eq_base							; jump to check_eq_base
		mov rax, -1									; return (-1)
		ret

check_eq_base:
	movzx r13, byte [rsi + r11]						
	cmp r13, rdi									; if char (c) == base [i]
	je ret_num_base									; return (i)
	inc r11											; i++
	jmp while_check_base

ret_num_base:
	mov rax, r11
	ret

;
;		########## FT_ATOI_BASE FUNCTION ##########
;

ft_atoi_base:										; ft_atoi_base function		//		ft_atoi_base(char *str, char *base)
	mov rax, 0
	mov r14, 0										; result = 0
	mov r8, 1										; sign = 1
	mov r9, -1										; base_length = -1
	mov r10, 0										; str_length = -1
	jmp check_error_base							; jump to check_error_base function

check_error_base:
	mov r12, -1										; i = -1
	mov rcx, 0										; count = 0
	error_loop:
		inc r12										; i++
		inc r9										; base_length++
		cmp byte [rsi + r12], 0						; while (base[i])
		je white_space
		cmp byte [rsi + r12], 43					; if (base[i] == '+')
		je exit_error						
		cmp byte [rsi + r12], 45					; if (base[i] == '-')
		je exit_error
		cmp byte [rsi + r12], 32					; if (base[i] == ' ')
		je exit_error								; return (0)
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
	je is_pos
	cmp byte [rdi + rcx], 45						; str[i] == '-'
	je sign_fill
	jmp check_base_length

is_pos:
	inc rcx											; if (str[i] == '+') i++
	jmp check_base_length

sign_fill:
	inc rcx											; if (str[i] == '-') i++
	mov r8, -1										; sign = -1
	jmp check_base_length

check_base_length:
	cmp r9, 1										; check if base is less or equal 1
	jle exit_error
	jmp strlen

strlen:
	mov r10, rcx									; save in r10 the value of i
	push rcx
	call ft_strlen									; call ft_strlen function
	sub rax, r10									; substract the value of i
	mov r10, rax									; r10 = strlen
	pop rcx										
	mov r14, rcx									; save (i) value
	
check_str_is_ok:
	cmp byte [rdi + rcx], 0							; while (str[i])
	je calc_result
	push rdi										; save str value
	movzx rdi, byte [rdi + rcx]
	call ft_check_base								; call ft_check_base function
	pop rdi											; recover str value
	cmp rax, -1										; if ft_check_base == -1, str is ko
	je exit_error
	inc rcx											; i++
	jmp check_str_is_ok


calc_result:
	mov rcx, r14									; recover (i) value
	mov r14, 0
	mov r12, 0
	dec r10
	while_calc:
		cmp byte [rdi + rcx], 0						; while (str[i])
		je ret_result
		push rdi
		movzx rdi, byte [rdi + rcx]
		call ft_check_base							; call ft_check_base function
		pop rdi
		mov r12, rax
		push rdi
		push rsi
		mov rdi, r9
		mov rsi, r10
		call ft_pow
		pop rsi
		pop rdi
		imul rax, r12
		add r14, rax
		inc rcx
		dec r10
		jmp while_calc

ret_result:
	imul r14, r8
	mov rax, r14
	ret

exit_error:
	mov rax, 0
	ret
