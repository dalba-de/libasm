section .text
	global ft_list_sort

ft_list_sort:
	cmp rdi, 0
	je fin
	mov r12, [rdi]               ; ptr = *begin_list
	cmp rsi, 0
	je fin
	jmp main_loop

increment:
	mov rcx, [rdi]            	; ptr = ptr->next
	mov rbx, [rcx + 8]
	mov [rdi], rbx

main_loop:
	cmp QWORD [rdi], 0          ; while (ptr)
	je fin
	mov rcx, [rdi]               ; ptr2  = *begin_list
	mov rbx, [rcx + 8]           ; rbx = ptr2->next

sort_compare:
	cmp rbx, 0              	; while (ptr2->next)
	je increment

sort_loop:
	push rdi					
	push rsi					
	mov rax, rsi				; rcx = rsi (*cmp)
	mov rcx, [rdi]
	mov rdi, [rcx]				; rdi = ptr2->data
	mov rsi, [rbx]				; rsi = ptr2->next->data
	call rax					; call ft_strcmp
	pop rsi
	pop rdi
	cmp eax, 0					; if ((*cmp)(ptr2->data, ptr2->next->data) > 0)
	jg sort

next_increment:
	mov rcx, [rbx + 8]			; ptr2 = ptr2->next
	mov rbx, rcx
	jmp sort_compare

sort:
	mov r8, [rdi]
	mov rcx, [r8]				; next = ptr2->data
	mov rax, [rbx]
	mov [r8], rax				; ptr2->data = ptr2->next->data
	mov [rbx], rcx 				; ptr2->next->data = next
	jmp next_increment

fin:
	mov [rdi], r12				; restore value of *begin_list
	ret
