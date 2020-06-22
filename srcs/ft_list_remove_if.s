; void	ft_list_remove_if(t_list **begin_list, void *data_ref, int(*cmp)(), void(*free_fct)(void*));

section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:
	cmp QWORD [rdi], 0
	je exit
	cmp QWORD [rdi + 8], 0
	je exit
	mov r8, [rdi]           ; list = *begin_list
	jmp first_cmp

free_list:
	mov r9, [rdi]			; r9 = *begin_list
	mov r10, [r9 + 8]		; list = *(begin_list->next)
	mov [rdi], r10			; *begin_list = list
	push rdi
	push rsi
	push rdx
	push rcx
	push r9
	push r10
	mov rdi, r9
	call rcx				; free_fct(*begin_list)
	pop r10
	pop r9
	pop rcx
	pop rdx
	pop rsi
	pop rdi

first_cmp:
	mov r9, [rdi]
	push rdi
	push rsi
	push rdx
	push rcx
	mov rdi, [r9]			; rdi = *begin_list->data
	call rdx				; cmp(*begin_list->data, data_ref)
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	cmp rax, 0				; while (cmp(*begin_list->data, data_ref) == 0)
	je free_list

break:
	mov r9, [rdi]			; list = *begin_list
	
second_cmp:
	mov r10, [r9 + 8]
	cmp r9, 0
	je exit
	cmp r10, 0
	je exit
	push rdi
	push rsi
	push rdx
	push rcx
	push r9
	push r10
	mov rdi, [r10]
	call rdx
	pop r10
	pop r9
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	cmp rax, 0
	je free_second
	mov r9, r10
	jmp second_cmp

free_second:
	push rdi
	push rsi
	push rdx
	push rcx
	push r9
	push r10
	mov rdi, r10
	mov r10, [r10 + 8]
	mov [r9 + 8], r10
	call rcx				;free_fct(list);
	pop r10
	pop r9
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	jmp second_cmp

exit:
	mov rdi, r8
	ret

;void    ft_list_remove_if(t_list **begin_list, void*data_ref, int(*cmp)(), void(*free_fct)(void*))
;{
;	t_list  *aux;
;	t_list  *list;
;	int i;
;
;	if ((*begin_list)->data == NULL)
;		return;
; 	i = 0;
;	list = *begin_list;
;	while (*begin_list && (*cmp)((*begin_list)->data, data_ref) == 0)
;	{
;		list = (*begin_list)->next;
;		free_fct(*begin_list);
;		*begin_list = list;
;	}
;	list = *begin_list;
;	while (list != NULL)
;	{
;		aux = list->next;
;		if (aux && (*cmp)(aux->data, data_ref) == 0)
;		{
;	  		free_fct(aux);
;			aux = aux->next;
;			list->next = aux;
;	  		i = 0;
;		}
;		if (i > 0)
;			list = aux;
;		i++;
;  	}
;}