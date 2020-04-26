section .text
	global ft_atoi_base
	global ft_check_base
	global ft_pow
	extern ft_strlen

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
	mov r8, 0										; sign = 1
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
		cmp byte [rsi + r12], 9						; if (base[i] == '\t')
		je exit_error
		cmp byte [rsi + r12], 10					; if (base[i] == '\n')
		je exit_error
		cmp byte [rsi + r12], 11					; if (base[i] == '\v')
		je exit_error
		cmp byte [rsi + r12], 12					; if (base[i] == '\f')
		je exit_error
		cmp byte [rsi + r12], 13					; if (base[i] == '\r')
		je exit_error
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

is_neg:
	inc r8											; sign '-' ++
	inc rcx											; if (str[i] == '-') i++
	jmp check_sign

is_pos:
	inc rcx											; if (str[i] == '+') i++
	jmp check_sign

check_sign:
	cmp byte [rdi + rcx], 43						; str[i] == '+'
	je is_pos
	cmp byte [rdi + rcx], 45						; str[i] == '-'
	je is_neg
	jmp sign_fill

sign_fill:
	xor rdx, rdx									; rdx = 0
	mov rax, r8										; r8 % 2
	mov r8, 2
	div r8
	cmp rdx, 0
	je	sign_pos									; if r8 % 2 == 0 ---> sign = 1
	jmp sign_neg									; if r8 % 2 > 0  ---> sign = -1

sign_pos:
	mov r8, 1
	jmp check_base_length

sign_neg:
	mov r8, -1
	jmp check_base_length

check_base_length:
	cmp r9, 1										; check if base is less or equal 1
	jle exit_error
	mov r14, rcx
	jmp check_strlen

check_strlen:
	cmp byte [rdi + rcx], 0							; while (str[i])
	je calc_result
	push rdi										; save str value
	movzx rdi, byte [rdi + rcx]
	call ft_check_base								; call ft_check_base function
	pop rdi											; recover str value
	cmp rax, -1										; if ft_check_base == -1, str is ko
	je calc_result
	inc r10
	inc rcx											; i++
	jmp check_strlen


calc_result:
	mov rcx, r14									; recover (i) value
	mov r14, 0
	mov r12, 0
	dec r10											; str_length--
	while_calc:
		cmp byte [rdi + rcx], 0						; while (str[i])
		je ret_result
		cmp r10, 0									; while (str_length >= 0)
		jl ret_result
		push rdi									; save rdi value
		movzx rdi, byte [rdi + rcx]
		call ft_check_base							; call ft_check_base function
		pop rdi
		mov r12, rax
		push rdi
		push rsi
		mov rdi, r9
		mov rsi, r10
		call ft_pow									; call ft_pow function
		pop rsi
		pop rdi
		imul rax, r12
		add r14, rax								; result += (ft_check_base(str[i], base) * ft_pow(base_l, str_l))
		inc rcx										; i++
		dec r10										; str_length--
		jmp while_calc

ret_result:
	imul r14, r8
	mov rax, r14
	ret

exit_error:
	mov rax, 0
	ret
