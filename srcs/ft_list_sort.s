section .text
	global ft_list_sort
	extern ft_write

ft_list_sort:
	mov r8, [rdi]               ; ptr = *begin_list
	jmp main_loop

main_increment:
	mov r9, [rdi]            	; ptr = ptr->next
	mov r10, [r9 + 8]
	mov [rdi], r10

main_loop:
	cmp QWORD [rdi], 0          ; while (ptr)
	je fin
	mov r9, [rdi]               ; ptr2  = *begin_list
	mov r10, [r9 + 8]           ; r10 = ptr2->next

sort_compare:
	cmp r10, 0              	; while (ptr2->next)
	je main_increment

sort_loop:
	push rdi					
	push rsi					
	mov rcx, rsi				; rcx = rsi (*cmp)
	mov rdi, [r9]				; rdi = ptr2->data
	mov rsi, [r10]				; rsi = ptr2->next->data
	call rcx					; call ft_strcmp
	pop rsi
	pop rdi
	cmp rax, 0					; if ((*cmp)(ptr2->data, ptr2->next->data) > 0)
	jg sort
	jmp next_increment

next_increment:
	mov r10, [r10 + 8]			; ptr2 = ptr2->next
	jmp sort_compare

sort:
	mov r11, [r9]				; next = ptr2->data
	mov r12, [r10]
	mov [r9], r12				; ptr2->data = ptr2->next->data
	mov [r10], r11 				; ptr2->next->data = next
	jmp next_increment

fin:
	mov [rdi], r8				; restore value of *begin_list
	ret

debug:
	push rdi
	push rsi
	push rcx
	push r9
	mov rdi, 1
	mov rsi, rax
	mov rdx, 1
	call ft_write
	pop r9
	pop rcx
	pop rsi
	pop rdi
	jmp next_increment
