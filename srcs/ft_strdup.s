section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    mov rax, 0
    mov rcx, 0
    cmp rdi, 0
    je error
    call ft_strlen
    add rax, 1
    push rdi
    mov rdi, rax
    call malloc
    cmp rax, 0
    je error
    pop rdi
    mov rsi, rdi
	mov rdi, rax
    call ft_strcpy
    ret
error:
    mov rax, 0
    ret